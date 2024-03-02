- Is a package system for k8s
- The config contains configuration information that can be merged into a packaged chart to create a releasable object.
- A release is a running instance of a chart, combined with a specific config.

# Module structure
## chart.yaml
- metadata for the chart
- dependencies
- The chart is a bundle of information necessary to create an instance of a Kubernetes application.

## values.yaml
- values, similar to terraform
- the configuration to the charts
- custom values are supported from CLI, like terraform

## templates
- basically k8s yaml with variables
- prevents duplication of the code
- combined templates and values gives us a valid k8s yaml

## test
- tests for deployed infrastructure

# Helm.hub and tools
- search charts, ready to use
- monocular — self hosted chart repository
- there is a linter and tester for charts
- there is a migrator from 2 to 3. A plugin
- chart releaser — to help me to run my own chart repository
- drone - CI for helm
- airship — from openstack project, works with helm
- there is a helm provider for terraform

# Commands
```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm search repo bitnami
helm repo update              # Make sure we get the latest list of charts
helm install bitnami/mysql --generate-name
helm show chart bitnami/mysql
helm show all bitnami/mysql
helm status myrelease # shows all the details about your release
helm list # shows revisions, what has been installed, versions
helm rollback mydelease 1 # rollsback to revision 1
helm delete myrelease # deletes all what you deployed, all of it, keeping track of what has been deployed
helm uninstall mysql-1612624192
—dry-run # to see the incoming changes
helm install testrelease .
```

# Architecture

- Helm Client — CLI
    * Local chart development
    * Managing repositories
    * Managing releases
    * Interfacing with the Helm library
        * Sending charts to be installed
        * Requesting upgrading or uninstalling of existing releases
- Helm Library — connects to k8s API
    * Combining a chart and configuration to build a release
    * Installing charts into Kubernetes, and providing the subsequent release object
    * Upgrading and uninstalling charts by interacting with Kubernetes


# Links
- https://www.youtube.com/watch?v=Zzwq9FmZdsU&t=2s
