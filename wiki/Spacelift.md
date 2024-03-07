# Spacelift

Spacelift is a tool that helps deploy and manage serverless applications on platforms like AWS Lambda and Azure Functions. When used with Azure Functions and Azure Container Apps, Spacelift allows you to package your Functions code and dependencies into a container image. This container image can then be deployed to Azure Container Apps.

- Spacelift will build a container image for your Functions project that includes the runtime, dependencies, and code. This provides an easy way to containerize your Functions.
- The container image is deployed to an Azure Container Apps instance. Container Apps manages the containers and provides an auto-scaling environment for running the Functions.
- Behind the scenes, KEDA is used to integrate with the Azure Functions runtime and provide auto-scaling based on events. So your Functions code runs inside containers but is still treated as serverless functions by Azure.
- Features like DAPR can also be used to help with pub/sub between Functions and other microservices within the container environment.

## Object model

- Stacks - connects with your source control repository and manages the state of infrastructure
- State Management - State can be managed by your backend, or for Terraform projects - can be imported into Spacelift
- Policies - provide a way to express rules as code, rules that manage your Infrastructure as Code (IaC) environment, and help make common decisions such as login, access, and execution