# General
- Security meant to be redundant (remember 2FA)

# Kubernetes
Apply all the security measures, just like `onPrem`

## Image level
- scan images for vulnerabilities (by default done by DockerHub)
- use minimal images, like `alpine`
- use blank system, without building tools
- use a separate user for running the app
  ```docker
  RUN adduser -D applicationuser
  RUN chown applicationuser:applicationuser ./executable
  RUN chmod +x ./executable
  USER applicationuser
  ```
- disable privilege escalation on the pod level
  ```yaml
  kind: Pod
  spec:
    securityContext:
      allowPrivilegeEscalation: false
  ```

## Authentication and Authorization
- RBAC
  - `Role` — what can you do with which resources in which namespace
  - `ClusterRole` — same as role, but cluster wide, for admins.  
  - Users 
    - there is no direct user object, instead there is:
    - static tocken file
    - certificates
    - 3rd aprty ID services
  - Binding — binds a role to a user
  - `ServiceAccounts` — for machines interaction. Ex: CI agent
- keep it as restricted as possible

## Network

- by default each pod can talk to others
- `NetworkPolicy` are there to limit it. On a network level 4. Not on App level 7
  - implemented by kubernetes nework plugin
- `ServiceMesh` (Istio) allows us to go it on level 7, which is more convenient

## In Transit
- The traffic in unencrypted by default
- Istio enables mutual TLS, so all the traffic is encrypted

## At Rest
- `EncryptionConfiguration` to solve the problem that Credentials, tokens, Private Keys are stored unencrypted by default
  - you still have to manage the encryption key and store it somewhere securely
    - AWS KMS
    - Hashi Corp Vault
- `etcd` — unencrypted by default. 
  - run it outside
  - put it behind the firewall
  - allow only access from API Server
  - encrypt it

## CI/CD
- `SecurityPolicies` — to make developers follow security guidelines. Implemented by 3rd parties
  - hook into k8s `AdmissionController` which is to decide if deployment can go through

# Databases

## Potential threats
- stealing data
- deleting
- corrupting/mocking
- encrypting and asking for ransome
- corrupting backups

## Mitigations
- backup and restore
- immutable backups

# Cloud

https://www.youtube.com/watch?v=jI8IKpjiCSM

SaaS
PaaS
- Networks
- Containers
  - Runtime
  - Isolation
IaaS
- Hypervisor and everything below it


# Links
- https://www.youtube.com/watch?v=oBf5lrmquYI
- https://www.youtube.com/watch?v=jI8IKpjiCSM