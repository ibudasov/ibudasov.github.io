# Azure Queue Storage (AQS) vs. Azure Service Bus (ASB)

## Context 

- We are looking to have a message broker for EDA of Booking service
- We would like to 
  - have it managed by Azure or other supplier
  - in perspective to upgrate to ASB, because we believe its features will be useful for us
  - integrate well with [Azure Functions (AF)](https://azure.microsoft.com/en-us/products/functions/) and [Azure Container Apps (ACA)](https://learn.microsoft.com/en-us/azure/container-apps/overview). Primarily we are interested in integration with AF, because this is what we are planning to use. 
  - fincancially efficient
  - **POSTPONED** have certain features, which are needed for EDA. Postponed due to lack of usecases
    - **Event Storage** - at least until they are processed
    - **Stream processing** - filtering, transformation, aggregation
    - **Interoperability** - various producers and consumers
    - **HA**
    - **Ordering guarantee** - important for EDA

## The Goal

- Enable asynchronous messages processing **inside** of Booking service
  - Messages will be received via REST API and pushed to the Queue
  - Message broker is not exposed outside for producing/consumig messages

## [Azure Queue Storage](https://learn.microsoft.com/en-us/azure/storage/queues/storage-queues-introduction)

- A queue per storage account, per AF. Multiple topics
- [~20,000](https://learn.microsoft.com/en-us/azure/storage/common/scalability-targets-standard-account?toc=%2Fazure%2Fstorage%2Fqueues%2Ftoc.json) RPS (create, peek, delete, etc)
- Each message can be up to 64 KB in size
- Supports Azure AD and Shared Key authentication
- Visibility Timeout: This is the amount of time that a message is invisible in the queue after a read operation. This prevents other consumers from processing the same message concurrently
- Dequeue Count: This is the number of times a message has been retrieved from the queue
- TTL (Time-To-Live): This is the period of time during which a message will remain in the queue. After this period, the message will be automatically deleted
- Peek: This operation allows you to view the message at the front of the queue without removing it.
- Pop Receipt: This is a token that must be provided to update or delete a message that has been read. It is returned in the response of a successful Get Message operation
- A message can remain in the queue for a maximum of 7 days
- [NodeJS library](https://learn.microsoft.com/en-us/azure/storage/queues/storage-quickstart-queues-nodejs?tabs=passwordless%2Croles-azure-portal%2Cenvironment-variable-windows%2Csign-in-azure-cli)

## How AQS works

- An application adds a message to a queue
- AF is set up with a Queue Storage trigger
- When a new message arrives in the queue, Azure Functions triggers the execution of the code. The message is passed as input to the function
- The function executes its code, like processing the data in the message
- Once the function is done processing, it can delete the message from the queue to indicate successful completion

## Questions to answer

1. Can we upgrade from AQS to Azure Service Bus (ASB) without dramatic changes to AF? Yes, and this is why:
    - Both of them use `push` model. AF will be triggered when the new message is posted.
    - Protocols technically are different, but this difference is eliminated due to trigger mechanism, provided by Azure
    - As the result, AF will receive message body in both cases the same way
2. What are the costs associated with AQS and ASB, and how do they compare? Storage was not taken in account, as it is not relevant for our usecase ($0.045-$0.06 per GB per month)
    - ASB - Shared capacity, priced at [USD 0.05](https://azurelessons.com/azure-service-bus-pricing/) per 1 million operations per month. There is a possibility to upgrade to Standard: Dedicated capacity at a fixed price (approximately USD 668 per month)
    - AQS - [USD 0.04](https://azure.microsoft.com/en-us/pricing/details/storage/queues/) per 1 million operations
3. How difficult is to setup ASB & AQS?
    - ASB - there is a TF module for provisioning `azurerm_servicebus_namespace` and `azurerm_servicebus_queue`. Then a trigger of AF needs to be set up
    - AQS - we have a [module](https://dev.azure.com/cvce/Cloud_Infrastructure/_git/terraform-azurerm-milence?path=/azure_function/main.tf&version=GBmain&_a=contents) which can be extended with [AQS configuration](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_queue). Then a trigger of AF needs to be set up
4. Do they both suport message ordering? It might be important for correct message processibg, especially given the nature of booking
    - ASB - FIFO
    - AQS - FIFO not guaranteed, but by setting the visibility timeout to a large value, you can ensure that messages are processed in the order they were added, as long as no messages fail to be processed. But this is not a foolproof method and does not guarantee strict FIFO ordering.

## Excluded options

- ZeroMQ might be useful for dev purposes, but due to use of AF and its ephemeral nature it is impossible. Currently we are discussing a possibility of using ACA, which would enable ZeroMQ
- Event Grid is excluded because of it got different purpose: Message routing between Azure Services
- Event Hub is excluded because of it got different purpose: Event Ingestion

## Proposal

Considering, that price for both services is more or less equal, and the complexity of the setup is not much different, it would make sense to go with ASB, as it is designed especially for our usecase and shines with features like guaranteed FIFO, deduplication and parallel processing. 

## Resources
- Pretty [relevant example](https://learn.microsoft.com/en-us/samples/azure-samples/serverless-microservices-reference-architecture/serverless-microservices-reference-architecture/) 