GitOps is a way of managing infrastructure and applications using Git as a single source of truth. With GitOps, infrastructure changes are treated like application code changes - they are reviewed, approved and merged into production via pull requests. [1]

- Storing declarative infrastructure configurations and application definitions in a Git repo
- Using continuous integration/delivery tools to check configuration changes and deploy them automatically
- Making infrastructure changes auditable and reversible by versioning them in Git
- Ensuring production environments match the Git repo at all times through automated processes
- Integrating Git with monitoring and alerting systems to detect drift from the Git repo
- The main benefits of GitOps are improved collaboration through pull requests, increased visibility into infrastructure changes, and enforcing infrastructure as code best practices. It allows developers to manage infrastructure in the same way they manage application code.

# FluxCD

FluxCD is an open-source GitOps operator for Kubernetes.

- Storing declarative infrastructure configurations and application definitions in a Git repo
- Using continuous integration/delivery tools to check configuration changes and deploy them automatically
- Integrating Git with monitoring systems to detect any drift from what is defined in the repo
- Making infrastructure changes auditable and reversible by versioning them in Git
- Improving collaboration through pull requests for reviewing changes
- Enforcing infrastructure as code best practices by managing configs the same way you manage app code

How it works?

- FluxCD is installed as an agent on your Kubernetes cluster that monitors one or more Git repositories for changes. These repositories contain the configuration files that define your desired infrastructure and application states.
- Common configuration files stored in Git include Kubernetes manifests like Deployments, Services, etc. as well as Helm charts for managing applications.
- When new commits are merged into a monitored branch, FluxCD detects these changes and automatically synchronizes the running cluster to match the configurations in Git.
- It does this by checking out the code from Git, decoding the application definitions, checking for any differences between Git and the running cluster, and applying necessary updates.
- This ensures your production environments always match your Git repository through continuous synchronization. Any changes are applied automatically upon code updates.
- FluxCD also integrates with notification systems so drift from the target states defined in Git can be detected. Admins are alerted if the cluster falls out of sync.

# ArgoCD

Pretty much the same as FluxCD

# FluxCD vs. ArgoCD

- Model: FluxCD is natively based on the Kubernetes API model, while ArgoCD uses its own custom resource model.
- Both of them are graduates of CNCF
- Synchronization: FluxCD uses automatic continuous synchronization where changes are applied as soon as the Git repo is updated. ArgoCD allows configuring synchronization policies like manual, automated, etc.
- Interface: FluxCD is a purely CLI-based tool while ArgoCD provides both a CLI and a web UI for visualizing deployments and their sync status.
- Compatibility: FluxCD is tailored specifically for Kubernetes, whereas ArgoCD can manage other environments beyond just Kubernetes.
- Complexity: For simpler Kubernetes deployments, FluxCD's straightforward model may be preferable due to its ease of use. ArgoCD offers more features suited for complex setups.
- Notifications: FluxCD integrates better with monitoring systems to detect drift from the Git repo target state.