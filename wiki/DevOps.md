# DevOps

## RED/USE/4 Golden Signals

## CONCURRENCY VS PARALLELISM


## PAXOS algorithm

used in distributed systems to ensure that a group of nodes can agree on a single value or a sequence of values despite the possibility of failures.

* Basic Problem:
    * The fundamental problem Paxos addresses is ensuring that a group of nodes can agree on a single value even if some nodes fail or behave unpredictably.
* Roles:
    * Proposer: Proposes a value.
    * Acceptor: Accepts or rejects a proposed value.
    * Learner: Learns the agreed-upon value.
* Phases:
    * Phase 1 (Prepare): A proposer sends a prepare request to a majority of acceptors. Each acceptor responds with a promise not to accept any proposal numbered lower than the one in the request.
    * Phase 2 (Accept): If a proposer receives promises from a majority, it sends an accept request with its proposal. Acceptors accept the proposal if they have not promised to reject it.
* Quorums:
    * Paxos relies on a majority of nodes (a quorum) to reach decisions. This ensures progress and consistency in the face of node failures.
* Safety and Liveness:
    * Safety: Paxos ensures that if a value is chosen, all correct nodes eventually learn it.
    * Liveness: Paxos guarantees that something is eventually chosen if enough nodes are functioning correctly.
* Fault Tolerance:
    * Paxos is designed to handle faults, including nodes that fail, nodes that send duplicate messages, and nodes that deliver messages out of order.
* Complexity:
    * One criticism of Paxos is that it can be challenging to understand and implement correctly. There are variations and optimizations of the basic Paxos algorithm to make it more practical for real-world systems.
* Use Cases:
    * Paxos is used in distributed databases, distributed file systems, and other distributed systems where achieving consensus is crucial.

## The Raft consensus algorithm 

is a distributed consensus algorithm designed to achieve consensus in a distributed system. Consensus is a fundamental problem in distributed systems, where multiple nodes need to agree on a single value or decision even if some nodes fail or behave unpredictably.

* Leader Election:
    * The Raft algorithm divides nodes in the distributed system into three roles: leader, follower, and candidate.
    * There is a leader responsible for managing the replication of the log entries. If the leader fails or is unreachable, a new leader needs to be elected.
* Term:
    * Time is divided into terms, and each term begins with a leader election.
    * Terms are used to distinguish between different elections and ensure that nodes can identify the most up-to-date information.
* Log Replication:
    * The state of the system is maintained in a log, which consists of a series of entries. Each entry contains a command and a term number.
    * The leader is responsible for replicating log entries to other nodes. Once a majority of nodes have replicated a log entry, it is considered committed.
* Safety:
    * Raft ensures safety by ensuring that once a log entry is committed, it will be present in the logs of all future leaders.
    * A leader only accepts log entries that are at least as up-to-date as its own log, preventing inconsistencies.
* Consistency:
    * Raft guarantees that only one leader can be elected in a given term, and that leader is the one with the most up-to-date log.
* Leader Election Process:
    * In the absence of communication, a node will time out and become a candidate. The candidate requests votes from other nodes, and if it receives votes from a majority, it becomes the new leader.
    * If another leader emerges with a more up-to-date log during an election, the candidate becomes a follower and adopts the new leader.

## Quality of Service (QoS) 

set of practices and techniques employed to ensure that the software or system meets specific performance and reliability requirements. QoS in DevOps is concerned with delivering a high level of service or user experience, and it involves various aspects of development, testing, deployment, and operations. 

Arguably, is concerned a lot about reliability

## DevOps principles
### DevOps Principles #1: Collaboration is Key
DevOps and Agile are methodologies for developing software quickly and efficiently through collaboration between teams without cross-functionalities.
* DevOps focuses on collaboration between large software development teams and operations teams that otherwise work independently with limited or no cross-functionality. DevOps focuses on continuous testing and delivery. DevOps focuses on quality and automation using key practices like Continuous Integration and Continuous Development.
* Agile as an iterative approach focuses on product development teams collaborating with stakeholders to integrate changing customer and market requirements for rapid releases continuously. Agile focuses on timelines and agility using key practices like Scrum and Kanban.

### DevOps Principles #2: Automation of SDLC Workflows and Processes
Automation is a fundamental part of the DevOps essential practices of Continuous Integration and Continuous Development. Automation results in minimizing human errors to enhance quality and productivity. It frees up developers to work on additional and advanced features. It also allows for continuous improvement by enabling efficient feedback between developers and operations teams for quick iterations. This increases reliable deliveries over multiple platforms.
### DevOps Principles #3: Continuous Integration (CI) and Continuous Delivery (CD)
* Continuous Integration: Following the practice of Continuous Integration, developers integrate changes made to code during the build stage of the release cycle into a central code repository. Git or similar version control systems are used to facilitate continuous integration. Automated build and tests verify code changes to be integrated. CI facilitates increased productivity reduces errors by quickly identifying and fixing bugs and faster customer updates.
* Continuous Delivery: This involves automation of release processes which enables automatic, quick deployment of new code changes to production. This includes changes in configuration, features, fixing bugs, etc.
### DevOps Principles #4: Continuous Monitoring
In DevOps, continuous monitoring refers to the automated process of identifying compliance and security risks of software deployed into production. Continuous monitoring enhances security and transparency, maintains and improves software performance, resolves errors, monitors user behaviors. Continuous monitoring applies to network activity, infrastructure processes, and application performance.
DevOps' continuous monitoring tools include Nagios, Akamai mPulse, Splunk, Dynatrace, Kibana, Sensu, etc.
### DevOps Principles #5: Version Control for Improved Collaboration
Version control is a central repository in which developers store and track changes to code for -software development workflows. Version control systems allow developers to maintain a project’s source code in its original form. Teams can then develop branches or work on copies of the source code, which multiple developers can track and collaborate on. Code updates are tested for errors and compatibility with existing code before deployment to production.
GitHub is a popular version control system that allows all developers to view revisions and track issue resolution.
### Other Must-Know DevOps Principles
DevOps is based on several concepts centered around bringing together software development and operations teams, which otherwise perform as separate functions. Besides the key principles mentioned above, some other important DevOps principles that underlie the successful adoption of the DevOps culture, based on which various 

## DevOps tools and technologies are developed and used, are:
* Customer-Centric Action: Software development should prioritize meeting customer requirements by automating processes to enable customer feedback to be received and incorporated quickly for faster deployment of revised versions.
* Create With the End in Mind: Encourages developers to consider the final product to be delivered instead of deliverables for their individual workflow or process.
* End-to-End Responsibility: Building on the principle of collaboration, this principle requires all teams involved in the DevOps process to be responsible and accountable for the entire SDLC from conception to completion.
* Cross-Functional Autonomous Teams: DevOps encourages independent, product-oriented teams comprising members with cross-functional skills and expertise in varying knowledge areas, as opposed to members specializing in only one skill or knowledge area, collaborating for faster resolution of problems and continuous improvement of products through every stage of development.
* Learn from Failure: Adoption of the cloud for faster deployments of updated versions and complex infrastructure technologies are some factors that increase the chances of failure. DevOps underlines the need for short feedback processes to enable quick fixes and updates for continuous improvement.

## Why does DevOps recommend shift-left testing principles?
Shift-left testing questions are usually DevOps interview questions for experienced engineers. Shift-left testing enables quick, effective development of high-quality solutions by identifying errors at the initial stages of the SDLC.

## Where does the operating system save the cache?

1. RAM Cache (Memory Cache): Many operating systems use a portion of the system's RAM as a cache. This is often referred to as a memory cache. The operating system manages this cache in RAM, and the location is not directly accessible to users or applications.
2. Disk Cache: Some operating systems use a disk cache to improve disk I/O performance. The disk cache is typically stored on the disk itself, in a designated area. The exact location and management of this cache can depend on the specific file system and the operating system.
3. Web Browser Cache: Web browsers maintain their own caches for storing temporary files, images, and other web page elements. The location of the browser cache depends on the browser and the operating system. For example, in many cases, browsers like Google Chrome and Mozilla Firefox store their cache in specific folders on the user's hard drive.
4. CPU Cache: CPU cache is hardware-level cache built directly into the processor. It is not managed by the operating system, and its location is not accessible or configurable by users. The CPU cache is typically integrated into the processor die.

## Rollback

1. Version Control:
    * Use a version control system (e.g., Git) to manage and track changes to your codebase. This allows you to easily identify and revert to a specific version when needed.
2. Automated Testing:
    * Implement a robust automated testing strategy that includes unit tests, integration tests, and possibly end-to-end tests. Automated tests help catch issues before they reach production, reducing the likelihood of needing a rollback.
3. Continuous Integration/Continuous Deployment (CI/CD):
    * Employ CI/CD pipelines to automate the process of building, testing, and deploying your application. This helps ensure that the deployment process is consistent and reproducible.
4. Monitoring and Logging:
    * Implement monitoring tools and logging mechanisms to track the performance and behavior of your application in real-time. This allows you to quickly detect issues and assess whether a rollback is necessary.
5. Feature Toggles (Feature Flags):
    * Use feature toggles to selectively enable or disable features in your application. If a new feature causes problems, you can quickly disable it without rolling back the entire application.
6. Rollback Plan:
    * Develop a rollback plan that includes step-by-step instructions for reverting to the previous version. This plan should be well-documented and tested to ensure a smooth rollback process.
7. Communication:
    * Establish clear communication channels to inform stakeholders, including development teams, operations teams, and end-users, about the decision to rollback and the reasons behind it.
8. Automated Rollback Scripts:
    * Depending on your deployment setup, create automated rollback scripts or use deployment tools that support automated rollback processes. This ensures a fast and reliable rollback without manual intervention.
9. Post-Rollback Analysis:
    * After a rollback, conduct a thorough analysis to understand the root cause of the deployment issue. This information can help improve future deployment processes and prevent similar issues.
10. Documentation and Training:
    * Document the rollback process and ensure that relevant team members are trained on how to execute it. This helps streamline the response to deployment issues.

## How is DevOps different from the Agile methodology of software development?

DevOps and Agile are related but distinct approaches to software development, and they address different aspects of the development process. Here's a brief overview of each and the key differences between them:
Agile Methodology:
1. Focus on Flexibility and Customer Collaboration:
    * Agile emphasizes adaptability and flexibility in responding to change throughout the development process.
    * Customer collaboration is prioritized, and requirements are expected to evolve through the collaborative effort of self-organizing cross-functional teams.
2. Iterative and Incremental Development:
    * Agile promotes an iterative and incremental approach to development, with work being organized into short, fixed-length iterations (usually 2-4 weeks).
    * At the end of each iteration, a potentially shippable product increment is delivered.
3. Emphasis on Individuals and Interactions:
    * Agile values individuals and interactions over processes and tools. Effective communication and collaboration among team members are crucial.
4. Customer Feedback:
    * Regular feedback from customers and stakeholders is essential for continuous improvement and ensuring that the product meets user needs.
DevOps:
1. Focus on Collaboration Between Development and Operations:
    * DevOps is a set of practices that aims to bridge the gap between development (Dev) and operations (Ops) teams to improve collaboration and efficiency.
    * It extends the Agile principles by promoting collaboration not only within development teams but also between development and operations.
2. Continuous Integration and Continuous Delivery (CI/CD):
    * DevOps emphasizes automating and streamlining the processes of building, testing, and deploying software to enable continuous integration and continuous delivery.
    * The goal is to deliver software in smaller, more frequent releases.
3. Infrastructure as Code (IaC):
    * DevOps often involves treating infrastructure as code, allowing for the automation and versioning of infrastructure configurations. This helps in maintaining consistency and reproducibility.
4. Monitoring and Feedback Loops:
    * DevOps places a strong emphasis on monitoring application and infrastructure performance, enabling quick identification and resolution of issues through feedback loops.
Key Differences:
1. Scope:
    * Agile primarily focuses on the development phase and how to manage and deliver software in iterative cycles.
    * DevOps extends beyond development and includes practices related to operations, aiming for a more holistic approach to the software delivery lifecycle.
2. Teams and Collaboration:
    * Agile emphasizes collaboration within development teams and with customers.
    * DevOps emphasizes collaboration not only within development teams but also between development and operations teams.
3. Automation:
    * While Agile may use some automation, DevOps places a strong emphasis on automation for various aspects of the development, testing, and deployment processes.
4. Feedback Loops:
    * Both Agile and DevOps value feedback, but DevOps extends feedback loops to include monitoring and operations, enabling faster response to issues in production.

## REDUNDANCY

1. Redundancy is the inclusion of extra components, systems, or capacity in a system design to improve its reliability and performance. The purpose of redundancy is to provide backup or alternative resources that can take over in the event of a failure, ensuring that the system can continue to function without a significant loss of performance or downtime.
2. Acieved with - multple identical deployments of critical systems
3. Examples
    1. hardware - identical servers + LB + failover mechanism
    2. software - standby server + failover mechanism for a DB
    3. network -- multiple network paths between devices
    4. power - generators, 
4. types
    1. active - all components are operational simultaneously
    2. standby -- other components become active when the main fails
    3. N+1 redundancy -- one extra component for critical resources
    4. N+M redundancy -- have M extra components

## OSI MODEL

1. Physical Layer (Layer 1):
    * Deals with the physical connection between devices.
    * Defines the hardware elements such as cables, connectors, and network interface cards.
    * Specifies characteristics like voltage levels, data rates, and physical topology.
2. Data Link Layer (Layer 2):
    * Responsible for reliable point-to-point and point-to-multipoint communication between devices on the same network.
    * Manages access to the physical medium, detects and corrects errors, and provides a framing mechanism for data.
3. Network Layer (Layer 3):
    * Focuses on logical addressing and routing of data between devices on different networks.
    * Determines the best path for data to travel from the source to the destination across multiple networks.
4. Transport Layer (Layer 4):
    * Ensures end-to-end communication, error detection, and correction.
    * Manages flow control, segmentation, and reassembly of data into packets.
5. Session Layer (Layer 5):
    * Establishes, manages, and terminates sessions or connections between applications.
    * Synchronizes data exchange and manages dialog control.
6. Presentation Layer (Layer 6):
    * Translates data between the application layer and the lower layers.
    * Manages data format translation, encryption, and compression.
7. Application Layer (Layer 7):
    * Provides network services directly to end-users or applications.
    * Allows software applications to communicate over a network.

## DHCP

1. Every network device needs 
    1. IP Address: An IP address uniquely identifies a device on a network. It is a numerical label assigned to each device participating in a computer network that uses the Internet Protocol for communication. IP addresses are essential for routing data packets to and from devices within a network and across the internet.
    2. Subnet Mask: The subnet mask is a 32-bit number that divides an IP address into network and host portions. It helps identify the network to which an IP address belongs. The subnet mask is crucial for routing traffic within a network. For example, in the IP address 192.168.1.10 with a subnet mask of 255.255.255.0, the first three octets (192.168.1) represent the network, and the last octet (10) represents the host on that network.
    3. Default Gateway: The default gateway is the IP address of a device (usually a router) that serves as an entry point to other networks. When a device wants to communicate with a device on a different network, it sends the data to the default gateway, which forwards it to the appropriate network. The default gateway is essential for enabling communication between devices on different subnets.
2. DHCP helps to discover them with 
    1. Request: When a device (such as a computer or a smartphone) connects to a network, it sends out a DHCP request.
    2. Discover: A DHCP server on the network receives the request and replies with a DHCP offer. This offer includes an available IP address, subnet mask, gateway, and other configuration parameters.
    3. Request: The requesting device acknowledges the offer and formally requests the suggested configuration.
    4. Acknowledge: The DHCP server responds with an acknowledgment, providing the device with the requested IP address and network configuration.

## CI/CD

1. What do you understand by continuous integration and continuous delivery?
    1. Continuous Integration (CI):
        * Definition: CI is a development practice where developers regularly integrate their code changes into a shared repository, and each integration is verified by an automated build and automated tests.
        * Benefits:
            * Early detection of integration problems.
            * Reduced integration issues and conflicts.
            * Improved collaboration among team members.
            * Faster identification of bugs and issues.
    2. Continuous Delivery (CD):
        * Definition: CD is an extension of CI that aims to automate the entire software release process. It involves automatically deploying code changes to production or staging environments after passing through the CI pipeline.
        * Benefits:
            * Faster and more reliable software releases.
            * Reduced manual intervention in the release process.
            * Consistent and repeatable deployment processes.
            * Improved collaboration between development and operations teams.

## ROLLING / CANARY DEPLOYMENT

1. Rolling Deployment:
    * In a rolling deployment, the new version of the software is gradually rolled out to a subset of servers or instances at a time, while the old version continues to handle the remaining workload.
    * The process typically involves taking a small number of servers out of the load balancer, updating the software on those servers, and then reintroducing them into the production environment.
    * This deployment strategy helps in minimizing downtime and reducing the risk of widespread issues since the update is applied incrementally.
2. Canary Deployment:
    * Canary deployment is a more cautious approach where the new version of the software is initially deployed to a small subset of users or servers (the "canaries") before being rolled out to the entire user base.
    * The idea is to release the new version to a limited, carefully chosen audience to detect any potential issues or bugs before a full deployment.
    * If the canary phase is successful (i.e., no significant issues are detected), the new version is then gradually extended to a larger audience or the entire system.
    * Canary deployments are particularly useful for minimizing the impact of potential issues on a wider user base, as they allow for quick rollback or adjustment if problems arise.

## FAULT ISOLATION

1. Fault isolation involves the containment of failures within a system to prevent them from affecting the entire system. The goal is to localize and restrict the impact of a fault so that it doesn't propagate and cause a cascading failure.
2. Achieved with .....
3. Example - multiple AZ for the app. If one AZ goes down - fault is isolated there, not propagating to other AZs

## KEY-VALUE STORE

1. Key: A unique identifier that is used to reference a specific piece of data in the store. Keys are typically strings or numeric values.
2. Value: The data associated with a particular key. This can be any type of data, such as a string, number, binary blob, or even a more complex data structure like a JSON object.
3. Store: The underlying data structure or system that manages the storage and retrieval of key-value pairs.
4. Examples: Memcache. Redis

## RESILIENCE

1. Resilience refers to the ability of a system to continue functioning or quickly recover from failures, errors, or disruptions. A resilient system can maintain its core functionality even in the presence of adverse conditions, such as hardware failures, software bugs, or external attacks.
2. Achieved with redundancy and graceful degradation
3. Example - a cluster of webservers. If one of them fails - no problem

## Backup
Backup refers to the process of copying and storing data in a separate location, typically for the purpose of restoring it in case of accidental deletion, data corruption, or hardware failures. The primary goal of backups is to provide a point-in-time copy of your data that can be used to recover lost or damaged information.

## Disaster Recovery
Disaster recovery, on the other hand, is a broader concept that involves planning and implementing strategies to ensure the continuity of business operations in the event of a major disaster or disruption. This includes natural disasters, cyberattacks, power outages, and more. Disaster recovery involves not only data recovery but also ensuring the overall IT infrastructure, applications, and services can be restored quickly to minimize downtime.

## VIRTUALIZATION

1. Virtual Machines (VMs): Virtualization allows the creation of virtual machines, which are software-based representations of physical computers. Each VM operates as an independent and isolated system, running its own operating system (OS) and applications. Multiple VMs can run on a single physical server, sharing the underlying hardware resources.
2. Hypervisor (Virtual Machine Monitor): The hypervisor is a crucial component of virtualization. It is a software layer that sits between the hardware and the operating systems running on the virtual machines. The hypervisor manages the allocation of hardware resources to the virtual machines, ensuring efficient sharing and isolation.
3. Types of Hypervisors:
    * Type 1 Hypervisor (Bare Metal Hypervisor): Installs directly on the physical hardware and does not require a host operating system. Examples include VMware ESXi, Microsoft Hyper-V Server, and Xen.
    * Type 2 Hypervisor (Hosted Hypervisor): Runs on top of a host operating system. Users install this type of hypervisor as a software application. Examples include VMware Workstation, Oracle VirtualBox, and Parallels.
4. Containerization: While virtualization involves creating complete virtual machines, containerization involves encapsulating applications and their dependencies into lightweight, portable containers. Containers share the host OS kernel but operate in isolated user spaces. Docker and Kubernetes are popular containerization technologies.
5. Benefits of Virtualization:
    * Resource Utilization: Virtualization allows better utilization of hardware resources by running multiple virtual machines on a single physical server.
    * Isolation: Virtualization provides isolation between different virtual machines, enhancing security and preventing interference.
    * Flexibility and Scalability: Virtual machines can be easily created, moved, and scaled, providing flexibility in resource allocation.
    * Cost Savings: Consolidating multiple virtual machines onto a single physical server can reduce hardware costs and energy consumption.
6. Use Cases:
    * Server Virtualization: Running multiple virtual servers on a single physical server.
    * Desktop Virtualization: Running virtual desktops on a server, allowing users to access them remotely.
    * Network Virtualization: Abstracting network resources to create virtual networks.

## CONTINIOUS MONITORING

1. Performance Monitoring:
    * Metrics Collection: Continuous monitoring involves collecting and analyzing performance metrics such as response times, throughput, and resource utilization.
    * Alerting: Set up alerts for abnormal performance trends or thresholds being breached. This allows for proactive identification and resolution of issues.
2. Security Monitoring:
    * Vulnerability Scanning: Regularly scan the system for vulnerabilities in software, configurations, and other potential security weaknesses.
    * Intrusion Detection Systems (IDS): Employ IDS to detect and respond to potential security breaches and unauthorized access.
    * Log Analysis: Continuously analyze logs for suspicious activities, error patterns, and security events.
3. Availability Monitoring:
    * Uptime Monitoring: Monitor the system's availability and uptime to ensure that it meets the required service level agreements (SLAs).
    * Failover Testing: Regularly test failover mechanisms to ensure that backup systems can seamlessly take over in case of failures.
4. Scalability Monitoring:
    * Traffic Analysis: Monitor incoming traffic to anticipate and accommodate increases in load. This involves assessing the system's ability to scale horizontally or vertically.
    * Capacity Planning: Use monitoring data to plan for future capacity requirements and scale resources accordingly.
5. Configuration Management:
    * Change Management: Implement a robust change management process that includes continuous monitoring to ensure that changes don't negatively impact the system.
    * Configuration Audits: Regularly audit system configurations to ensure they align with security policies and best practices.
6. Compliance Monitoring:
    * Regulatory Compliance Checks: Continuously monitor the system to ensure compliance with industry regulations and standards. This includes data protection laws, industry-specific standards, etc.
7. Data Integrity Monitoring:
    * Data Validation: Regularly validate the integrity of data stored in the system to ensure it hasn't been corrupted or tampered with.
    * Backup Verification: Ensure that regular backups are taken and verify their integrity through monitoring.
8. Patch Management:
    * Patch Monitoring: Monitor for available patches and updates for the system's software components. Apply patches promptly to address security vulnerabilities and improve system stability.
9. Cost Monitoring:
    * Resource Cost Analysis: Monitor resource usage and associated costs to optimize resource allocation and ensure cost-effectiveness.
10. User Experience Monitoring:
    * User Feedback: Gather and analyze user feedback to identify any issues impacting the user experience. Monitor application performance from the user's perspective.

## DORA
DevOps Research and Assessment

1. Lead Time for Changes: This measures the time it takes for code changes to go from commit to deployment.
2. Deployment Frequency: This indicates how often code changes are deployed to production.
3. Change Failure Rate: This measures the percentage of deployments that result in a failure (require further corrective action).
4. Time to Restore Service: This measures how quickly a team can restore service after a failure.

## FLOW AND ERROR CONTROL

1. Flow Control:
2. Flow control is the management of data flow between two devices to prevent congestion and ensure that the sender does not overwhelm the receiver. There are two main types of flow control:
    * Stop-and-Wait Flow Control: In this simple flow control mechanism, the sender sends one frame at a time and waits for an acknowledgment from the receiver before sending the next frame. While it's straightforward, it may not be the most efficient, especially for high-speed networks.
    * Sliding Window Flow Control: This approach allows multiple frames to be in transit before the sender requires an acknowledgment. It improves efficiency by keeping the communication link busy, which is particularly important in high-speed networks.
3. Error Control:
4. Error control ensures the integrity of data during transmission. It involves detecting and correcting errors that may occur due to noise, interference, or other factors. Common techniques for error control include:
    * Parity Checking: This is a simple method where an extra bit (parity bit) is added to each byte to make the number of ones either even (even parity) or odd (odd parity). If the number of ones is not as expected, an error is assumed.
    * Checksums: A checksum is a value calculated from the data and included with the data during transmission. The receiver also calculates a checksum from the received data and compares it with the transmitted checksum. If they match, the data is assumed to be error-free.
    * Cyclic Redundancy Check (CRC): CRC is a more sophisticated error-checking technique. It involves generating a fixed-size polynomial, appending it to the data, and sending the result. The receiver performs the same calculation and checks if the result matches the received polynomial.
    * Automatic Repeat reQuest (ARQ): ARQ protocols automatically request the retransmission of data when errors are detected. Stop-and-Wait and Sliding Window flow control mechanisms can be considered as types of ARQ.
5. Hybrid Approaches:
    1. In many practical systems, a combination of flow control and error control methods is used to ensure reliable and efficient data communication.

## LINUX BOOT

1. BIOS/UEFI (Basic Input/Output System/Unified Extensible Firmware Interface):
    * When you turn on the computer, the BIOS or UEFI firmware is the first piece of software that runs. Its primary job is to perform hardware initialization and diagnostics.
    * The BIOS/UEFI locates and loads the bootloader from the boot device. The bootloader is a small piece of software responsible for loading the Linux kernel into memory.
2. Bootloader (GRUB - Grand Unified Bootloader is commonly used):
    * The bootloader's main role is to locate and load the Linux kernel into memory.
    * GRUB typically presents a menu to the user, allowing them to choose between different kernel versions or boot options.
3. Linux Kernel:
    * Once the bootloader hands control over to the Linux kernel, the kernel initializes the essential system components, such as the CPU, memory, and device drivers.
    * The kernel then mounts the root file system, which contains the necessary files for the operating system.
4. Initramfs (Initial RAM File System):
    * In some cases, an initramfs is used to load necessary drivers and modules before the root file system is mounted. This is especially important for situations where the kernel needs additional modules or drivers to access the root file system.
5. Init Process:
    * The init process is the first user-space process started by the kernel. Traditionally, Linux systems used SysV init, but many modern distributions have adopted systemd or other alternatives.
    * The init process initializes the system and starts essential system services and daemons.
6. User Space:
    * Once the init process completes its tasks, it transitions control to the user space. At this point, the user can log in, and the system is ready for user interaction.
    * User-specific processes and services are started, and the system is fully operational.

## LINUX USERS AND GROUPS

```sh
sudo useradd username #Creating a User:
sudo passwd username #Setting Passwords:
sudo userdel username #User Information:
sudo userdel -r username #Deleting a User:
su - username #Switching Users:
sudo groupadd groupname #Creating a Group:
sudo usermod -aG groupname username #Adding a User to a Group
getent group #Listing Groups
sudo chown :newgroup filename #Changing Group Ownership
sudo groupdel groupname #Deleting a Group
```

## Observability vs monitoring

- observability - monitor multiple runtimes, making the multi component system observations 
- Metrics of users behavior, monitoring of system performance, traces of request going through the system, accumulated logs — M2TL — observability
- Observability is a broader concept than monitoring, and can be available to business and other people, rather than ops

## How do you check historical CPU HTOP?
htop is a real-time process monitoring tool for Unix-like systems that shows the usage of system resources, including CPU usage. However, it doesn't provide historical data by default. To check historical CPU usage, you may need to use other tools. 
  1. Kibana would do
  2. sar (System Activity Reporter)
## How do you check file sizes in Linux OS?
1. du
2. stat

## graceful degradation
Graceful degradation is a concept in design and engineering that refers to a system's ability to maintain a certain level of functionality and usability even when some of its components or features fail or are not available. In other words, if one part of the system breaks or becomes unavailable, the rest of the system can still operate in a degraded but functional state.

## Differentiate between service-oriented and microservice architecture?
1. SOA is distributed monolith, sync commonication, data is centralized
2. Microservices are asynchronous, fault isolated

## What is Docker?
1. Docker is a platform for developing, shipping, and running applications in containers. Containers are lightweight, portable, and self-sufficient units that can run applications and their dependencies isolated from the host system.

## What is Containerization?
1. Containerization is a lightweight form of virtualization that allows applications and their dependencies to be packaged together in a consistent and portable environment. Containers are isolated units that encapsulate an application and its dependencies, such as libraries and runtime, ensuring that the application runs consistently across different computing environments.
