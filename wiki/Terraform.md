```sh
terraform -install-autocomplete

terrafrprm fmt

terraform state list

docker_container.nginx[1]

terraform apply -replace "docker_container.nginx[1]"
  
curl $(terraform output -raw public_ip):8080
```
# Debug

- You can set TF_LOG to one of the log levels TRACE, DEBUG, INFO, WARN or ERROR to change the verbosity of the logs.
- `TF_LOG_CORE`
- `TF_LOG_PROVIDER`

# Lifecycle
- init
    - init can be run against an empty directory with the -from-module=MODULE-SOURCE option, in which case the given module will be copied into the target directory before any other initialization steps are run.
    - -backend-config=… for partial backend confiuration
- compose/write
- validate - happens locally only
- refresh
- plan
    - for teamwork run TF in automation to avoid speculative plans
    - can be output to a file and applied from that file later. Useful fol logging of changes
- apply


# Locals

local values are often referred to as just "locals" when the meaning is clear from context.
A local value assigns a name to an expression, so you can use it multiple times within a module without repeating it.

# Input 
variables are like function arguments.

# Output 
values are like function return values.

# Data
sources allow Terraform to use information defined outside of Terraform, defined by another separate Terraform configuration, or modified by functions.
- there are local data sources, which are populated during the execution
- got the same `dependsOn`  mechanism 

# Depends on
- usually terraform would analyze the code and see what blocks reference one another and would make a graph of execution, and would execute according to it
- Sometimes there are dependencies between resources that are not visible to Terraform
    - for example, some VM might require a bucket, but it is not there yet. TF would not know about it
- Use Depends_On to make dependencies explicit

# Complex types
- collectio types - similar types
    - list(any) - just values
    - map(any) - values with a string key
    - set(any) - different types, no string identifiers
- structural types - potentially different types
    - object - requires a schema 
        - object({ name=string, age=number })
    - tuple - indexed from 0, each element might have it’s own type 
        - uple([string, number, bool])

# Meta arguments
- source - references a module
- Count - to create multiple instance os described resource https://developer.hashicorp.com/terraform/language/v1.1.x/meta-arguments/count
- for_each - like count, but more explicit. Argument whose value is a map or a set of strings, Terraform will create one instance for each member of that map or set https://developer.hashicorp.com/terraform/language/v1.1.x/meta-arguments/for_each
    - no impure functions returning its values to the input
    - no dynamic values
    - no sensitive vars


# Internal functions

- keys
- toset
- flatten
- cidrsubnet
- setproduct
- can + regex
- min
- max
- templatefile - dynamically create an EC2 instance user data script.
- lookup — to reference values from a map. 
    - lookup(var.aws_amis, var.aws_region)
- file — to read the contents of a file.
    - file("ssh_key.pub")

# Expressions
- for
- Conditional expression, ternary operator
    - name  = (var.name != "" ? var.name : random_id.id.hex)
    - count                       = (var.high_availability == true ? 3 : 1)
- Splat — The special * symbol iterates over all of the elements of a given list and returns information
    - value       = aws_instance.ubuntu[*].private_dns

# Providers
- TFCloud and Enterprise install everything including providers on each run
- can be aliased to be used with different configs
    - provider with no aliases is the default provider
    - provider can be specified for each resource
    - of provider can be specified when instantiating the module

# Dep lock file

# Dependencies
- Providers - external communication
    - dep lock file tracks only this
- Modules - reusable abstractions

# Plugins

- TF consists of 2 parts: 
    - TF Core
        - reading and interpolating configs and modules
        - resource state management
        - making a Graph
        - plan execution
        - communication with plugins
        - 
    - TF Plugins
        - Provisioners and Providers are plugins
        - make API calls
        - authentication with Infrastructure Provider
        - define resources that map to services. These resources I describe in my TF definitions


# State

1. Is a database to map TF config to the real world
2. each TF resource is mapped to exactly one object in the cloud
3. also tracks metadata as dependencies, to amke a graph, based on which it decides the order of the changes, when applying


Lock
- lock happens when the state is in transition. 
- not all backends support locking
- there is -lock param and force-unclock command

State file
- state file contains everything in plain text, event sensitive var values
- when remote state used, it is hold by Terraform in memory. 
    - Can be encrypted at rest, but depends on provider. 
        - S3 supports encryption at rest
    - TLS when in transit is already here 
- treat the state itself as sensitive data
- terraform_remote_state can point to another state file, and you can share it among repos
- Named workspaces allow conveniently switching between multiple instances of a single configuration within its single backend. 
    - not for separating environments
    - mainly for testing new changes as in git branches
    - Workspaces are technically equivalent to renaming your state file. 

State drift
- terrafrom state list — to get the list of resources managed by TF
- terraform refresh
    - updates the Terraform state to match changes made to remote objects outside of Terraform
    - terraform refresh subcommand. However, this was less safe than the -refresh-only plan and apply mode since it would automatically overwrite your state file without giving you the option to review the modifications first. 
    - terrafrom plan —refresh-only — is the safest 
- -replace=ADDRESS - Instructs Terraform to plan to replace the resource instance with the given address. This is helpful when one or more remote objects have become degraded
- terraform apply -target=ADDRESS — to bring updates to only selected remote resource. Not recommended
- terraform plan -generate-config-out=generated_resources.tf
    - to generate code for imported resources
    - is experimental
- terraform state rm — to remove a specific resource which you don’t need anymore

# Backend management

# Partial configuration

- backend can be configured separately from main.tf to have credentials in a safe place
- CLI params with key=value for 
    - not recommended because CLI stores history, so might store your passwords
- interactively ask for values when init
- .terraform folder should be git ignored
- 

# Terraform Cloud

- encryptin of the state
- stable envirnment fr lng ruunning prcesses
- pipelines
- private registry
- terraform wrkflow referencing remote state frm the local machine

# Infrastructure as a Code (IaaC)

- manage infrastructure
- track infrastructure
- automate changes
- standardize configurations
    - also by using predefined modules
- collaborate
- more reliable, less human error
- empowers developers for self-service

