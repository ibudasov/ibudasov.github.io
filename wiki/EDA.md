# EDA

## Message bus 

![](https://imgopt.infoq.com/fit-in/3000x4000/filters:quality(85)/filters:no_upscale()/articles/event-driven-architecture-clouds/en/resources/35figure-1-1687173481115.jpg)

### Criteria
- managed service - so no RabbitMQ. However, we keep Zero MQ, because it might be useful for dev purposes
- Event Grid is excluded because of it got different purpose: Message routing between Azure Services
- Event Hub is excluded because of it got different purpose: Event Ingestion

### Assumptions
- Azure Service Bus looks pretty much the same as Confluent Kafka. We will get into details if we decide to go with ASB

### Options overview

| Criteria                           | Azure Service bus         | Azure Queue             | Azure Queue Storage                          | ZeroMQ         |
|------------------------------------|---------------------------|-------------------------|----------------------------------------------|----------------|
| Purpose                            | Prod/con message broker | MQ, Part of Service Bus | Blob storage, less features, more durability | MQ             |
| Guarantee of delivery              | Yes                       | Yes                     | Yes                                          | Yes            |
| Order of messages                  | Yes                       | Yes                     | Yes                                          | Yes            |
| Idempotency                        | Yes                       | Yes                     | Yes                                          | Yes            |
| Topics                             | Yes                       | Yes                     | No                                           | Yes            |
| Messaging protocol                 | AMQP and MQTT             | AMQP and HTTP           | HTTP/REST                                    | TCP,PGM,IPC    |
| Pub/Sub                            | Yes                       | Yes                     | No                                           | Yes            |
| Distributed transactions           | NO, but "exactly once"    | Yes                     | No                                           | Yes            |
| Durability                         | Yes                       | Yes                     | Yes                                          | Yes            |
| Time-series last value             | No                        | No                      | No                                           | Yes            |
| Dead letter Q                      | Yes                       | Yes                     | Yes                                          | No             |
| Persistence until consumed         | Yes                       | Yes                     | No                                           | No             |
| Event Store for processed messages | Yes                       | No                      | No                                           | No             |
| Batching                           | Yes                       | Yes                     | Yes                                          | Yes            |
| Message versioning                 | With Protobuff            | With Protobuff          | With Protobuff                               | With Protobuff |

### Related patterns

- Competing Consumers pattern. Multiple consumers might need to compete to read messages from a queue. This pattern explains how to process multiple messages concurrently to optimize throughput, to improve scalability and availability, and to balance the workload.
- Priority Queue pattern. For cases where the business logic requires that some messages are processed before others, this pattern describes how messages posted by a producer with a higher priority are received and processed more quickly by a consumer than messages of a lower priority.
- Queue-based Load Leveling pattern. This pattern uses a message broker to act as a buffer between a producer and a consumer to help to minimize the impact on availability and responsiveness of intermittent heavy loads for both those entities.
- Retry pattern. A producer or consumer might be unable connect to a queue, but the reasons for this failure might be temporary and quickly pass. This pattern describes how to handle this situation to add resiliency to an application.
- Scheduler Agent Supervisor pattern. Messaging is often used as part of a workflow implementation. This pattern demonstrates how messaging can coordinate a set of actions across a distributed set of services and other remote resources, and enable a system to recover and retry actions that fail.
- Choreography pattern. This pattern shows how services can use messaging to control the workflow of a business transaction.
Claim-Check pattern. This pattern shows how to split a large message into a claim check and a payload.

### Links
- https://learn.microsoft.com/en-us/azure/architecture/guide/architecture-styles/event-driven
- https://learn.microsoft.com/en-us/azure/architecture/guide/architecture-styles/microservices
- https://learn.microsoft.com/en-us/azure/architecture/guide/technology-choices/messaging 
- https://learn.microsoft.com/en-us/azure/service-bus-messaging/compare-messaging-services
- https://learn.microsoft.com/en-us/azure/event-hubs/event-hubs-federation-overview 
