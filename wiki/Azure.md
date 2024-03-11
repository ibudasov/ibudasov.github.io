# VPN Gateway

Azure VPN Gateway is a service that can be used to send encrypted traffic between an Azure virtual network and on-premises locations over the public Internet. 

Types:
- Site-to-site connection: A cross-premises IPsec/IKE VPN tunnel connection between the VPN gateway and an on-premises VPN device.
- Point-to-site connection: VPN over OpenVPN, IKEv2, or SSTP. This type of connection lets you connect to your virtual network from a remote location, such as from a conference or from home.
- VNet-to-VNet: An IPsec/IKE VPN tunnel connection between the VPN gateway and another Azure VPN gateway that uses a VNet-to-VNet connection type. This connection type is designed specifically for VNet-to-VNet connections.
- Site-to-site connection: An IPsec/IKE VPN tunnel connection between the VPN gateway and another Azure VPN gateway. This type of connection, when used in the VNet-to-VNet architecture, uses the Site-to-site (IPsec) connection type, which allows cross-premises connections to the gateway in addition connections between VPN gateways.

Azure VPN Gateway is not always the best solution for connecting an on-premises environment to the cloud. Azure ExpressRoute is a dedicated, high-speed private connection between an on-premises network and Microsoft cloud services

- https://learn.microsoft.com/en-us/training/modules/intro-to-azure-vpn-gateway/
- https://learn.microsoft.com/en-us/azure/vpn-gateway/vpn-gateway-about-vpngateways


# Azure WAN

Azure Virtual WAN is a networking service that brings many networking, security, and routing functionalities together to provide a single operational interface. Some of the main features include:

- Branch connectivity (via connectivity automation from Virtual WAN Partner devices such as SD-WAN or VPN CPE).
- Site-to-site VPN connectivity.
- Remote user VPN connectivity (point-to-site).
- Private connectivity (ExpressRoute).
- Intra-cloud connectivity (transitive connectivity for virtual networks).
- VPN ExpressRoute inter-connectivity.
- Routing, Azure Firewall, and encryption for private connectivity.

The Virtual WAN architecture is a hub and spoke architecture with scale and performance built in for branches (VPN/SD-WAN devices)

## Virtual WAN resources
To configure an end-to-end virtual WAN, you create the following resources:

https://learn.microsoft.com/en-us/azure/virtual-wan/virtual-wan-about
https://learn.microsoft.com/en-us/azure/virtual-wan/virtual-wan-locations-partners

- Virtual WAN: The virtualWAN resource represents a virtual overlay of your Azure network and is a collection of multiple resources. It contains links to all your virtual hubs that you would like to have within the virtual WAN. Virtual WANs are isolated from each other and can't contain a common hub. Virtual hubs in different virtual WANs don't communicate with each other.
- Hub: A virtual hub is a Microsoft-managed virtual network. The hub contains various service endpoints to enable connectivity. From your on-premises network (vpnsite), you can connect to a VPN gateway inside the virtual hub, connect ExpressRoute circuits to a virtual hub, or even connect mobile users to a point-to-site gateway in the virtual hub. The hub is the core of your network in a region. Multiple virtual hubs can be created in the same region.
- A hub gateway isn't the same as a virtual network gateway that you use for ExpressRoute and VPN Gateway. For example, when using Virtual WAN, you don't create a site-to-site connection from your on-premises site directly to your VNet. Instead, you create a site-to-site connection to the hub. The traffic always goes through the hub gateway. This means that your VNets don't need their own virtual network gateway. Virtual WAN lets your VNets take advantage of scaling easily through the virtual hub and the virtual hub gateway.
- Hub virtual network connection: The hub virtual network connection resource is used to connect the hub seamlessly to your virtual network. One virtual network can be connected to only one virtual hub.
- Hub-to-hub connection: Hubs are all connected to each other in a virtual WAN. This implies that a branch, user, or VNet connected to a local hub can communicate with another branch or VNet using the full mesh architecture of the connected hubs. You can also connect VNets within a hub transiting through the virtual hub, as well as VNets across hub, using the hub-to-hub connected framework.
- Hub route table: You can create a virtual hub route and apply the route to the virtual hub route table. You can apply multiple routes to the virtual hub route table.

Additional Virtual WAN resources

Site: This resource is used for site-to-site connections only. The site resource is vpnsite. It represents your on-premises VPN device and its settings. By working with a Virtual WAN partner, you have a built-in solution to automatically export this information to Azure.

# VWAN + VPM Gateway

https://learn.microsoft.com/en-us/azure/virtual-wan/connect-virtual-network-gateway-vwan

elationship between Azure VPN Gateway and Azure Virtual WAN.

1. Azure VPN Gateway:
- The Azure VPN Gateway is a service that allows you to connect your on-premises networks to Azure securely. It enables Site-to-Site (S2S) VPNs in a similar way to how you would set up and connect to a remote branch office.
- It uses industry-standard protocols such as IPsec (Internet Protocol Security) and IKE (Internet Key Exchange) to establish secure connections between your on-premises network and Azure resources.
- Organizations often deploy S2S VPNs to connect branch offices to the same Azure Virtual Network (VNet) while the main corporate WAN (Wide Area Network) is accessed via ExpressRoute. In case of connectivity issues with ExpressRoute, the corporate WAN may also use S2S VPN as a backup path1.
2. Azure Virtual WAN:
- Azure Virtual WAN is a networking service that simplifies and optimizes connectivity for branch offices, remote users, and Azure resources.
- It allows you to create a virtual hub that acts as a central point for connecting various network resources.
- Key features of Azure Virtual WAN include:
  - Transit connectivity: Full transit between branches, sites, mobile users, and services using Azure’s global infrastructure.
  - Integration with SD-WAN: You can run SD-WAN virtual appliances natively in Azure Virtual WAN2.
  - User VPN (point-to-site) support: Provides secure connectivity for remote users to Azure resources3.

Remember that the terminology distinguishes between VPN Gateway virtual network gateway and Virtual WAN VPN gateway to minimize confusion between the two features4. These services work together to provide secure and efficient connectivity within your Azure environment.


# RBAC

do with Azure RBAC:
- Allow an application to access all resources in a resource group.
- Allow one user to manage VMs in a subscription, and allow another user to manage virtual networks.
- Allow a database administrator (DBA) group to manage SQL databases in a subscription.
- Allow a user to manage all resources in a resource group, such as VMs, websites, and subnets.

Object model
- Security principal	An object that represents something that requests access to resources.
- Role definition	A set of permissions that lists the allowed operations. Azure RBAC comes with built-in role definitions, but you can also create your own custom role definitions.
- Scope	The boundary for the requested level of access, or "how much" access is granted.
- Assignment	An assignment attaches a role definition to a security principal at a particular scope. Users can grant the access described in a role definition by creating (attaching) an assignment for the role.

## Role definition
![alt text](https://learn.microsoft.com/en-us/training/wwl-azure/configure-role-based-access-control/media/role-definition-bf297cac.png)

- Actions permissions identify what actions are allowed.
- NotActions permissions specify what actions aren't allowed.
- DataActions permissions indicate how data can be changed or used.
- AssignableScopes permissions list the scopes where a role definition can be assigned.

## Role Assignment

![alt text](https://learn.microsoft.com/en-us/training/wwl-azure/configure-role-based-access-control/media/role-assignment-040eb1ab.png)

![alt text](https://learn.microsoft.com/en-us/training/wwl-azure/configure-role-based-access-control/media/role-based-authentication-b3dda7ae.png)
- Microsoft Entra admin roles are used to manage resources in Microsoft Entra ID, such as users, groups, and domains. These roles are defined for the Microsoft Entra tenant at the root level of the configuration.
- Azure RBAC roles provide more granular access management for Azure resources. These roles are defined for a requestor or resource and can be applied at multiple levels: the root, management groups, subscriptions, resource groups, or resources.


# Azure Policy

![alt text](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-policy/media/management-groups-aa92c04a.png)

Considerations
- custom hierarchies and groups. Align your Azure subscriptions by using custom hierarchies and grouping that meet your company's organizational structure and business scenarios. 
- Consider policy inheritance. 
- Consider compliance rules for different departments
- Cost reporting 
- Consider deployable resources — what precisely can be deployed
- Consider location restrictions — where can be deployed
- Consider rules enforcement — required tags or allowed values

Create a policy
![alt text](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-policy/media/implement-azure-policy-b4a4a47c.png)

- Step 1: Create policy definitions
- Step 2: Create an initiative definition. An initiative definition has one or more policy definitions. 
- Step 3: Scope the initiative definition. The scope determines what resources or grouping of resources are affected by the conditions of the policies.
- Step 4: Determine compliance — You have your policies defined, your initiative definition created, and your policies assigned to affected resources. The last step is to evaluate the state of compliance for your scoped resources.


# Subscription

An Azure subscription is a logical unit of Azure services that's linked to an Azure account. An Azure account is an identity in Microsoft Entra ID or a directory that's trusted by Microsoft Entra ID, such as a work or school account. Subscriptions help you organize access to Azure cloud service resources, and help you control how resource usage is reported, billed, and paid.

![alt text](https://learn.microsoft.com/en-us/training/wwl-azure/configure-subscriptions/media/azure-subscriptions-e855533e.png)

Features 
- Every Azure cloud service belongs to a subscription.
- Each subscription can have a different billing and payment configuration.
- Multiple subscriptions can be linked to the same Azure account.
- More than one Azure account can be linked to the same subscription.
- Billing for Azure services is done on a per-subscription basis.
- If your Azure account is the only account associated with a subscription, you're responsible for the billing requirements.
- Programmatic operations for a cloud service might require a subscription ID.

How to save money

- Reservations — Save money by paying ahead. 
- Azure Credits — Use the monthly credit benefit to develop, test, and experiment with new solutions on Azure.
- Azure regions —	Compare pricing across regions. Pricing can vary from one region to another
- Budgets	— Apply the budgeting features in Microsoft Cost Management to help plan and drive organizational accountability. With budgets, you can account for the Azure services you consume or subscribe to during a specific period. 

# Entra ID

![alt text](https://learn.microsoft.com/en-us/training/wwl-azure/configure-azure-active-directory/media/azure-active-directory-a3b1df09.png)

- for internal SaaS applications
- for the apps developed inside of the org
- similar to Active Directory on-prem, but in the cloud

Features
- SSO
- all the platforms
- secure remote access by other apps
- sensitive data protection
- self-service

Object Model
- Identity — An identity is an object that can be authenticated. The identity can be a user with a username and password. Identities can also be applications or other servers that require authentication by using secret keys or certificates.
- Account — An account is an identity that has data associated with it.
- Microsoft Entra account — An Azure AD account is an identity that's created through Microsoft Entra ID or another Microsoft cloud service, such as Microsoft 365.
- Azure tenant (directory) — An Azure tenant is a single dedicated and trusted instance of Microsoft Entra ID. Each tenant (also called a directory) represents a single organization. When your organization signs up for a Microsoft cloud service subscription, a new tenant is automatically created.
- Subscription — An Azure subscription is used to pay for Azure cloud services. Each subscription is joined to a single tenant. You can have multiple subscriptions.

AD vs Entra ID

- Identity solution: AD DS is primarily a directory service, while Microsoft Entra ID is a full identity solution. 
- Communication protocols: Because Microsoft Entra ID is based on HTTP and HTTPS, it doesn't use Kerberos authentication. Microsoft Entra ID implements HTTP and HTTPS protocols, such as SAML, WS-Federation, and OpenID Connect for authentication (and OAuth for authorization).
- Federation services: Microsoft Entra ID includes federation services, and many third-party services like Facebook.
- Flat structure: Microsoft Entra users and groups are created in a flat structure. 
- Managed service: Microsoft Entra ID is a managed service. You manage only users, groups, and policies. 

User Account types
- Cloud ID — A user account with a cloud identity is defined only in Microsoft Entra ID. 
- Directore synchronized ID — User accounts that have a directory-synchronized identity are defined in an on-premises Active Directory
- Guest User — Guest user accounts are defined outside Azure. Examples include user accounts from other cloud providers, and Microsoft accounts like an Xbox LIVE account. 

# RBAC

> RBAC uses an allow model for access. By default everything is forbidden. Roles summarize: `read` + `write` might come from 2 different roles

- Allow one user to manage VMs in a subscription and another user to manage virtual networks.
- Allow a database administrator (DBA) group to manage SQL databases in a subscription.
- Allow a user to manage all resources in a resource group, such as VMs, websites, and virtual subnets.
- Allow an application to access all resources in a resource group.


# Policies

- use a policy to restrict to which Azure regions you can deploy resources.
- use a policy to restrict which types of virtual machine sizes can be deployed. 
- use a policy to enforce naming conventions

# PowerShell

- can be connected to your Account/Subscription
- got 
  - `cmdlet`, which are modules
    - modules can be installed and reused 
- can do scripting (base for cmdlets)
- can do pyping `$vm | Get-AzVMSize`
- command outputs are objects `$vm = (Get-AzVM -Name "testvm-eus-01" -ResourceGroupName learn-bce21a4b-3352-4e88-8d15-680d3dc88c35)` 
- Can be assigned to a variable, and then output as a whole or a part of it, a property `$vm.StorageProfile.OsDisk` 

# Resource Manager

> 💡 You can download resources as ARM JSON, edit it and redeploy

> 💡 Use parameters for settings that vary according to the environment

## Resource Groups
 are at their simplest a logical collection of resources. There are a few rules for resource groups.
- Resources can only exist in one resource group.
- Resource Groups cannot be renamed.
- Resource Groups can have resources of many different types (services).
- Resource Groups can have resources from many different regions.
- If you delete a resource group, all resources contained within the group are also deleted.
- There are a few factors that can play into the strategy you use to organize resources:
  - **Authorizatios**: Because resource groups are a scope of RBAC, you can organize resources by who needs to administer them.
  - **Lifecycle**: If you delete a resource group, you also delete all the resources in the group. Use this to your advantage, especially in areas where resources are more disposable, like non-production environments.
  - **Billing**: placing resources in the same resource group is a way to group them for usage in billing reports.

## Tags
 Use them for
- department (like finance, marketing, and more)
- environment (prod, test, dev)
- cost center
- lifecycle and automation (like shutdown and startup of virtual machines)
- use Azure Policy to automatically add or enforce tags for resources

## Temlates benefits
- Templates improve consistency. 
- Templates help express complex deployments.
- Templates reduce manual, error-prone tasks.
- Templates are code.
- Templates promote reuse
- Templates are linkable. 
- Templates simplify orchestration

## Bicep
- is a domain-specific language (DSL) that uses declarative syntax 
- is an abstraction over JSON of ARM
- got:
  - Simpler syntax
  - Modules
  - Auto dependency management
  - Type validation

# Azure VWAN

Azure Virtual WAN is a networking service that allows you to centrally manage and configure routing for your hybrid and multicloud networks. With Virtual WAN, you can connect multiple virtual networks together under a single routing construct called a Virtual WAN hub. This hub acts as a central point that connects all of your spokes (virtual networks) together.

- **Hub-spoke topology** - Allows you to connect multiple virtual networks (spokes) back to a central routing point (hub). This simplifies connectivity and routing management.
- **Built-in VPN gateway support** - Lets you connect your on-premises networks to the Virtual WAN hub using Azure VPN gateways.
- **Centralized routing** - Routing policies are defined centrally at the hub so all spokes inherit the same routing behavior and connectivity. This replaces the need to configure routing individually at each spoke.
- **Integration with Azure security services** - You can integrate the Virtual WAN hub with services like Azure Firewall to filter and inspect traffic centrally as it passes through the hub.
- **Transitive routing** - Traffic can flow "through" the hub between any two spokes without having to egress and re-enter the hub. This simplifies connectivity between spokes.

# Quickstart

```sh
# https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-macos
brew update && brew install azure-cli

echo "autoload bashcompinit && bashcompinit" >> ~/.zshrc
echo "source $(brew --prefix)/etc/bash_completion.d/az" >> ~/.zshrc


# https://learn.microsoft.com/en-us/azure/developer/terraform/authenticate-to-azure?tabs=bash
az login
az account list --query "[?user.name=='igor.budasov@gmail.com'].{Name:name, ID:id, Default:isDefault}" --output Table

az account set --subscription "4167d2fe-8b0c-banaan-acbe-0b613ec53c33"

# https://learn.microsoft.com/en-us/azure/active-directory/role-based-access-built-in-roles
az ad sp create-for-rbac --name terraform-principal --role Owner --scopes /subscriptions/___________

export ARM_SUBSCRIPTION_ID="xxxxxxxx"
export ARM_TENANT_ID="xxxxx"
export ARM_CLIENT_ID="xxxxxx"
export ARM_CLIENT_SECRET="xxxxxxx"
```

# Azure ServiceBus

Azure Service Bus is a fully managed messaging and queuing service provided by Microsoft Azure. It allows applications and services to communicate over reliable messaging sessions. 

- **Messaging protocols**: It supports industry standard protocols like AMQP and MQTT, allowing communication with a wide variety of clients across platforms and devices.
- **Queues and topics**: Service Bus provides queues for point-to-point communication between sender and receiver. It also offers publish/subscribe capabilities using topics and subscriptions.
- **Reliability and scalability**: Messages are stored reliably with duplicate detection even in case of regional outages. It can easily scale to handle large volumes of messages.
- **Security and access control**: Service Bus offers features like authentication, authorization and encryption to secure communication between applications.
- **Integration**: It integrates well with other Azure services and on-premises systems. Events can be processed using services like Stream Analytics, Functions etc.
- **Pricing**: It has a pay-as-you-go model based on the number of messages and storage used. No upfront costs or long-term commitments.

## Features

- Distributed transactions do not work in the cloud. Because there is no perfect transaction coordinator, and you cannot have XA transactio. JMS transactions are the alternative
- Works with generic AMQP 1.0 — one of them is RabbitMQ
- 99.995%

### Queues
- Exclusive lock for messages picked up by the consumers. This is not what Event Brokers like Kafka have. For Kafka the most important thing is the order. for ASB — exclusivity. This is why it is great for processing jobs. https://www.youtube.com/watch?v=LM7DByKOHBs 
- Can buffer messages
- Dead letter queue
- Scheduled messages
- Deferred messages — breaks the order of processing messages. Keeps the message save in the queue and processes it later
- For low traffic queues there is a mechanism to have no listeners, but to publish an event about non-handled messages to EventGrid. This would wake up a Function App and it will pick up the message. Basically, the consumer on-call. Saves costs
- Sessions — gives endless number of subqueues. Locks all the messages with this sessionId. Build for many concurrent workflows. You cannot build a separate queue for each of them. SO you can use the sessions. Sort of a context
- Session State — stores 1 message transactionally, keeps the state, which you can acquire later
- Transactions. Ususlly paired with DB transactions (called inner transaction). Might give you idempotence on the app level

### Topics
- are the same like queues on the Subscriber end
- topics — are named multicast distribution points for messages
  - Filter/Action — is for modifying messages on the flight
- Subscriptions — are durable queues bound to topics through a collection of selection rules
  - up to 2000 rules (is SQL statement of just sinple expression)

## Architecture

- 3 tiers
  - gateway — exposed outside: AzPortal, API. Talks to AzActiveDirectory, and to Backend via AMQP
    - conn management
    - networking — ip filtering, vnet, PEP
      - 💡 good for connecting 2 private subnets and transfer data. Easier to transfer data via ASB then to setup firewall rules, NAT, etc
    - TLS (termination here). Good for security and integrity both
    - Authorization
    - Entity management
    - HTTPS/WebSocket 
    - AMPQ
    - SBMP
  - backend (broker)
    - all the features are happening here
  - storage

# Azure Event Grid

Azure Event Grid,  is a service that routes events from any source to any destination. It's designed to build applications with event-based architectures.


# Azure EventHub

Azure Event Hubs is a fully managed event ingestion service that can receive and process millions of events per second. It can be used to build real-time streaming pipelines and applications that require low-latency and high-throughput.

- **Scalable ingress**: It can ingest massive amounts of telemetry and events from distributed devices, apps and sensors. There is no limit on the number of producers sending events.
- **Partitioning**: Event Hubs uses a partitioned architecture which allows parallel processing of streams for high throughput. Events are partitioned based on their properties.
- **Storage**: Events are stored in partitions and retained for a configurable period (max 7 days). After that they are discarded to avoid unlimited growth.
- **Processing**: Events can be consumed and processed from partitions in parallel using client libraries and services like Stream Analytics, Functions etc. This allows real-time or batch processing of streams.
- **Reliability**: Events are replicated synchronously across data centers for reliability and availability even in case of regional outages.
- **Pricing**: It has a pay-per-usage model based on throughput units and storage consumed. No upfront costs or long-term commitments.

Features

- accumulates events if the subscribers do not process them fast enough
- PULL delivery for retrieving new messages
- EventGrid might subscribe to the events
- The events might use EventHubTrigger and use FunctionApp for processing
- Event Hub is designed for high-throughput event streams, especially when your solution receives events faster than it can process them.

# Azure Postgres

- Azure Database for PostgreSQL is a fully managed PostgreSQL database service hosted in Microsoft Azure. It allows you to set up, manage, and connect to PostgreSQL databases in Azure without having to worry about managing infrastructure.
- It provides automatic scaling of compute and storage resources so your database can handle varying loads with high performance. It can scale up to hundreds of gigabytes in size.
- Some key features include point-in-time restore for backup and recovery, connection pooling, auditing, threat detection, and integration with other Azure services.
- It offers built-in high availability with automatic failover to a secondary server in case of outages. The data is replicated synchronously across two to four servers for redundancy.
- The pricing is on a pay-as-you-go model based on the compute and storage resources used. This allows you to pay only for what you consume.

# Azure Cosmos

- It is a multi-model database that supports popular data models like document, key-value, graph and columnar. This makes it very flexible for different application needs.
- It offers global distribution and automatic replication of data across any number of Azure regions. This provides high availability and low latency access to data worldwide.
- It scales massively to handle enormous throughput and storage requirements. Some customers have workloads with over 100 million requests per second and petabytes of storage.
- The throughput is elastic and can be adjusted on the fly as your application's needs change, allowing you to pay only for what you use.
- It offers multiple consistency models to balance between strong consistency and low latency as needed by your application.
- Pricing is on a pay-per-use model based on throughput, storage and data egress.

# Azure Functions
- Functions are event-driven, meaning your code only runs when triggered by an event. This makes Functions very cost-effective since you only pay for the compute resources required to run your code.
- Functions supports many programming languages including C#, JavaScript, Java, Python and more. This allows you to write functions using your preferred language.
- Triggers define how a function is invoked. Common triggers include HTTP requests, timers, queues, etc. Bindings connect functions to other Azure services and resources like storage queues, tables, etc.
- Functions has built-in auto-scaling, so it can handle varying loads efficiently without needing to manage infrastructure.

# Azure Container Apps

- k8s under the hood
- Container Apps is for longer running containerized microservices, web apps, etc. Functions are better suited for short-lived, event-driven code snippets.
- With Container Apps you manage the containers and infrastructure. Functions handles all the infrastructure management for you.
- Container Apps gives you more control over containers and infrastructure but requires managing scaling and uptime. Functions automatically scales for you.

# Azure Shop
- It contains thousands of offerings from Microsoft and third-party vendors across various categories like analytics, development tools, databases and more. This includes both software as a service (SaaS) applications and virtual machine-based applications.
- Applications in the marketplace have been tested and certified by Microsoft to ensure they work as expected when deployed on Azure. This helps reduce integration risks.
- Once you find an offering you're interested in, you can easily deploy it with just a few clicks directly from the marketplace portal. This simplifies the deployment process.
- Marketplace offerings have different pricing models - some have free trials and pay-as-you-go options while others require upfront commitments. Make sure to check the pricing details for each offering.
- You can manage your marketplace purchases through your Azure account, get support directly from the publisher, and receive updates and notifications about the offerings.
- The marketplace integrates with other Azure services like Azure Active Directory for user management and Azure Resource Manager for deployment and management.
- https://azuremarketplace.microsoft.com/nl-nl/home  

# Relational DB
- **Azure SQL DB** — fully managed SQL Server
- Azure Database for **MySQL**: A fully managed, scalable MySQL relational database with high availability and security built in at no extra cost.
- Azure Database for **PostgreSQL**: A fully managed, scalable PostgreSQL relational database with high availability and security built in at no extra cost.
- Azure Database for **MariaDB**: A fully managed, scalable MariaDB relational database with high availability and security built in at no extra cost.

# NoSQL Databases

- **Azure Cosmos DB**: A globally distributed, multi-model database service. It supports document, key-value, wide-column, and graph databases.

- **Azure Table Storage**: A service that stores structured NoSQL data in the cloud, providing a key/attribute store with a schemaless design.

- Azure Database for **MongoDB**: A fully managed, scalable MongoDB service with high availability and security built in at no extra cost.

- Azure Cache for **Redis**: An in-memory data store that is used as a database, cache, and message broker.

# Messaging services

1. **Azure Service Bus**: It is a fully managed messaging broker that enables reliable cloud-to-cloud and on-premises messaging. Service Bus supports asynchronous messaging patterns such as publish/subscribe, request/reply, and message queuing. It provides advanced features like message ordering, duplicate detection, and session support.

2. **Azure Event Hubs**: It is a big data streaming platform designed to handle high-throughput, event-driven workloads. Event Hubs can handle millions of events per second and seamlessly integrate with other Azure services like Azure Functions, Azure Stream Analytics, and Azure Logic Apps. It is commonly used for real-time analytics, ingestion of telemetry data, and log aggregation.

3. **Azure Queue Storage**: It is a simple, asynchronous messaging service that allows decoupling and scaling of different components of an application. Queue Storage enables reliable and persistent message delivery with at-least-once delivery semantics. It is often used for creating task queues, handling asynchronous processing, and building distributed systems.

4. **Azure Relay**: It provides secure, hybrid connectivity between on-premises applications and the cloud. Relay allows you to expose on-premises services to the internet or securely consume cloud services from on-premises systems. It uses a combination of messaging and connectivity features to facilitate communication across different networks and firewalls.

5. **Azure Notification Hubs**: It is a scalable push notification engine that enables sending push notifications to various platforms (iOS, Android, Windows, etc.) from a single backend API call. Notification Hubs abstracts the complexities of individual platform protocols, provides features like message tagging and segmentation, and offers rich telemetry for monitoring and analytics.

# Network services

Sure, here's a brief overview of Azure's networking stack:

1. **Azure Virtual Network (VNet)**: This is the fundamental building block for your private network in Azure. VNet enables many types of Azure resources, such as Azure Virtual Machines (VM), to securely communicate with each other, the internet, and on-premises networks.

2. **Azure Load Balancer**: This provides high availability by distributing incoming traffic among healthy service instances in cloud services or virtual machines in a load balancer set. Azure Load Balancer can also present those services on multiple ports, multiple IP addresses, or both.

3. **Azure VPN Gateway**: This sends encrypted traffic across a public connection to an on-premises location, or it can send the traffic across a virtual private network (VPN) tunnel to another virtual network.

4. **Azure Application Gateway**: This is a web traffic load balancer that enables you to manage traffic to your web applications. It's Azure's Application Delivery Controller as a service.

5. **Azure Content Delivery Network (CDN)**: This is a distributed network of servers that can efficiently deliver web content to users. CDNs store cached content on edge servers in point-of-presence (POP) locations that are close to end users, to minimize latency.

6. **Azure DNS**: This provides hosting for your DNS domain, providing name resolution using Microsoft Azure infrastructure. By hosting your domains in Azure, you can manage your DNS records using the same credentials, APIs, tools, and billing as your other Azure services.

7. **Azure Traffic Manager**: This is a DNS-based traffic load balancer that enables you to distribute traffic optimally to services across global Azure regions, while providing high availability and responsiveness.

8. **Azure ExpressRoute**: This lets you extend your on-premises networks into the Microsoft cloud over a private connection facilitated by a connectivity provider.

9. **Azure Network Watcher**: This is a collection of network monitoring and troubleshooting tools. It provides network diagnostic and visualization tools to help you understand, diagnose, and gain insights to your network in Azure.

10. **Azure Firewall**: This is a managed, cloud-based network security service that protects your Azure Virtual Network resources. It's a fully stateful firewall as a service with built-in high availability and unrestricted cloud scalability.

# Compute services

**Azure Virtual Machines (VMs)**: These are on-demand, scalable computing resources. They can be used to deploy a wide range of computing solutions, like applications and servers.

**Azure Kubernetes Service (AKS)**: This is a managed container orchestration service provided by Azure. It simplifies the deployment, scaling, and operations of containerized applications.

**Azure Functions**: This is a serverless compute service that lets you run event-triggered code without having to explicitly provision or manage infrastructure.

**Azure App Service**: This is a fully managed platform for building, deploying, and scaling web apps. You can host web apps, mobile app back ends, RESTful APIs, or automated business processes.

**Azure Batch**: This is a cloud-based job scheduling service that parallelizes and distributes the processing of large volumes of data across many computers.

**Azure Container Instances (ACI)**: This service delivers containers without the need for managing the underlying VMs. It's a solution for any scenario that can operate in isolated containers, without orchestration.

**Azure Service Fabric**: This is a distributed systems platform that makes it easy to package, deploy, and manage scalable and reliable microservices and containers.

**Azure Logic Apps**: This is a cloud service that helps you schedule, automate, and orchestrate tasks, business processes, and workflows when you need to integrate apps, data, systems, and services across enterprises or organizations.