# GKE Node Pool
- all the nodes in one pool are identical
- different ppools might have different characteristics
- still they might be connected to the cluster
- where to schedule what pod — is determined by node taints
- You cannot configure a single node in a node pool; any configuration changes affect all nodes in the node pool
- nodeSelector in the Pod manifest
- You can specify resource requests for the containers. 
- https://cloud.google.com/kubernetes-engine/docs/concepts/node-pools


# Getting started
```sh
brew install --cask google-cloud-sdk
gcloud init
```

# Cloud Build (CI)
- It allows you to build, test, and deploy your applications easily and reliably on Google Cloud Platform.
- Cloud Build executes your builds as a series of build steps, where each step runs in a Docker container using a specified builder image. This allows builds to be reproducible.
- You can trigger Cloud Build builds manually through the Google Cloud Console, CLI or API. It also integrates with source control systems like GitHub, Bitbucket etc. to trigger builds automatically on code changes.
- Common use cases include building container images from source, running tests and deploying applications. The build configuration is defined using a YAML file.
- After the build completes, it produces artifacts like container images, package files etc. that can be stored in Google Cloud Storage or Container Registry for deployment.
- It handles provisioning infrastructure for your builds automatically so you don't have to manage build machines. Builds are run in a fully managed environment.

# Cloud Deploy (CD)

1. Infrastructure Configuration: With Cloud Deploy, you can define and manage your infrastructure as code using tools like Deployment Manager, Terraform, or declarative API like Cloud Deployment Manager. This ensures consistency and reproducibility of your infrastructure setup.

2. Automated Release Pipelines: Cloud Deploy allows you to create automated release pipelines that include multiple stages or environments like development, testing, staging, and production. Each stage can have different deployment strategies and configurations.

4. Flexible Deployment Strategies: Cloud Deploy supports various deployment strategies like blue-green deployments, canary deployments, and rolling updates. These strategies ensure that your applications are deployed with minimum downtime and allow you to easily roll back in case of issues.

5. Monitoring and Rollback: Cloud Deploy provides monitoring capabilities that allow you to track the health and performance of your deployments. In case of any issues, you can easily roll back to a previously working version of your application.

6. Integration with Other GCP Services: Cloud Deploy integrates with other GCP services like Cloud Build for continuous integration, Cloud Monitoring for observability, and Cloud IAM for managing access controls.

# Cloud Build + Cloud Deploy

While Cloud Build focuses on the build and package aspects of the CI/CD pipeline, Cloud Deploy focuses on the deployment phase. In an end-to-end CI/CD workflow, you can use Cloud Build to build your application and create an artifact, and then use Cloud Deploy to deploy that artifact to the desired environment.

# Cloud Deploy + FluxCD

FluxCD can be integrated with Cloud Build to automate the deployment process:

1. Cloud Build is configured to build container images when there are changes to the source code repository. It creates the container images with the required dependencies and packages.

2. Once the container images are built, Cloud Build can push them to a container registry, such as Google Container Registry or Docker Hub.

3. FluxCD is configured to monitor the container registry for changes. When a new container image is detected, FluxCD updates the Kubernetes manifests (deployment, service, etc.) with the new image tag.

4. FluxCD then takes care of applying and synchronizing the changes to the Kubernetes cluster. It ensures that the new image is deployed to the appropriate pods and services without any downtime.

Therefore, by combining Cloud Build and FluxCD, you can automate the entire process of building container images, pushing them to a container registry, and deploying them to a Kubernetes cluster. This results in a streamlined continuous delivery pipeline for your applications.

# What Is Google Cloud?
Cloud computing refers to the integration of hardware and software products to provide specific services to customers. Google Cloud is a suite of cloud computing services owned by Google that are used by several Fortune 500 companies. There are over 100 Google products that fall within the Google Cloud brand. Some of the critical service categories of Google Cloud include:
1. **Compute**: This is a perfect example of infrastructure as a service (IaaS). With the help of Compute engine, one can launch virtual machines on demand. It is also the infrastructure that supports the functioning of the Google search engine and other services such as Gmail and YouTube.
2. **Networking**: This component connects various Google resources and services to each other.
3. **Storage and Databases**: This enables organizations to create transformative applications, deploy faster and provide portability to the data.
4. **Big Data**: With the help of Big Data, you can store and query datasets containing a vast amount of data. Big Data can be integrated with other GCP services and also supports SQL.
5. **Artificial Intelligence** (AI)/Machine Learning (ML): This product provides access to Google's artificial intelligence to run businesses more smoothly.
6. **Management Tools**: The role of management tools is to provide visibility, accountability and control to scale up business using a cloud computing system. These tools help reduce the complexity of using cloud systems.
7. **Identity and Security**: This is an example of  Identity as a Service (IDaaS) for achieving confidentiality, data integrity, and authentication of data.

# Tell us about the various layers of Google Cloud.
There are four layers of the Google cloud platform:
1. Infrastructure as a Service (IaaS): This is the basic layer that consists of hardware and network.
2. Platform as a Service (PaaS): This is the second layer that provides the necessary resources for building applications along with the infrastructure.
3. Software as a Service (SaaS): Saas is the third layer that allows the user to access the various cloud offerings from the service provider.
4. Business Process Outsourcing: This is the final layer even though BPO is not a technical solution. BPO is concerned with outsourcing services to a vendor to take care of any issues faced by the end-user while using the cloud computing services.

# What are the various Google Cloud storage services?
The common ones are:
* Google Workspace
* Cloud Storage (Object storage)
* Persistent disk
* Filestore
* Data Transfer Services
* Transfer Appliance
* Cloud Storage for Firebase
* Local SSD
* Cloud Storage (Archival storage)

# What is the use of bucket in Google Cloud Storage?

Buckets can be defined as basic containers used for storing data. Anything that you store on Cloud Storage must be stored in a bucket. There is no limit on the creation or deletion of the buckets. However, unlike directories and files, buckets cannot be nested.

# What is Google Cloud Messaging?
It is a mobile notification service that allows third-party application developers to send notification data from developer-run servers to applications. It has been deactivated since April 2018 and replaced by Firebase Cloud Messaging.

# What is the relationship between Google Compute Engine and Google App Engine?
Google Compute Engine is the IaaS product, while Google App Engine is a PaaS product. They are complementary to each other. The App Engine is used for running web-based applications and mobile backends, while you can use Compute Engine for implementing any customized business logic or even run your own storage system.

# What do you know about Google Cloud APIs?
The primary use of APIs is to automate the workflow through your preferred language. APIs enable communication with various Google services and also facilitate their integration to other services. It can also be defined as a gateway that allows access to direct and indirect cloud infrastructure and various software services to end-users.

# Can you list out the major features of the Google Cloud Platform?
The key features include:
* Ability to create custom machine types where you can vary the CPU, memory, and storage.
* Resizing the disk in-pace can be carried out without any downtime.
* GCP has various pre-installed tools that can be used for controlling different processes.
* There are two hosting options. Users can either opt for App Engine, which is Platform as a Service, or Compute Engine, which is Infrastructure as a Service.

# What is the permission required to create backups in GCP?
In Google Cloud Platform (GCP), the permissions required to create backups depend on the specific service you are using to manage your backups.

# I have containerized data processing jobs; I want to run them sequentially, i.e., also be one after another -- how can I achieve it?
1. timeline, manually separate ans sequence them with crontab
2. the best way would be a queue
3. separate the programmatically with semaphors
4. docker run with the --depends-on option


# What limitations of cloud dataflow are you aware of?
1. Google Cloud Dataflow is a fully managed service for stream and batch processing that supports the Apache Beam model.
2. throughput limitations for ingestion, so batches are more efficient
3. data quality and validation is easier to ensure while batching. With realtime streaming it is more difficult
4. batching is easier to implement
5. Batch processes allow for complex ETL (extract, transform, load)


# Why wouldn’t you directly stream data to BigQuery?
Batch processing is more money efficient, as there is a cost per insert 

# What are the different authentication mechanisms for the GCE API?
1. **Service Account Key File**: You can create a service account and download a JSON key file associated with that account. This key file can be used to authenticate your application when making API requests. The key file contains information such as the client ID and private key.
2. **Application Default Credentials (ADC)**: ADC is a strategy for providing credentials to your application based on the environment it is running in. If your code is running in an environment like Google Cloud Functions, Google App Engine, or Google Kubernetes Engine, ADC can automatically use the associated service account's credentials without requiring explicit configuration.
3.** User Account OAuth 2.0**: For applications that need to access GCE on behalf of an end-user, you can use OAuth 2.0 to obtain user consent and access tokens. This method is typically used for applications running on end-user devices or web applications.
4. **Compute Engine Default Service Account**: When running code on a Compute Engine instance, the instance has a default service account that can be used to authenticate API requests made from that instance. This account is associated with the Compute Engine instance and can be used without any additional configuration.
5. **Google Cloud SDK**: The Google Cloud SDK provides a set of command-line tools that can be used for various GCP tasks, including authentication. When you run gcloud commands, the SDK takes care of authentication using the configuration and credentials stored on your local machine.
6. **Service-to-service authentication with Workload Identity**: Workload Identity allows you to securely connect and communicate between different Google Cloud services without needing to manage and distribute service account keys. It can be used to authenticate your application to other GCP services, including GCE.

# How do we monitor, trace or capture logs in GCP?
1. Google Cloud Monitoring:
  * Monitoring is a comprehensive solution for collecting, analyzing, and acting on telemetry data from Google Cloud and external sources.
  * It includes dashboards, alerting, and anomaly detection.
2. Google Cloud Trace:
  * Cloud Trace allows you to trace requests through your application, helping you identify latency bottlenecks.
  * It provides insights into the performance of your applications.
3. Google Cloud Logging:
  * Logging allows you to store, search, analyze, monitor, and alert on log data and events from Google Cloud and external sources.
  * It supports log streaming, filtering, and exporting to other storage solutions.
4. Google Cloud Audit Logs:
  * Audit Logs provide a record of actions that have occurred in your Google Cloud environment.
  * They are useful for security and compliance purposes.