# commands

```sh
# watch mode
kubectl get pods -w

# more info
kubectl get pods -o wide
```

# Workshop ACC ICT

- kube was born in 2015
- 110 pods per node by default

Containers are not virtualisation, but isolation. 
- each container is isolated and visible with PS
- the goal is — immutable infrastructure

Kettle vs pet
- VMs are like pets - imperative
- Containers are like kettle - declarative

All the containers are similar
- the same interface
- possibly different implementations
- windows is not ready for the containers
- Open Container Initiative
    - provides the same interface

Container rules
- dont run as root
- stateless
    - think of storing auth data in the container. Keep the session outside
- one process per container, so it maps to the container architecture, and isolates
- tag with a version, do not use `latest`
- don't specify default vals
- no `COPY . .`, because cache is not possible

What k8s does not do
- no logging monitoring or alerting
- no app-level services. Only container level
- does not deploy source code and does not build your app
- limits the types of your apps
- requires different way of thinking, processes building, cloud native
    - you own it, you build it, you run it, end to end

Business case
- Cosystent across DTAP — dev, test, accept, production
- quick iterations
- HA
- runs anywhere
- improves quality
- no vendor lock

Network tools
- Flannel
- Callico

Namespaces
- separate set of pods
- base for RBAC
- boundary for resources
- might be for environments
- monitoring for separate namespace, logging also -- all isolated

Services
- load balancing
- round robin
- an endpoint for pods or ingress

Ingress
- advancel LB
- Traefik
- GatewayAPI

Controllers
- deployment
    - define pods and strategy of deployment
    - rollout
- replica set -- part of deployment
- stateful set
    - gives the pods an name -- meaningful
    - useful for cassandra in k8s
- daemon set
    - one instance per node

Todo Research
- Pod destruction budget
- Affinity and anti-affinity


# KEDA

KEDA, or Kubernetes Event-Driven Autoscaling, is a Kubernetes-based solution for auto-scaling containerized applications in response to events from sources like message queues, databases, or serverless functions. It allows developers to dynamically scale their applications running on Kubernetes in response to events from external sources without having to change their application code. 

- It supports a variety of event sources out of the box like Azure Event Hubs, Kafka, RabbitMQ, and AWS Kinesis. Developers can also write custom event sources.
- When events are detected from a configured source, KEDA will automatically scale the target application by increasing or decreasing the number of replicas running. This provides event-driven autoscaling capabilities.
- It works by deploying a Kubernetes custom resource called a ScaledObject which links an event source to an application. KEDA monitors the event source and scales the application accordingly.
- This allows building cloud native event-driven architectures on Kubernetes where the application dynamically adapts to the workload by automatically scaling in or out in response to events.
- KEDA has graduated from CNCF, indicating its maturity and production-readiness. It's commonly used in serverless and event-driven architectures on Kubernetes in cloud environments.

# Kubernetes federation

Managing and coordinating multiple Kubernetes clusters as a single unified entity. 

1. **Kubernetes Federation Control Plane**: The control plane is responsible for managing and coordinating the federated setup. It typically includes components like the Federation API Server and the Federated Controller Manager. The Federation API Server exposes the federated API, which allows users to interact with the federated control plane.
2. **Federated Resources**: In a federated Kubernetes setup, resources such as Deployments, Services, ConfigMaps, and other Kubernetes objects can be defined at the federated level. These resources are then propagated to the individual clusters in the federation. For example, you might define a federated Deployment, and replicas of that Deployment would be created in each cluster.
3. **Federated Configurations**: Federated configurations allow you to specify how resources should be replicated and managed across clusters. This includes defining placement policies, which determine where resources should be deployed based on criteria like cluster labels or geographic location.
4. **Federation API**: The Federation API extends the standard Kubernetes API to support federated resources and configurations. It allows users to interact with the federated control plane and manage resources at the federated level.
5. **Cluster Topology**: Federated Kubernetes supports various topologies, such as a single control plane managing multiple clusters or a multi-control plane setup where each cluster has its own control plane. The choice of topology depends on factors like geographical distribution, network latency, and desired fault tolerance.
6. **Global DNS**: In a federated setup, global DNS may be used to route traffic to the appropriate cluster based on the location of the user or other criteria. This ensures that users are directed to the closest or most suitable cluster for their requests.
7. **Cross-Cluster Communication**: Federated Kubernetes provides mechanisms for cross-cluster communication, allowing pods in one cluster to communicate with pods in other clusters. This is essential for building distributed and scalable applications.

# Containers 

are an application-centric method to deliver high-performing, scalable applications on any infrastructure of your choice

Containers encapsulate microservices and their dependencies but do not run them directly. Containers run container images.

A container image bundles the application along with its runtime, libraries, and dependencies, and it represents the source of a container deployed to offer an isolated executable environment for the application.

# Container orchestrators 

are tools which group systems together to form clusters where containers' deployment and management is automated at scale while meeting the requirements mentioned above.

* Fault-tolerance
* On-demand scalability
* Optimal resource usage
* Auto-discovery to automatically discover and communicate with each other
* Accessibility from the outside world
* Seamless updates/rollbacks without any downtime.

# Orchestrators

* **Amazon Elastic Container Service (ECS)** is a hosted service provided by Amazon Web Services (AWS) to run containers at scale on its infrastructure.
* **Kubernetes** is an open source orchestration tool, originally started by Google, today part of the Cloud Native Computing Foundation (CNCF) project.
* **Marathon** is a framework to run containers at scale on Apache Mesos and DC/OS.
* **Nomad** is the container and workload orchestrator provided by HashiCorp.
* **Docker Swarm** is a container orchestrator provided by Docker, Inc. It is part of Docker Engine.

Most container orchestrators can:
* Group hosts together while creating a cluster.
* Schedule containers to run on hosts in the cluster based on resources availability.
* Enable containers in a cluster to communicate with each other regardless of the host they are deployed to in the cluster.
* Bind containers and storage resources.
* Group sets of similar containers and bind them to load-balancing constructs to simplify access to containerized applications by creating an interface, a level of abstraction between the containers and the client.
* Manage and optimize resource usage.
* Allow for implementation of policies to secure access to applications running inside containers.

# Kubernetes features

* Automatic bin packingKubernetes automatically schedules containers based on resource needs and constraints, to maximize utilization without sacrificing availability.
* Designed for extensibilityA Kubernetes cluster can be extended with new custom features without modifying the upstream source code.
* Self-healingKubernetes automatically replaces and reschedules containers from failed nodes. It terminates and then restarts containers that become unresponsive to health checks, based on existing rules/policy. It also prevents traffic from being routed to unresponsive containers.
* Horizontal scalingWith Kubernetes applications are scaled manually or automatically based on CPU or custom metrics utilization.
* Service discovery and load balancingContainers receive IP addresses from Kubernetes, while it assigns a single Domain Name System (DNS) name to a set of containers to aid in load-balancing requests across the containers of the set.
* Automated rollouts and rollbacksKubernetes seamlessly rolls out and rolls back application updates and configuration changes, constantly monitoring the application's health to prevent any downtime.
* Secret and configuration managementKubernetes manages sensitive data and configuration details for an application separately from the container image, in order to avoid a rebuild of the respective image. Secrets consist of sensitive/confidential information passed to the application without revealing the sensitive content to the stack configuration, like on GitHub.
* Storage orchestrationKubernetes automatically mounts software-defined storage (SDS) solutions to containers from local storage, external cloud providers, distributed storage, or network storage systems.
* Batch executionKubernetes supports batch execution, long-running jobs, and replaces failed containers.
* IPv4/IPv6 dual-stackKubernetes supports both IPv4 and IPv6 addresses

# Kubernetes architecture

* one or more control plane nodes. The control plane node provides a running environment for the control plane agents responsible for managing the state of a Kubernetes cluster, and it is the brain behind all operations inside the cluster. 
    * **API Server** — REST ful, the only who talks to Key-value store, highly configurable and customizable. It can scale horizontally, but it also supports the addition of custom secondary API Servers
    * **Scheduler** — is to assign new workload objects, such as pods encapsulating containers, to nodes - typically worker nodes. 
        * The scheduler also takes into account Quality of Service (QoS) requirements, data locality, affinity, anti-affinity, taints, toleration, cluster topology, etc. 
        * The outcome of the decision process is communicated back to the API Server, which then delegates the workload deployment with other control plane agents.
        * The scheduler is highly configurable and customizable through scheduling policies, plugins, and profiles.
    * **Controller Managers** — are components of the control plane node running controllers or operator processes to regulate the state of the Kubernetes cluster.
        * Controllers are watch-loop processes continuously running and comparing the cluster's desired state (provided by objects' configuration data) with its current state (obtained from the key-value store via the API Server).
        * The kube-controller-manager runs controllers or operators responsible to act when nodes become unavailable, to ensure container pod counts are as expected, to create endpoints, service accounts, and API access tokens.
        * The cloud-controller-manager runs controllers or operators responsible to interact with the underlying infrastructure of a cloud provider when nodes become unavailable, to manage storage volumes when provided by a cloud service, and to manage load balancing and routing.
    * **Key-Value Data Store** — etcd 
        * strongly consystent
        * append only
        * obsolete data is compacted
        * only API Server writes to it
        * etcdctl, provides snapshot save and restore capabilities
        *  kubeadm, by default, provision stacked etcd control plane nodes, where the data store runs alongside and shares resources with the other control plane components on the same control plane node.
        * etcd can run on a dedicated host or cluster
    * **Container Runtime**
    * **Node Agent**
    * **Proxy**
    * Optional add-ons for cluster-level monitoring and logging.
* One or more **worker nodes** —  provides a running environment for client applications
    * **Container Runtime**
        * CRI-O
        * containerd
        * docker
    * **CRI shim** — an application which provides a clear abstraction layer between kubelet and the container runtime. talks GRPC
    * **Node Agent** - **kubelet** — The kubelet is an agent running on each node, control plane and workers, and communicates with the control plane. It receives Pod definitions, primarily from the API Server, and interacts with the container runtime on the node to run containers associated with the Pod. It also monitors the health and resources of Pods running containers. 
        * Connects through the Container Runtime Interface (CRI)
            * ImageService is responsible for all the image-related operations, while the 
            * RuntimeService is responsible for all the Pod and container-related operations.
    * **Proxy - kube-proxy** — runs on each node, control plane and workers, responsible for dynamic updates and maintenance of all networking rules on the node. 
        * It abstracts the details of Pods networking and forwards connection requests to the containers in the Pods. 
        * responsible for TCP, UDP, and SCTP stream forwarding
        * kube-proxy configures iptables rules to capture the traffic for its ClusterIP and forwards it to one of the Service's endpoints
        * Traffic policies allow users to instruct the kube-proxy on the context of the traffic routing. The two options are Cluster and Local:
            * The Cluster option allows kube-proxy to target all ready Endpoints of the Service in the load-balancing process.
            * The Local option, however, isolates the load-balancing process to only include the Endpoints of the Service located on the same node as the requester Pod. While this sounds like an ideal option, it does have a shortcoming - if the Service does not have a ready Endpoint on the node where the requester Pod is running, the Service will not route the request to Endpoints on other nodes to satisfy the request. 
    * Add-ons — implemented through 3rd-party pods and services
        * DNSCluster DNS is a DNS server required to assign DNS records to Kubernetes objects and resources.
        * Dashboard A general purpose web-based user interface for cluster management.
        * Monitoring Collects cluster-level container metrics and saves them to a central data store.
        * Logging Collects cluster-level container logs and saves them to a central log store for analysis.
* **Pods** are scheduled on worker nodes, where they find required compute, memory and storage resources to run, and networking to talk to each other and the outside world. A Pod is the smallest scheduling work unit in Kubernetes. It is a logical collection of one or more containers scheduled together, and the collection can be started, stopped, or rescheduled as a single unit of work. 
* **Network**
    * Container-to-Container communication inside Pods
        * network namespace — container runtime creates an isolated network space for each container it starts
            * can be shared across containers and the host system
        * Pause container - aspecial infrastructure which reates a  temp network for starting up contaners
    * Pod-to-Pod communication on the same node and across cluster nodes
        * each pod got an IP, so it is a Host. This model is called "IP-per-Pod"
        * localhost inside the pod refers to that host
        * Container Network Interface (CNI) supported by CNI plugins
    * Service-to-Pod communication within the same namespace and across cluster namespaces
        * aka external-to-pod
        * implemented with network routing rule definitions stored in iptables and implemente dby kube-proxy agents
        * 
    * External-to-Service communication for clients to access applications in a cluster

# Kubernetes installation types

* All-in-One Single-Node InstallationIn this setup, all the control plane and worker components are installed and running on a single-node. While it is useful for learning, development, and testing, it is not recommended for production purposes.
* Single-Control Plane and Multi-Worker InstallationIn this setup, we have a single-control plane node running a stacked etcd instance. Multiple worker nodes can be managed by the control plane node.
* Single-Control Plane with Single-Node etcd, and Multi-Worker InstallationIn this setup, we have a single-control plane node with an external etcd instance. Multiple worker nodes can be managed by the control plane node.
* Multi-Control Plane and Multi-Worker InstallationIn this setup, we have multiple control plane nodes configured for High-Availability (HA), with each control plane node running a stacked etcd instance. The etcd instances are also configured in an HA etcd cluster and multiple worker nodes can be managed by the HA control plane.
* Multi-Control Plane with Multi-Node etcd, and Multi-Worker InstallationIn this setup, we have multiple control plane nodes configured in HA mode, with each control plane node paired with an external etcd instance. The external etcd instances are also configured in an HA etcd cluster, and multiple worker nodes can be managed by the HA control plane. This is the most advanced cluster configuration recommended for production environments. 


# Kubernetes object model — nodes

- nodes are managed with kubelet and kube-proxy
- nodes host container runtime

# Kubernetes object model — namespaces

- Creates a virtual sub-clusters
- The names of the resources/objects created inside a Namespace are unique, but not across Namespaces in the cluster.
- Out of the box
    - The kube-system Namespace contains the objects created by the Kubernetes system, mostly the control plane agents. 
    - The default Namespace contains the objects and resources created by administrators and developers, and objects are assigned to it by default unless another Namespace name is provided by the user
    - kube-public is a special Namespace, which is unsecured and readable by anyone, used for special purposes such as exposing public (non-sensitive) information about the cluster.
    - kube-node-lease which holds node lease objects used for node heartbeat data. 


# Kubernetes object model — pods

- the smallest Kubernetes workload object.
- represents a single instance of the application
- is a logical collection of one or more containers
    - containers scheduled together on the same host with the Pod.
    - containers Share the same network namespace, meaning that they share a single IP address originally assigned to the Pod.
    - containers Have access to mount the same external storage (volumes) and other common dependencies.
- Pods are ephemeral in nature, and they do not have the capability to self-heal themselves
    - this is why controllers are there

LIVENESS 
- probes to know when to restart a container
- A common pattern for liveness probes is to use the same low-cost HTTP endpoint as for readiness probes, but with a higher failureThreshold
- If Readiness and Liveness Probes overlap there may be a risk that the container never reaches ready state, being stuck in an infinite re-create - fail loop.

READINESS
- Sometimes, while initializing, applications have to meet certain conditions before they become ready to serve traffic. These conditions include ensuring that the dependent service is ready, or acknowledging that a large dataset needs to be loaded, etc

# Kubernetes object model — controllers

Examles
- Deployments — Deployment objects provide declarative updates to Pods and ReplicaSets. The DeploymentController is part of the control plane node's controller manager, and as a controller it also ensures that the current state always matches the desired state of our running containerized application. It allows for seamless application updates and rollbacks, known as the default RollingUpdate strategy, through rollouts and rollbacks, and it directly manages its ReplicaSets for application scaling. It also supports a disruptive, less popular update strategy, known as Recreate. 
- ReplicaSets — observes the amount of pods, matches it against desired amount, and creates new ones if needed. Deployments are recommended over it. 
- DaemonSets — DaemonSets are operators designed to manage node agents. They resemble ReplicaSet and Deployment operators when managing multiple Pod replicas and application updates, but the DaemonSets present a distinct feature that enforces a single Pod replica to be placed per Node, on all the Nodes. In contrast, the ReplicaSet and Deployment operators by default have no control over the scheduling and placement of multiple Pod replicas on the same Node.
    - DaemonSet's Pods are placed on all cluster's Nodes by the controller itself and not with the help of the default SchedulerJobs

# Kubernetes object model — labels

- are key-value pairs attached to Kubernetes objects
- Labels do not provide uniqueness to objects
- Label selectors
    - Set-Based Selectors
    - Equality-Based Selectors

# Kubernetes object model — services

- The Service API, part of Kubernetes, is an abstraction to help you expose groups of Pods over a network. 
- A Service is an object (the same way that a Pod or a ConfigMap is an object). 
- is the recommended method to expose any containerized application to the Kubernetes network. 
- Service offers a single DNS entry for a stateless containerized application managed by the Kubernetes cluster, regardless of the number of replicas, by providing a common load balancing access point to a set of pods logically grouped and managed by a controller such as a Deployment, ReplicaSet, or DaemonSet. 
- Use Labels to select pods, which will be included into the service
- Services can expose single Pods, ReplicaSets, Deployments, DaemonSets, and StatefulSets.
    - When exposing the Pods managed by an operator, the Service's Selector may use the same label(s) as the operator.
- Also maps traffic from service port to pods port 


SERVICE DISCOVERY

Environment VariablesAs soon as the Pod starts on any worker node, the kubelet daemon running on that node adds a set of environment variables in the Pod for all active Services.

DNSKubernetes has an add-on for DNS, which creates a DNS record for each Service and its format is my-svc.my-namespace.svc.cluster.local. 

SERVICE TYPE

* Is only accessible within the cluster.
    * A Service receives a Virtual IP address, known as its ClusterIP. This Virtual IP address is used for communicating with the Service and is accessible only from within the cluster. 
    * With the NodePort ServiceType, in addition to a ClusterIP, a high-port, dynamically picked from the default range 30000-32767, is mapped to the respective Service, from all the worker nodes. For example, if the mapped NodePort is 32233 for the service frontend-svc, then, if we connect to any worker node on port 32233, the node would redirect all the traffic to the assigned ClusterIP - 172.17.0.4. If we prefer a specific high-port number instead, then we can assign that high-port number to the NodePort from the default range when creating the Service. 
* LoadBalancer ServiceType:
    * NodePort and ClusterIP are automatically created, and the external load balancer will route to them.
    * The Service is exposed at a static port on each worker node.
    * The Service is exposed externally using the underlying cloud provider's load balancer feature.
    * The LoadBalancer ServiceType will only work if the underlying infrastructure supports the automatic creation of Load Balancers and have the respective support in Kubernetes, as is the case with the Google Cloud Platform and AWS. If no such feature is configured, the LoadBalancer IP address field is not populated, it remains in Pending state, but the Service will still work as a typical NodePort type Service
* A Service can be mapped to an ExternalIP address if it can route to one or more of the worker nodes. Traffic that is ingressed into the cluster with the ExternalIP (as destination IP) on the Service port, gets routed to one of the Service endpoints. This type of service requires an external cloud provider such as Google Cloud Platform or AWS and a Load Balancer configured on the cloud provider's infrastructure.
* ExternalName is a special ServiceType that has no Selectors and does not define any endpoints. When accessed within the cluster, it returns a CNAME record of an externally configured Service.
    * The primary use case of this ServiceType is to make externally configured Services like my-database.example.com available to applications inside the cluster. If the externally defined Service resides within the same Namespace, using just the name my-database would make it available to other applications and Services within that same Namespace. 
* A Service resource can expose multiple ports at the same time if required. Its configuration is flexible enough to allow for multiple groupings of ports to be defined in the manifest. This is a helpful feature when exposing Pods with one container listening on more than one port, or when exposing Pods with multiple containers listening on one or more ports.

# Authentication

Authorizes the API requests submitted by the authenticated user.

* Normal UsersThey are managed outside of the Kubernetes cluster via independent services like User/Client Certificates, a file listing usernames/passwords, Google accounts, etc.
* Service AccountsService Accounts allow in-cluster processes to communicate with the API server to perform various operations. Most of the Service Accounts are created automatically via the API server, but they can also be created manually. The Service Accounts are tied to a particular Namespace and mount the respective credentials to communicate with the API server as Secrets.

 authentication modules:
* X509 Client CertificatesTo enable client certificate authentication, we need to reference a file containing one or more certificate authorities by passing the --client-ca-file=SOMEFILE option to the API server. The certificate authorities mentioned in the file would validate the client certificates presented by users to the API server. A demonstration video covering this topic can be found at the end of this chapter.
* Static Token FileWe can pass a file containing pre-defined bearer tokens with the --token-auth-file=SOMEFILE option to the API server. Currently, these tokens would last indefinitely, and they cannot be changed without restarting the API server.
* Bootstrap TokensTokens used for bootstrapping new Kubernetes clusters.
* Service Account TokensAutomatically enabled authenticators that use signed bearer tokens to verify requests. These tokens get attached to Pods using the Service Account Admission Controller, which allows in-cluster processes to talk to the API server.
* OpenID Connect TokensOpenID Connect helps us connect with OAuth2 providers, such as Azure Active Directory, Salesforce, and Google, to offload the authentication to external services.
* Webhook Token AuthenticationWith Webhook-based authentication, verification of bearer tokens can be offloaded to a remote service.
* Authenticating ProxyAllows for the programming of additional authentication logic.

# Authorization

Authenticate a user based on credentials provided as part of API requests.

NodeNode authorization is a special-purpose authorization mode which specifically authorizes API requests made by kubelets. It authorizes the kubelet's read operations for services, endpoints, or nodes, and writes operations for nodes, pods, and events. For more details, please review the Node authorization documentation.

Attribute-Based Access Control (ABAC)With the ABAC authorizer, Kubernetes grants access to API requests, which combine policies with attributes. 

WebhookIn Webhook mode, Kubernetes can request authorization decisions to be made by third-party services, which would return true for successful authorization,

Role-Based Access Control (RBAC)In general, with RBAC we regulate the access to resources based on the Roles of individual users. In Kubernetes, multiple Roles can be attached to subjects like users, service accounts, etc. While creating the Roles, we restrict resource access by specific operations, such as create, get, update, patch, etc. These operations are referred to as verbs. In RBAC, we can create two kinds of Roles:
* RoleA Role grants access to resources within a specific Namespace.
* ClusterRoleA ClusterRole grants the same permissions as Role does, but its scope is cluster-wide.

The manifest defines a pod-reader role, which has access only to read the Pods of lfs158 Namespace. Once the role is created, we can bind it to users with a RoleBinding object. 

There are two kinds of RoleBindings:
* RoleBindingIt allows us to bind users to the same namespace as a Role. We could also refer to a ClusterRole in RoleBinding, which would grant permissions to Namespace resources defined in the ClusterRole within the RoleBinding’s Namespace.
* ClusterRoleBindingIt allows us to grant access to resources at a cluster-level and to all Namespaces.

# Admission control

Software modules that validate and/or modify user requests

Admission controllers are used to specify granular access control policies, which include allowing privileged containers, checking on resource quota, etc. We force these policies using different admission controllers, like ResourceQuota, DefaultStorageClass, AlwaysPullImages, etc. They come into effect only after API requests are authenticated and authorized.

# Volumes

- A Volume is essentially a mount point on the container's file system backed by a storage medium. The storage medium, content and access mode are determined by the Volume Type.
- a Volume is linked to a Pod and can be shared among the containers of that Pod. 
- emptyDirAn empty Volume is created for the Pod as soon as it is scheduled on the worker node. The Volume's life is tightly coupled with the Pod. If the Pod is terminated, the content of emptyDir is deleted forever.  
- hostPathWith the hostPath Volume Type, we can share a directory between the host and the Pod. If the Pod is terminated, the content of the Volume is still available on the host.
- secretWith the secret Volume Type, we can pass sensitive information, such as passwords, to Pods.
- configMap With configMap objects, we can provide configuration data, or shell commands and arguments into a Pod.
- persistentVolumeClaimWe can attach a PersistentVolume to a Pod using a persistentVolumeClaim. 

A PersistentVolumeClaim (PVC) is a request for storage by a user. Users request for PersistentVolume resources based on storage class, access mode, size, and optionally volume mode
- ReadWriteOnce (read-write by a single node), 
- ReadOnlyMany (read-only by many nodes), 
- ReadWriteMany (read-write by many nodes), 
- ReadWriteOncePod (read-write by a single pod)
After a successful bound, the PersistentVolumeClaim resource can be used by the containers of the Pod.
I mean mounted and read/write

# Container storage interface — CSI

designed to work on different container orchestrators with a variety of storage providers. 

# Config maps

ConfigMaps allow us to decouple the configuration details from the container image. Using ConfigMaps, we pass configuration data as key-value pairs, which are consumed by Pods or any other system components and controllers, in the form of environment variables, sets of commands and arguments, or volumes. We can create ConfigMaps from 
- literal values, 
- from configuration files, 
- from one or more files or directories.

See convig values as env variables inside of the containers
- mapping can be done automatically, mentioning 1 config map
- or mapped manually corellating config map keys with manually defined variables 

Can also be mounted as a Volume inside a Pod

kubectl create configmap my-config \
  --from-literal=key1=value1 \
  --from-literal=key2=value2

# Secret

Secret data is stored as plain text inside etcd, therefore 
- administrators must limit access to the API server and etcd.
- Secret data can be encrypted at rest while it is stored in etcd

kubectl create secret generic my-password \  --from-literal=password=mysqlpassword

make sure you do not commit a Secret's definition file in the source code.
With stringData maps, there is no need to encode the value of each sensitive information field. The value of the sensitive field will be encoded when the my-password Secret is created

Secrets are consumed by Containers in Pods as mounted data volumes, or as environment variables, and are referenced in their entirety or specific key-values.

We can also mount a Secret as a Volume inside a Pod.

# Ingress

Ways to espose the app:
- Services, with ServiceType
    - NodePort — complicated, we need to update our proxy settings, and keep track of assigned ports
    - LoadBalancer — neeeds support fro underlying infra, also expensive
- Ingress — another layer of abstraction, in front of services

Properties
- Ingres is associated with specific service
- Decouples the routing rules from the application and centralize the rules management, we can then update our application without worrying about its external acces
- An Ingress is a collection of rules that allow inbound connections to reach the cluster Services
- Ingress configures a Layer 7 HTTP/HTTPS load balancer for Services 
- The Ingress resource does not do any request forwarding by itself, it merely accepts the definitions of traffic routing rules. The ingress is fulfilled by an Ingress Controller, which is a reverse proxy responsible for traffic routing based on rules defined in the Ingress resource.
- An Ingress Controller is an application watching the Control Plane Node's API server for changes in the Ingress resources and updates the Layer 7 Load Balancer accordingly. Ingress Controllers are also know as Controllers, Ingress Proxy, Service Proxy, Revers Proxy, etc.

Helps with
* TLS (Transport Layer Security)
* Name-based virtual hosting
* Fanout routing
* Loadbalancing
* Custom rules.

# Annotations

With Annotations, we can attach arbitrary non-identifying metadata to any objects, in a key-value format:

```json
"annotations": {  
    "description": "Deployment based PoC dates 2nd Mar2022",
    "key2" : "value2"
}
```

Unlike Labels, annotations are not used to identify and select objects. Annotations can be used to:
* Store build/release IDs, PR numbers, git branch, etc.
* Phone/pager numbers of people responsible, or directory entries specifying where such information can be found.
* Pointers to logging, monitoring, analytics, audit repositories, debugging tools, etc.
* Ingress controller information.
* Deployment state and revision information.

Annotations are displayed while describing an object

# Quota and Limits Management

per Namespace:
* Compute Resource QuotaWe can limit the total sum of compute resources (CPU, memory, etc.) that can be requested in a given Namespace.
* Storage Resource QuotaWe can limit the total sum of storage resources (PersistentVolumeClaims, requests.storage, etc.) that can be requested.
* Object Count QuotaWe can restrict the number of objects of a given type (pods, ConfigMaps, PersistentVolumeClaims, ReplicationControllers, Services, Secrets, etc.).

LimitRange, used in conjunction with the ResourceQuota API resource. A LimitRange can:
* Set compute resources usage limits per Pod or Container in a namespace.
* Set storage request limits per PersistentVolumeClaim in a namespace.
* Set a request to limit ratio for a resource in a namespace.
* Set default requests and limits and automatically inject them into Containers' environments at runtime.

# Autoscaling a.k.a. Elasticity

* Horizontal Pod Autoscaler (HPA)HPA is an algorithm-based controller API resource which automatically adjusts the number of replicas in a ReplicaSet, Deployment or Replication Controller based on CPU utilization.
* Vertical Pod Autoscaler (VPA)VPA automatically sets Container resource requirements (CPU and memory) in a Pod and dynamically adjusts them in runtime, based on historical utilization data, current resource availability and real-time events.
* Cluster AutoscalerCluster Autoscaler automatically re-sizes the Kubernetes cluster when there are insufficient resources available for new Pods expecting to be scheduled or when there are underutilized nodes in the cluster.

# Jobs and Cronjobs

A Job creates one or more Pods to perform a given task. The Job object takes the responsibility of Pod failures. It makes sure that the given task is completed successfully. Once the task is complete, all the Pods have terminated automatically. Job configuration options include:
* parallelism - to set the number of pods allowed to run in parallel;
* completions - to set the number of expected completions;
* activeDeadlineSeconds - to set the duration of the Job;
* backoffLimit - to set the number of retries before Job is marked as failed;
* ttlSecondsAfterFinished - to delay the cleanup of the finished Jobs.

we can also perform Jobs at scheduled times/dates with CronJobs, where a new Job object is created about once per each execution cycle. The CronJob configuration options include:
* startingDeadlineSeconds - to set the deadline to start a Job if scheduled time was missed;
* concurrencyPolicy - to allow or forbid concurrent Jobs or to replace old Jobs with new ones. 

# Stateful sets

The StatefulSet controller is used for stateful applications which require a unique identity, such as name, network identifications, or strict ordering. For example, MySQL cluster, etcd cluster.
The StatefulSet controller provides identity and guaranteed ordering of deployment and scaling to Pods. However, the StatefulSet controller has very strict Service and Storage Volume dependencies that make it challenging to configure and deploy. It also supports scaling, rolling updates, and rollbacks.

# Custom resources

a resource is an API endpoint which stores a collection of API objects. For example, a Pod resource contains all the Pod objects.

Custom resources are dynamic in nature, and they can appear and disappear in an already running cluster at any time.

There are two ways to add custom resources:
* Custom Resource Definitions (CRDs)This is the easiest way to add custom resources and it does not require any programming knowledge. However, building the custom controller would require some programming. 
* API AggregationFor more fine-grained control, we can write API Aggregators. They are subordinate API services which sit behind the primary API Server. The primary API Server acts as a proxy for all incoming API requests - it handles the ones based on its capabilities and proxies over the other requests meant for the subordinate API services.

# Network policies

Network Policies are sets of rules which define how Pods are allowed to talk to other Pods and resources inside and outside the cluster. Pods not covered by any Network Policy will continue to receive unrestricted traffic from any endpoint. 

Network Policies are very similar to typical Firewalls. They are designed to protect mostly assets located inside the Firewall but can restrict outgoing traffic as well based on sets of rules and policies. 

The Network Policy API resource specifies podSelectors, Ingress and/or Egress policyTypes, and rules based on source and destination ipBlocks and ports. Very simplistic default allow or default deny policies can be defined as well.


# Monitoring

* Metrics Server Metrics Server is a cluster-wide aggregator of resource usage data - a relatively new feature in Kubernetes.
* PrometheusPrometheus, now part of CNCF (Cloud Native Computing Foundation), can also be used to scrape the resource usage from different Kubernetes components and objects. Using its client libraries, we can also instrument the code of our application. 

# Logging

Kubernetes does not provide cluster-wide logging by default
Fluentd

Although we can extract container logs from the cluster, we are limited only to logs of currently running containers

```sh
# get the logs of last failed container, if it is continuously restarting
kubectl logs pod-name -c container-name —previous
```

# Debug

```sh
kubectl exec pod-name -c container-name -it -- /bin/sh
kubectl get events
kubectl describe pod pod-name
```

# Deployment strategies

- The Rolling Update mechanism, and its reverse - the Rollback
    - However, while transitioning between the old and the new versions of the application replicas, the Service exposing the Deployment eventually forwards traffic to all replicas, old and new, without any possibility for the default Service to isolate a subset of the Deployment's replicas.
- The Canary strategy runs two application releases simultaneously managed by two independent Deployment controllers, both exposed by the same Service. The users can manage the amount of traffic each Deployment is exposed to by separately scaling up or down the two Deployment controllers, thus increasing or decreasing the number of their replicas receiving traffic. 
- The Blue/Green strategy runs the same application release or two releases of the application on two isolated environments, but only one of the two environments is actively receiving traffic, while the second environment is idle, or may undergo rigorous testing prior to shifting traffic to it. This strategy would also require two independent Deployment controllers, each exposed by their dedicated Services, however, a traffic shifting mechanism is also required. Typically, the traffic shifting can be implemented with the use of an Ingress. 