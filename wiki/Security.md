# Security
- Security meant to be redundant (remember 2FA)

## SSL/TSL certificates

These are small data files that digitally bind a cryptographic key to an organization's details. When installed on a web server, it activates the padlock and the https protocol (over port 443) and allows secure connections from a web server to a browser.
![](https://ssl-tls.co.nz/wp-content/uploads/2019/12/HowCertsWrok_Infographic_Desktop-2048x1106.png)


![](https://blog.cloudflare.com/content/images/2016/03/ca-cert-signing.png)

## Zero trust security
Zero Trust Security is a model that assumes no trust for any entity—regardless of whether it's inside or outside the network perimeter—trying to access network resources. Instead, every user, device, or system must be verified before access is granted.

### Microsegmentation
This involves breaking up security perimeters into small zones to maintain separate access for separate parts of the network. For example, in a Kubernetes environment, network policies can be used to control traffic between pods.

### Encryption
In a Zero Trust model, data should be encrypted at all times, both at rest and in transit. For example, in Google Cloud, customer data stored at rest is automatically encrypted without any action from the user.

## Kubernetes
Apply all the security measures, just like `onPrem`

### Image level
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

### Authentication and Authorization
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

### Network

- by default each pod can talk to others
- `NetworkPolicy` are there to limit it. On a network level 4. Not on App level 7
  - implemented by kubernetes nework plugin
- `ServiceMesh` (Istio) allows us to go it on level 7, which is more convenient

### In Transit
- The traffic in unencrypted by default
- Istio enables mutual TLS, so all the traffic is encrypted

### At Rest
- `EncryptionConfiguration` to solve the problem that Credentials, tokens, Private Keys are stored unencrypted by default
  - you still have to manage the encryption key and store it somewhere securely
    - AWS KMS
    - Hashi Corp Vault
- `etcd` — unencrypted by default. 
  - run it outside
  - put it behind the firewall
  - allow only access from API Server
  - encrypt it

### CI/CD
- `SecurityPolicies` — to make developers follow security guidelines. Implemented by 3rd parties
  - hook into k8s `AdmissionController` which is to decide if deployment can go through

## Databases

### Potential threats
- stealing data
- deleting
- corrupting/mocking
- encrypting and asking for ransome
- corrupting backups

### Mitigations
- backup and restore
- immutable backups

## Cloud

https://www.youtube.com/watch?v=jI8IKpjiCSM

SaaS
PaaS
- Networks
- Containers
  - Runtime
  - Isolation
IaaS
- Hypervisor and everything below it


## Links
- https://www.youtube.com/watch?v=oBf5lrmquYI
- https://www.youtube.com/watch?v=jI8IKpjiCSM