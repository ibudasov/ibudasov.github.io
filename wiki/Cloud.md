# Cloud

## FEDERATED IDENTITY

a mechanism that allows users to access multiple, disparate systems or services with a single set of credentials. In a federated identity model, a user's identity and authentication information are trusted across multiple domains or organizations.

## CLOUD STORAGE

* Hot Storage — AWS S3 Standard, Google Cloud Storage - Standard Storage:
    * Description: Hot storage, also known as online or standard storage, is designed for frequently accessed data. It provides low-latency access, making it suitable for applications and workloads that require fast and frequent access to data.
    * Use Cases: Ideal for databases, active workloads, and applications with high I/O requirements.
* Cold Storage — Google Cloud Storage - Nearline and Coldline, Amazon Glacier:
    * Description: Cold storage, also called archival storage, is designed for infrequently accessed data that doesn't require low-latency access. It offers lower costs but with a trade-off in retrieval times.
    * Use Cases: Backup and long-term archiving of data that is accessed less frequently.
* Cool Storage — S3 Standard-IA (Infrequent Access), Google Cloud Storage - Nearline:
    * Description: Cool storage is a middle ground between hot and cold storage, offering a balance between cost and access times. It is suitable for data that is accessed less frequently than hot storage but more frequently than cold storage.
    * Use Cases: Backups, data archives, and less frequently accessed data.
* Standard Storage — Google Cloud Persistent Disks, Amazon EBS (Elastic Block Store):
    * Description: This is a generic term for the regular storage class provided by many cloud providers. It typically offers a balance between performance and cost and is suitable for a wide range of applications.
    * Use Cases: General-purpose storage for various workloads.
* Premium Storage — Amazon EBS Provisioned IOPS (io1), Google Cloud Persistent Disks - SSD:
    * Description: Premium storage is a high-performance storage tier that often comes with guarantees for low-latency access and high I/O throughput. It is designed for demanding, performance-sensitive applications.
    * Use Cases: High-performance databases, critical applications, and workloads requiring consistent low-latency access.
* Object Storage — Google Cloud Storage, Amazon S3 (Simple Storage Service):
    * Description: Object storage is designed for storing and retrieving large amounts of unstructured data, such as documents, images, and videos. It is highly scalable and typically provides durability and redundancy features. Designed for applications. Non hierarchical
    * Use Cases: Content delivery, media storage, and backup.
* Block Storage — Amazon EBS (Elastic Block Store), Google Cloud Persistent Disks:
    * Description: Block storage provides raw storage volumes that can be attached to virtual machines. It is often used in scenarios where low-level access to storage is required, such as in database systems.
    * Use Cases: Virtual machine storage, database storage.
* File Storage — Google Cloud Filestore:, Amazon EFS (Elastic File System):
    * Description: File storage provides a shared file system accessible from multiple virtual machines. It is suitable for workloads that require shared access to files. Hierarchical
    * Use Cases: Shared file systems, network-attached storage (NAS).

## CLOUD DEPLOYMENT

1. Public Cloud:
    * Description: Public clouds are owned and operated by third-party cloud service providers. These providers deliver computing resources, such as servers and storage, over the internet. Users can access these resources on a pay-as-you-go or subscription basis.
    * Characteristics:
        * Multi-tenancy: Resources are shared among multiple users.
        * Cost-effective: Users pay only for the resources they consume.
        * Scalability: Easily scalable to accommodate changing workloads.
2. Private Cloud:
    * Description: Private clouds are dedicated and isolated environments used exclusively by a single organization. They can be hosted on-premises or by a third-party provider.
    * Characteristics:
        * Single-tenancy: Resources are used by a single organization.
        * Enhanced security and control: Organizations have more control over the infrastructure and can implement specific security measures.
        * Customization: Tailored to meet the specific needs of the organization.
3. Hybrid Cloud:
    * Description: Hybrid clouds combine elements of both public and private clouds. They allow data and applications to be shared between them, providing greater flexibility and more deployment options.
    * Characteristics:
        * Data portability: Applications and data can move between public and private environments.
        * Flexibility: Organizations can use public clouds for scalable and less sensitive workloads, while keeping critical workloads in a private cloud.
        * Cost optimization: Hybrid deployments enable cost-effective use of resources.
4. Community Cloud:
    * Description: Community clouds are shared by several organizations with common concerns, such as regulatory compliance or industry-specific requirements.
    * Characteristics:
        * Shared infrastructure: Resources are shared among a specific community of users.
        * Enhanced collaboration: Enables collaboration and information sharing within the community.
        * Cost-sharing: Participants can benefit from shared infrastructure costs.
5. Multi-Cloud:
    * Description: Multi-cloud involves the use of services from multiple cloud providers. It allows organizations to avoid vendor lock-in, optimize costs, and leverage best-of-breed solutions.
    * Characteristics:
        * Diverse services: Utilizing different cloud providers for specific services or applications.
        * Risk mitigation: Reduces dependency on a single provider and enhances redundancy.
        * Flexibility: Choose the most suitable cloud provider for each workload.

## CLOUD COMPUTE LEVELS
a.k.a. Cloud delivery models

* IaaS (Infrastructure as a Service):
    * IaaS provides virtualized computing resources over the internet. It includes virtual machines, storage, and networking, allowing users to build and manage their own infrastructure.
        * Examples in GCP:
            * Compute Engine: Google's virtual machine (VM) service, where you can create and manage VM instances.
            * Cloud Storage: Offers scalable object storage for your data.
        * Examples in AWS:
            * Amazon EC2: Elastic Compute Cloud provides resizable compute capacity in the cloud.
            * Amazon S3: Simple Storage Service offers scalable object storage.
* PaaS (Platform as a Service):
    *  PaaS provides a platform that allows customers to develop, run, and manage applications without dealing with the complexity of underlying infrastructure.
        * Contains
            * Runtime Environment Layer:
                * This layer provides the runtime environment for applications. It includes the necessary components, libraries, and frameworks for running applications. Developers can deploy their applications on this layer without having to manage the underlying infrastructure.
            * Middleware Layer:
                * The middleware layer provides services that help in communication, data storage, and other common functionalities required by applications. It includes components like databases, message queues, caching systems, and other middleware services.
            * Development Tools Layer:
                * This layer provides tools and services for application development, testing, and deployment. It includes integrated development environments (IDEs), version control systems, testing frameworks, and other tools that make it easier for developers to build and manage applications.
            * Service Layer:
                * The service layer includes additional services that can be leveraged by applications, such as authentication services, logging, monitoring, and analytics. These services enhance the functionality of applications without requiring developers to build these capabilities from scratch.
            * User Interface (UI) Layer:
                * In some PaaS architectures, there may be a layer dedicated to user interfaces, including tools for designing and building user interfaces for applications.
        * Examples in GCP:
            * App Engine: A fully managed platform for building and deploying applications.
            * Cloud SQL: A fully managed relational database service.
        * Examples in AWS:
            * AWS Elastic Beanstalk: An easy-to-use platform for deploying and managing applications.
            * Amazon RDS: A managed relational database service.
* SaaS (Software as a Service):
    * SaaS delivers software applications over the internet, eliminating the need for users to install, maintain, and update the software.
        * Examples in GCP:
            * G Suite: Google's suite of cloud-based productivity tools, including Gmail, Google Docs, and Google Sheets.
        * Examples in AWS:
            * Amazon WorkMail: A secure email and calendaring service.


## Explain security management in terms of cloud computing.

- Identity management access 
    - gives the required authorization of application services.
- Access control permission 
    - is provided to users to have complete controlling access to another user entering the cloud environment.
- Authentication and authorization 
    - permit access to the data and applications only to the users who are authorized and authenticated.

## CLOUD COMPUTE ARCHITECTURE

* 		Client Devices:
    * These are the end-user devices such as laptops, desktops, smartphones, and tablets that connect to the cloud services.
* 		Front End:
    * The front end is the user interface and application that the end user interacts with. It can be a web browser or a dedicated application that communicates with the cloud services.
* 		Back End:
    * The back end is where the cloud resources and services are hosted. It consists of servers, storage systems, and databases. The back end is responsible for processing user requests, managing data, and executing applications.
* 		Cloud Infrastructure:
    * This layer includes the physical hardware and virtual resources that make up the cloud infrastructure. It comprises servers, storage devices, networking equipment, and data centers. Virtualization technologies play a crucial role in creating and managing virtual instances of these resources.
* 		Virtualization:
    * Virtualization enables the creation of virtual machines (VMs) or containers on a single physical server, allowing multiple operating systems and applications to run independently on the same hardware. This enhances resource utilization and scalability.
* 		Cloud Services:
    * Cloud services are the various offerings provided by cloud providers. These can be categorized into Infrastructure as a Service (IaaS), Platform as a Service (PaaS), and Software as a Service (SaaS). Examples include virtual machines, databases, development platforms, and software applications.
* 		Middleware:
    * Middleware connects the front end and back end, facilitating communication and data management. It includes various software components such as web servers, application servers, and messaging systems.
* 		Application:
    * Cloud-based applications run on the cloud infrastructure and leverage cloud services. These applications can be developed and deployed using cloud development platforms and frameworks.
* 		Storage:
    * Cloud storage services provide scalable and flexible storage solutions for data and files. Users can store and retrieve data from anywhere with an internet connection.
* 		Networking:
    * Networking components include routers, switches, and other devices that enable communication between different components of the cloud architecture. It also includes technologies such as load balancing and content delivery networks (CDNs).
* 		Security:
    * Security measures are integrated throughout the cloud architecture to protect data, applications, and infrastructure. This includes encryption, identity and access management, firewalls, and other security protocols.
* 		Management and Monitoring:
    * Cloud management tools and services help administrators monitor and control the cloud environment. This includes resource provisioning, scaling, and performance monitoring.

## ON DEMAND

without requiring a long-term commitment or pre-scheduled provision. 

* Immediate Access: On-demand functionality allows users to obtain resources or services instantly when they are needed, without the need for long lead times or manual intervention.
* Flexibility: Users have the flexibility to scale resources up or down based on their current requirements. This is particularly relevant in cloud computing, where resources like computing power, storage, and network capabilities can be adjusted dynamically.
* Pay-as-You-Go Model: On-demand services often follow a pay-as-you-go pricing model. Users are billed for the actual resources or services consumed during the period they were used, rather than committing to a fixed, upfront cost.
* No Upfront Commitments: Users are not required to make significant upfront investments or commit to long-term contracts. This aligns with the idea of flexibility, allowing users to adapt to changing needs without being locked into a predefined agreement.

## SCALABILITY VS ELASTICITY

* Scalability:
    * Definition: Scalability refers to the ability of a system, network, or process to handle a growing amount of work, or its potential to be enlarged to accommodate that growth. It measures how well a system can maintain or even increase its performance and efficiency when the workload is increased.
    * Nature: Scalability is often considered in a more general and long-term context. It assesses how well a system can grow or handle increased demand over an extended period.
    * Implementation: Scalability can be achieved through various means such as optimizing algorithms, adding more resources (horizontal or vertical scaling), or improving the architecture of a system.
* Elasticity:
    * Definition: Elasticity, on the other hand, refers to the ability of a system to dynamically adapt to changing workloads by provisioning and de-provisioning resources in an automated and on-demand fashion. It involves automatically and quickly allocating or releasing resources based on the current demand.
    * Nature: Elasticity is more about the immediate, automatic, and temporary adjustments to meet the current demand. It is a more real-time concept that deals with the dynamic scaling of resources in response to changes in demand.
    * Implementation: Cloud computing services often provide elasticity through features like auto-scaling, which automatically adjusts the number of resources based on current demand. This could involve adding more virtual machines when the demand is high and reducing them during periods of lower demand.

## EDGE COMPUTING

Edge computing refers to the practice of processing data near the source of data generation, rather than relying on a centralized cloud-based system for data processing. In traditional computing models, data is typically sent to a centralized cloud server for processing and analysis. However, in edge computing, the processing is performed on or near the device or "edge" of the network where the data is generated.

* Reduced Latency: Edge computing minimizes the time it takes for data to travel between the source and the processing center, leading to lower latency. This is particularly important for applications that require real-time or near-real-time processing, such as IoT (Internet of Things) devices, autonomous vehicles, and industrial automation.
* Bandwidth Efficiency: By processing data locally, edge computing reduces the need to transmit large amounts of raw data to a central server. This can result in more efficient use of network bandwidth and reduced data transfer costs.
* Privacy and Security: Some sensitive data may need to be processed locally to address privacy and security concerns. Edge computing allows for the local processing of data, minimizing the risk of exposing sensitive information during transit to a centralized server.
* Scalability: Edge computing can distribute processing tasks across multiple edge devices, providing a scalable solution. This is particularly useful in scenarios where the volume of data generated is vast and requires distributed processing capabilities.

## SERVERLESS COMPUTE

1. Cost Efficiency:
    * Pay-per-execution pricing model means you only pay for the actual compute resources used during the execution of your functions.
    * No need to provision and pay for idle resources, as the cloud provider dynamically allocates resources as needed.
2. Scalability:
    * Automatic scaling enables applications to handle varying workloads without manual intervention.
    * Scales from zero to handle individual requests and then scales back down when the demand decreases.
3. Simplified Operations:
    * Developers can focus on writing code without managing servers, networking, or infrastructure.
    * Automatic updates and maintenance are handled by the cloud provider.
4. Rapid Development:
    * Accelerates development cycles as developers can quickly deploy and iterate on small, independent functions.
    * Enables a microservices architecture, where each function performs a specific task.
5. Event-Driven Architecture:
    * Easily integrate with various events and triggers (e.g., HTTP requests, database changes), making it suitable for event-driven architectures.
6. Reduced Time to Market:
    * Faster development and deployment cycles contribute to quicker release of applications and features.
Disadvantages:
1. Cold Start Latency:
    * The first execution of a function after a period of inactivity (cold start) may have higher latency as the cloud provider initializes resources.
    * This can impact real-time and low-latency applications.
2. Limited Execution Time:
    * Functions typically have a maximum execution time, and long-running tasks may need to be split into smaller functions.
3. Vendor Lock-in:
    * Serverless platforms are often specific to cloud providers, leading to potential challenges if you want to switch providers.
4. Debugging and Monitoring:
    * Debugging serverless functions can be more challenging compared to traditional architectures.
    * Monitoring and debugging tools might be limited compared to more mature tools for traditional architectures.
5. Resource Limitations:
    * Functions may have limitations on the amount of memory, processing power, and storage they can use.
    * Not suitable for all types of applications, especially those with high computational or resource-intensive requirements.
6. Security Concerns:
    * Limited control over the underlying infrastructure might raise security concerns for certain applications.
    * Security best practices need to be carefully followed to ensure the safety of serverless applications.
7. Stateless Execution:
    * Functions are generally stateless, and managing state between function invocations might require additional services, introducing complexity.

## CLOUD ENABLING TECH

1. Virtualization:
    * Purpose: Allows multiple virtual instances of operating systems to run on a single physical machine.
    * Example: VMware, Microsoft Hyper-V, KVM (Kernel-based Virtual Machine).
2. Containerization:
    * Purpose: Package applications and their dependencies into containers for consistent deployment across different environments.
    * Example: Docker, Kubernetes, OpenShift.
3. Orchestration:
    * Purpose: Manages the arrangement, coordination, and execution of automated tasks.
    * Example: Kubernetes, Docker Swarm, Apache Mesos.
4. Automation:
    * Purpose: Reduces manual intervention by automating repetitive tasks in the deployment and management of resources.
    * Example: Ansible, Puppet, Chef.
5. Microservices Architecture:
    * Purpose: Decomposes applications into small, independent services that can be developed, deployed, and scaled independently.
    * Example: Spring Boot, Node.js, Flask.
6. Software-Defined Networking (SDN):
    * Purpose: Separates the control plane from the data plane, providing programmable and centralized network management.
    * Example: OpenFlow, Cisco ACI, VMware NSX.
7. Software-Defined Storage (SDS):
    * Purpose: Decouples storage management from the underlying hardware, making storage resources more flexible and scalable.
    * Example: Ceph, GlusterFS, VMware vSAN.
8. Identity and Access Management (IAM):
    * Purpose: Manages user identities, authentication, and authorization in the cloud environment.
    * Example: AWS IAM, Azure Active Directory, Google Cloud IAM.
9. DevOps Tools:
    * Purpose: Facilitates collaboration between development and operations teams, promoting continuous integration and continuous delivery (CI/CD).
    * Example: Jenkins, GitLab CI/CD, Travis CI.
10. APIs (Application Programming Interfaces):
    * Purpose: Enable communication and interaction between different software applications and services.
    * Example: RESTful APIs, SOAP APIs.
11. Serverless Computing:
    * Purpose: Enables developers to run code without provisioning or managing servers, paying only for the actual compute resources used.
    * Example: AWS Lambda, Azure Functions, Google Cloud Functions.
12. Edge Computing:
    * Purpose: Processes data closer to the source of generation, reducing latency and improving performance.
    * Example: AWS Wavelength, Azure Edge Zones, Google Cloud Edge AI.

## MICROSERVICES RELEVANCE

1. Scalability:
    * Microservices enable horizontal scalability, allowing individual services to be scaled independently based on demand. This is crucial in a cloud environment where resources can be dynamically allocated and de-allocated as needed. Applications can scale efficiently, responding to varying workloads without affecting the entire system.
2. Flexibility and Agility:
    * Microservices promote flexibility and agility in development and deployment. Since each microservice is an independent unit, developers can update, deploy, and scale individual services without affecting the entire application. This agility is vital in a cloud environment, where rapid development, deployment, and updates are often required.
3. Resilience and Fault Isolation:
    * Microservices enhance system resilience by isolating failures. If one microservice fails, it doesn't necessarily bring down the entire application. This fault isolation is crucial in a cloud environment where failures and disruptions are inevitable. It ensures that the impact of a failure is limited to the specific service experiencing the issue.
4. Resource Optimization:
    * In a cloud environment, resources are allocated and billed based on usage. Microservices allow for efficient resource utilization as each service can be provisioned and scaled independently. This granularity enables organizations to optimize resource allocation and cost-effectively manage their cloud infrastructure.
5. Technology Heterogeneity:
    * Microservices allow each service to be developed and deployed independently, using the most suitable technology stack for its specific requirements. This technology heterogeneity is beneficial in a cloud environment where diverse services may have different needs in terms of programming languages, frameworks, and databases.
6. Continuous Delivery and DevOps:
    * Microservices align well with continuous delivery practices and DevOps principles. Teams can work on and deploy individual microservices independently, enabling faster release cycles and reducing the time it takes to bring new features to production. This is essential in a cloud environment where speed and responsiveness are key.
7. Decentralized Data Management:
    * Microservices often have their own databases, allowing for decentralized data management. This minimizes dependencies between services and avoids a single, monolithic database. In a cloud environment, this approach supports better data isolation and enhances the overall scalability and performance of the system.
8. Improved Fault Tolerance:
    * Microservices can be designed to be resilient to failures. By employing techniques such as load balancing, redundancy, and graceful degradation, a system built with microservices can better withstand and recover from failures, ensuring continuous operation in the face of disruptions.

## CLOUD METRICS

Golden sygnals
1. Latency: Latency measures the time it takes for a request to travel from the source to the destination and receive a response. It is a critical indicator of the responsiveness of a system. Excessive latency can lead to poor user experience and impact the overall performance of an application.
2. Traffic (Traffic Rate or Throughput): This signal focuses on the amount of data or requests processed by a system over a specific period. Monitoring traffic helps ensure that the system can handle the expected load and allows for capacity planning. Sudden spikes or drops in traffic can indicate issues or changes in user behavior.
3. Errors: Monitoring for errors involves tracking the rate of unsuccessful requests or operations. An increase in error rates can signal potential issues with the application, such as bugs, resource constraints, or external dependencies. It is crucial to identify and address errors promptly to maintain system reliability.
4. Saturation (Utilization): Saturation refers to the level of resource utilization within a system. It measures how close a resource (such as CPU, memory, or storage) is to full capacity. High saturation levels can lead to performance degradation and impact the overall stability of the system. Monitoring saturation helps in identifying and addressing resource bottlenecks.
5. Availability and Reliability Metrics:
    * Uptime/Downtime: The percentage of time a system or service is available for use.
    * Fault Tolerance: The system's ability to continue operating in the event of a failure.
    * Mean Time Between Failures (MTBF): The average time between system failures.
6. Scalability Metrics:
    * Vertical Scalability: The ability to increase resources within a single node.
    * Horizontal Scalability: The ability to add more nodes to a system.
    * Elasticity: The ability to automatically scale resources up or down based on demand.
7. Cost Metrics:
    * Cost per Transaction: The cost associated with each operation or transaction.
    * Total Cost of Ownership (TCO): The overall cost of using a particular cloud service over time.
    * Resource Utilization: Efficient use of resources to minimize costs.
8. Security Metrics:
    * Data Encryption: The percentage of data that is encrypted during transmission and at rest.
    * Incident Response Time: The time taken to respond to a security incident.
    * Compliance: Adherence to industry-specific and regulatory security standards.
9. Network Metrics:
    * Bandwidth: The amount of data that can be transmitted over a network in a given time.
    * Packet Loss: The percentage of data packets lost during transmission.
    * Network Latency: The time it takes for data to travel from the source to the destination.
10. Resource Utilization Metrics:
    * CPU Utilization: The percentage of processing power being used.
    * Memory Utilization: The percentage of available memory being used.
    * Storage Utilization: The percentage of available storage being used.
11. Service-Level Agreement (SLA) Metrics:
    * Response Time: The time it takes for a system to respond to a request.
    * Service Availability: The guaranteed percentage of time that a service will be operational.
12. User Experience Metrics:
    * User Satisfaction: Measured through surveys or feedback mechanisms.
    * Page Load Time: Relevant for web applications, the time it takes for a page to load.
13. Environmental Metrics:
    * Energy Efficiency: The efficient use of energy resources in the data center.
    * Carbon Footprint: The amount of carbon dioxide emissions associated with cloud operations.

## How does the resource agent monitor cloud usage?

1. Cloud Provider Monitoring Tools:
    * Cloud service providers typically offer monitoring tools and dashboards that allow users to track resource utilization, performance metrics, and costs.
    * AWS CloudWatch, Azure Monitor, and Google Cloud Monitoring are examples of native monitoring tools provided by major cloud service providers.
2. Agent-Based Monitoring:
    * Some cloud providers or third-party tools may use agent-based monitoring solutions. These agents are lightweight software components installed on the virtual machines (VMs) or instances to collect data on system performance, resource usage, and application metrics.
    * These agents can provide detailed insights into the health and performance of individual instances.
3. Logging and Auditing:
    * Cloud platforms often generate logs for various activities, such as API calls, configuration changes, and security events. These logs can be analyzed to gain insights into resource usage and detect any unusual or unauthorized activities.
    * Tools like AWS CloudTrail, Azure Activity Log, and Google Cloud Audit Logging provide logs for auditing purposes.

## CLOUD NATIVE APPS

1. Microservices Architecture: Cloud-native applications are often built using a microservices architecture, where the application is composed of small, independent services that communicate with each other through well-defined APIs. This allows for easier development, deployment, and scaling of individual components.
2. Containerization: Cloud-native applications are commonly packaged as containers, which encapsulate the application and its dependencies. Containers provide consistency across different environments and enable seamless deployment and scaling.
3. Container Orchestration: Cloud-native applications are frequently managed using container orchestration platforms like Kubernetes. These platforms automate the deployment, scaling, and management of containerized applications, making it easier to handle complex, distributed systems.
4. DevOps Practices: Cloud-native development embraces DevOps principles, promoting collaboration and communication between development and operations teams. Automation, continuous integration, and continuous delivery (CI/CD) pipelines are often used to streamline the development and deployment processes.
5. Elasticity and Scalability: Cloud-native applications are designed to scale horizontally, meaning that additional instances of services can be easily added or removed to meet changing demands. This scalability is a key benefit of cloud-native architecture.
6. Resilience and Fault Tolerance: Cloud-native applications are engineered to be resilient and fault-tolerant. They are designed to handle failures gracefully, recover quickly, and continue to provide services even in the face of disruptions.
7. API-Driven: Cloud-native applications often expose APIs (Application Programming Interfaces) to enable seamless integration with other services, both within and outside the application.
8. Infrastructure as Code (IaC): Cloud-native development often involves the use of Infrastructure as Code, allowing developers to define and manage the infrastructure through code, automating the provisioning and configuration of resources.


## Define the direct customers in a cloud ecosystem.
Those, who pay for the cloud. Companies and individual practitioners
## What are the cloud delivery models?
See Cloud layers 
## What do you mean by cloud technology?
It is cloud layers delivered over the internet, on demand, scalable, self-service, secure, measured
## Mention the layers of PaaS architecture.
See Cloud layers explained 
## List the primary features of cloud computing.
delivered over the internet, on demand, scalable, self-service, secure, measured
## Who are the cloud consumers in a cloud ecosystem?
Those, who pay for the cloud. Companies and individual practitioners
## What are the component layers found in Cloud architecture?
See Cloud layers
## Elaborate on the cloud usage monitor.
A cloud usage monitor is a tool or service designed to track, analyze, and manage the usage of cloud resources within an organization. As businesses increasingly adopt cloud computing services, it becomes crucial to monitor and optimize the usage of these resources for efficiency, cost control, and performance improvement.
## What are the uses of APIs in cloud services?
In summary, APIs in cloud services facilitate seamless integration, automation, and customization, empowering developers to build scalable, flexible, and efficient applications in the cloud.
## Define the cloud usage monitor 
basically the UI of any public cloud. A cloud usage monitor is a tool or system designed to track and analyze the usage of resources within a cloud computing environment. Its primary purpose is to provide insights into how cloud resources are being utilized, allowing organizations to optimize performance, manage costs, ensure compliance, and troubleshoot issues effectively. The cloud usage monitor typically collects data on various parameters, such as compute resources, storage, networking, and application-level metrics. Here are some key aspects and functions associated with a cloud usage monitor:
## Give some reasons why Amazon is so big.
Overall, the combination of early market entry, a comprehensive service portfolio, global infrastructure, security measures, innovation, economies of scale, a strong developer ecosystem, and customer-centric practices has contributed to AWS's substantial growth and market dominance.
## How can you vertically scale an Amazon instance?
Make sure the instance is behind a load balancer. Stop the instance. The state will be lost. Change the instance type. Start the instance. Adjust configuration. 
## Explain the security usage in the Amazon Web Services model.
Amazon Web Services (AWS) provides a comprehensive set of security features and services to help users protect their data, systems, and infrastructure. Security in the AWS model is based on shared responsibility, where AWS manages security of the cloud (hardware, software, networking, and facilities), and customers are responsible for security in the cloud (data, identity, applications, and access).
## What is meant by Containers as a Service (CaaS)?
Containers as a Service (CaaS) is a cloud computing service model that provides a platform for deploying, managing, and orchestrating containerized applications.
  1. Amazon Elastic Container Service (ECS)
  2. Amazon Elastic Kubernetes Service (EKS)
  3. Google Kubernetes Engine (GKE)
  4. Cloud Run
## How does the polling agent monitor cloud usage
polling agent typically refers to a component of a monitoring system that periodically collects data from the cloud infrastructure and services to track usage, performance, and other relevant metrics.
## What is meant by rate limiting?
Rate limiting is a technique used in computing and networking to control the rate at which requests or events are allowed to occur. It is employed to prevent abuse, protect resources, and ensure fair usage of a system or service. 
## OpenStack
OpenStack is an open-source cloud computing platform that provides a set of services for building and managing both public and private clouds. It is designed to be scalable, flexible, and interoperable, allowing organizations to create and manage a variety of cloud infrastructure components. OpenStack is comprised of several projects, each handling a specific aspect of cloud computing.
## Where does a web browser save the cache?
Web browsers maintain their own caches for storing temporary files, images, and other web page elements. The location of the browser cache depends on the browser and the operating system. For example, in many cases, browsers like Google Chrome and Mozilla Firefox store their cache in specific folders on the user's hard drive.
## What do you understand about the Compute and Leader nodes?
1. Compute Nodes:
  * Role: Compute nodes are responsible for performing the actual computations or processing tasks in a distributed computing environment.
  * Functionality: They execute the tasks assigned to them by a higher-level system or framework, often in parallel with other compute nodes.
  * Characteristics: Compute nodes typically have processing power (CPU), memory, and storage resources. They work together to handle large-scale computations more efficiently than a single machine could.
2. Leader Nodes:
  * Role: A leader node (or master node) often serves as the coordinator or manager of a distributed computing system.
  * Functionality: It is responsible for distributing tasks among compute nodes, managing the overall workflow, and aggregating results. The leader node ensures proper communication and coordination among the nodes.
  * Characteristics: Leader nodes may have additional responsibilities, such as maintaining metadata, handling job scheduling, and managing the overall health of the system.

## LINKS

- https://www.interviewkickstart.com/interview-questions/cloud-engineer-interview-questions 
- https://www.interviewkickstart.com/interview-questions/devops-principles-to-answer-interview-questions 


## Cloud service models

Cloud computing resources are delivered using three different service models:

- **Infrastructure as a service (IaaS)** provides instant computing infrastructure that you can provision and manage over the Internet.
  - VMs (I need to manage onfiguring firewalls, updating VM OS's, updating DBMS's, and runtimes.)
  - Pros (over on-prem)
    - Eliminates capital expense and reduces ongoing cost: 
    - Improves business continuity and disaster recovery
    - Respond quicker to shifting business conditions
    - Increase stability, reliability, and supportability
- **Platform as a service (PaaS)** provides ready-made development and deployment environments that you can use to deliver your own cloud services.
  - no licenses
  - no integrations
  - no managing updates, network
  - Reduced development time
  - Use sophisticated tools affordably: A pay-as-you-go model
  - Support geographically distributed development teams
  - Efficiently manage the application lifecycle
- **Software as a service (SaaS)** delivers applications over the internet as web-based services.
  - web-apps

![alt text](https://learn.microsoft.com/en-gb/training/modules/align-requirements-in-azure/media/3-shared-responsibility.png)