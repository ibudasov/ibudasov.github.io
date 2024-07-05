# Network

A union of correlated hosts
- Has a network address space
- Each host has an address within that space
- https://www.youtube.com/watch?v=H7-NR3Q3BeI&list=PLIFyRwBY_4bRLmKfP1KnZA6rZbRHtxmXi&index=2&t=655s


## Static IP addresses useful for

- DNS name resolution, where a change in the IP address requires updating host records.
- IP address-based security models that require apps or services to have a static IP address.
- TLS/SSL certificates linked to an IP address.
- Firewall rules that allow or deny traffic by using IP address ranges.
- Role-based virtual machines such as Domain Controllers and DNS servers.

## Subnets vs VLANs

- SUbnets
    - Subnets are physical
    - Subnet is a network of computers connected with a switch
    - Computers in the subnet broadcast, using the switch. Called **broadcast domain**
    - subnets are for limiting broadcasting, connected with routers. 
    - Subnets are connected with a router
    - Subnets are for security reason - to limit the broadcasting to separate domains, representing departments of the company. Also Departments do not need to see hosts of other departments
- VLANs 
    - are virtual
    - Virtual Local Area Network
    - VLAN enabled switch is used
    - no routers
    - makes possible to configure VLANS virtually, not physically
    - 

## 5-tuple

A 5-tuple refers to a set of five different values that comprise a Transmission Control Protocol/Internet Protocol (TCP/IP) connection. It includes 
- a source IP address/port number
- destination IP address/port number 
- the protocol in use

## VPN

## Default route

The default route, often represented as `0.0.0.0`, is typically provided by a router or a gateway. When a device connects to a network, the router or gateway usually provides the device with an IP address and other network information, including the default route, through a protocol called DHCP (Dynamic Host Configuration Protocol).

In some cases, the default route can be manually set on a device. This is common in server environments or in specific network configurations where automatic configuration through DHCP is not desired.

In the context of a VPN, the default route can be set by the VPN server. This is useful when you want all network traffic from a device to go through the VPN, effectively hiding the device's original IP address. 

If it is `0.0.0.0` -- there is no specific route defined

### Route advertisement

Advertising custom routes in a VPN Gateway refers to the process of manually configuring the routes that a VPN Gateway advertises to connected devices. This is particularly useful in scenarios where you want to control the traffic flow in your network or when you need to connect to specific resources that are not part of the default route advertisement.

For example
- by pushing specific routes to VPN clients, you advertise which subnets will be accessible throught these routes
- do not push default route `0.0.0.0`, because all the traffic, no matter in the private notwork or in the Internet, will be going throug the VPN gateway
-  if you have a network segment in your Azure virtual network that you want to make accessible to your P2S VPN clients, you can add a custom route for that network segment. Once the custom route is advertised, the P2S VPN clients will be able to reach the resources in that network segment.


### Forced tunneling
You can direct all traffic to the VPN tunnel by advertising 0.0.0.0/1 and 128.0.0.0/1 as custom routes to the clients. The reason for breaking 0.0.0.0/0 into two smaller subnets is that these smaller prefixes are more specific than the default route that may already be configured on the local network adapter and, as such, will be preferred when routing traffic.

## IP ranges
- https://www.youtube.com/watch?v=eHV1aOnu7oM
- https://www.youtube.com/watch?v=MmA0-978fSk

- ipconfig / ifconfig
- dotted quad format
- subnet mask specifies which part of the address is the subnet, and which is the host address
- `/24` refers to the last octet
    - < `/24` refers to more last octets than the last one
    - > `/24` refers to a part of the last octet - so you can split the `/24` subnet to multiple smaller subnets
- `/24` - first 24 can be one-s (1) - 192.168.1.1 .. 192.168.1.254 
    - 192.168.1.0 - reference to subnet
    - 192.168.1.1 - GW
    - 192.168.1.2 - DNS mapping
    - 192.168.1.255 - reference to broadcast
- /16 - is more addresses than `/24`


## BGP

Border Gateway Protocol, is a protocol used to exchange routing information across autonomous systems on the internet. In the context of cloud engineering, BGP is often used in conjunction with VPNs or Direct Connect (in AWS) / ExpressRoute (in Azure) / Cloud Interconnect (in Google Cloud) for routing traffic between your on-premises network and your VPCs in the cloud.

BGP can be used to advertise the routes of your on-premises network to the cloud, and vice versa.

- Autonomous Systems (AS): An Autonomous System is a network or group of networks under the control of a single entity, such as an ISP or a large enterprise. Each AS is assigned a unique number, known as an Autonomous System Number (ASN).
- BGP Peering: BGP routers form a TCP connection with each other, known as a peering session, to exchange BGP messages. Peering can be internal (iBGP) within the same AS, or external (eBGP) between different ASes.
- BGP Routes and NLRI: BGP uses Network Layer Reachability Information (NLRI) to identify a route. NLRI includes the IP prefix (network address and subnet mask) and other attributes.
- BGP Attributes: BGP uses attributes in its routing decisions. Some of the most important attributes are AS-PATH (the path a route has taken through different ASes), NEXT-HOP (the next hop IP address to reach the destination), and MED (Metric used for path selection).
- BGP Route Selection: BGP uses a complex decision process to select the best path. It considers multiple factors, including the length of the AS-PATH, the origin of the route, and the values of various BGP attributes.
- BGP Advertisement: Once BGP selects a best path, it advertises that path to its peers. This advertisement includes the NLRI and the associated BGP attributes.
- BGP Convergence: BGP convergence is the process of all BGP routers in the network agreeing on the best paths. This can take some time, especially in large networks.
- BGP Stability Features: BGP includes features to maintain stability in the face of network changes. These include route dampening (which suppresses unstable routes) and BGP Graceful Restart (which allows BGP to recover from failures without disrupting network traffic).

### BGP advertisement

Advertisement is a process in which BGP routers communicate with each other to share information about the reachability of different network paths. This is done to establish and maintain routing tables, which are used to determine the most efficient path for data to travel from one network to another.

1. A BGP router starts by advertising its directly connected networks to its BGP neighbors. This advertisement includes the IP prefix (network address and subnet mask) of the connected networks.

2. The BGP neighbors receive this advertisement and add the advertised routes to their BGP routing tables. They then advertise these routes to their own BGP neighbors.

3. This process continues, with each BGP router advertising the routes it learns to its neighbors. This allows all BGP routers in the network to learn about all available routes.

4. If a route changes (for example, if a link goes down), the BGP router that detects the change will update its routing table and advertise the change to its neighbors. This ensures that all routers have up-to-date information about the network.

5. BGP uses a set of policies and attributes (like AS-PATH, NEXT-HOP, etc.) to determine the best path for data to travel. When multiple paths are available, BGP will choose the one with the highest preference.

## Connestivity directions
- Dept to Dept (East-West)
- Public to Internal (North-South)
- Peering (Cloud to OnPrem)

## Hub and spoke topology

 is a system where a central node (the hub) is connected to peripheral nodes (the spokes). All data that is transmitted between the peripheral nodes must pass through the central hub. This topology is commonly used in systems where control and coordination of the nodes is important.

```
    Spoke1
      |
      |
Hub --+-- Spoke2
      |
      |
    Spoke3
```


## Network devices

### Host 
Any device in the network that can serve requests. Essentially, it’s a server. Each host must have:
- An IP address
- A subnet mask
- A default gateway, if talking to other subnets
- A DNS server if you want to connect to the internet

### Repeater

An amplifier of the signal, which dies out in the cable of the network

### Hub

A multi-port repeater, as it translates the signal from one machine to the rest 

### Bridge

Facilitates communication between networks, cross-hub 

### Switch

Operates within a network. Switching - process of moving data within a network. 
- Switch uses and maintains MAC address tables (switch port to MAC address)
- Performs the following operations:
    - Learn — update the table
    - Flood — send a new frame to all the hosts 
    - Forward - use MAC address table to send frame 
- Can be configured as a host, with an IP address, if you want to send traffic to the switch. Might be used for configuring switch 
- Unicast - 1-1 communication, one MAC to another
- Broadcast - a type of frame with MAC=ffffff. However, flood - is an action of the switch, based on the broadcast type of frame

### VLAN
- Virtual local area network
- Divides switch ports into virtual smaller switches
- Each smaller switch got MAC address table

### Router
Communication between networks, also creates a hierarchy in networks. Creates internet. Routing - moving data between networks. 
- Have an IP and a MAC
- Node - anything with IP
- Router - a node that forwards ipv6 packets not explicitly addressed to itself 
- Host - node, but not a router
- ARP tables are there on each router
- Routing table for correlating networks 
    - Directly connected  - routes for the networks which are attached
        - Drop a packet if doesn’t know the destination IP, no ARP
    - Static routing - manually configured
    - Dynamic routes - routers learn automatically from other routers, exchanging routes 
- Internet is a bunch of routers
- Routers can make hierarchies
    - To have consistent connectivity
    - Easier to scale  
    - Route summarization
        - /8, /16, /24 - amount of first octets to look at while matching a route
        - /8 would be for routers, because it is the next hop
        - The mask is needed to determine if the host talks to the host inside or outside of the subnet
    - 255.255.255.0 - means that the first 3 octets are no bigger than 255 in decimal interpretation
        - Also means that the IP addresses in the subnet are not unique in the first 3 octets 
    - 0.0.0.0/0 — ultimate route summary
        - For everything else, go there

## Protocols
- TCP (L4)
- UDP (L4)
- IP (L3)
    - **IPSec** - Internet Protocol Security, is a suite of protocols used to secure internet protocol (IP) communications by authenticating and encrypting each IP packet in a data stream. It includes protocols for establishing mutual authentication between agents at the beginning of a session and negotiation of cryptographic keys to use during the session. IPSec can be used to protect data flows between a pair of hosts, between a pair of security gateways, or between a security gateway and a host.
        - **IKE**, which stands for Internet Key Exchange, is a protocol used in the IPSec suite for the negotiation and establishment of secure connections. It is responsible for authenticating peers, managing security associations, and establishing encryption keys. IKE operates in two phases: Phase 1 establishes a secure channel between two peers, and Phase 2 negotiates IPSec security associations and enables encrypted data transfer.
- ICMP - (L3/L4) used for `ping`
- ARP -- address resolution protocol
- FTP
- HTTP/HTTPSw
- TLS
- SSL
- DNS
- DHCP - provides back IP address, subnet mask, default gateway, and DNS 
    - Kea DHCP is an open-source software project that provides a high-performance, extensible DHCP (Dynamic Host Configuration Protocol) server engine that is designed to be easily modified and extended with hooks libraries.
    Kea DHCP supports both DHCPv4 and DHCPv6 protocols, which are used to assign and manage IP addresses in a network. The server supports features like address pools, subnet selection, lease reservation, host reservation, and can store lease information in a database.
    Kea is developed and maintained by the Internet Systems Consortium (ISC) and is a successor to the ISC's DHCP server software, also known as ISC DHCP or dhcpd.


# IPV6

- much bigger
- can be used in a subnet
- starts with `fd....`

## OSI model

1. Physical - transports bits
2. Data Link - hop-to-hop
    1. Network card (NIC)
    2. Addressed with MAC scheme
    3. Switches - switch wires to physically connect NIC 
3. Network - end-to-end
    1. Addressing with IP
4. Transport - service-to-service
    1. Data streams for different services
    2. Addressing with ports
    3. TCP for reliability
    4. UDP for efficiency 
    5. Based on the new source connection port, we know that this is a new session, a new client
5. Session
6. Presentation
7. Application

## Broadcast domain

A broadcast domain is a logical division of a computer network, in which all nodes can reach each other by broadcast at the data link layer. In other words, in a broadcast domain, when one device sends a broadcast message, all other devices in the same domain receive and process that message. Broadcast messages are typically used for tasks such as address resolution (like ARP in IPv4) or service discovery.

1. Ethernet Segments:
    * In traditional Ethernet networks, all devices on the same physical network segment are part of the same broadcast domain.
    * For example, if you have a hub-based Ethernet network (although hubs are less common today), all devices connected to that hub are in the same broadcast domain.
2. Switched Networks:
    * In modern networks with switches, each port on a switch is usually its own broadcast domain. This is because switches are more intelligent than hubs and only forward broadcasts to the necessary ports.
    * If you have a switch with multiple devices connected to it, each device is in its own broadcast domain. However, devices in different VLANs (Virtual LANs) are in separate broadcast domains.
3. VLANs (Virtual LANs):
    * VLANs are a way to create multiple broadcast domains within a switch or a set of interconnected switches.
    * Devices in the same VLAN can communicate with each other as if they were on the same physical network, even if they are connected to different switches. However, devices in different VLANs cannot communicate through broadcasts.
4. Routers:
    * Routers operate at the network layer and separate broadcast domains by default. When a router receives a broadcast packet on one interface, it does not forward that broadcast to other interfaces.
    * Each interface on a router can be considered a separate broadcast domain. For example, if you have a router with three interfaces, each interface is in its own broadcast domain.

## VNet Peering

VNet Peering is a networking feature provided by Azure. It allows for seamless connections between Azure Virtual Networks (VNets). By peering two VNets, all resources in the two networks are able to communicate with each other as if they are in the same network, using their private IP addresses. 

VNet Peering has several benefits:
- It allows for high-speed, low-latency connections between resources in different VNets.
- It's completely private and secure, as no public internet, gateways, or encryption is required in the communication between the VNets.
- The traffic between the peered VNets is kept within the Azure network, providing a high degree of security and speed.

It's important to note that the peered VNets must be in the same region and cannot overlap in IP address space.

## Subnetting

1. Understanding IP Addresses:
    * IP addresses consist of two parts: the network portion and the host portion. For example, in the IP address 192.168.1.1, "192.168.1" is the network portion, and ".1" is the host portion.
2. Choosing a Subnet Mask:
    * The subnet mask is used to divide an IP address into network and host portions. It consists of a series of contiguous '1' bits followed by '0' bits. For example, in the subnet mask 255.255.255.0, the first 24 bits are '1's, representing the network portion, and the last 8 bits are '0's, representing the host portion.
3. Determine the Number of Subnets:
    * Decide how many subnets you need within the given network. This depends on factors like the number of departments, physical locations, or other organizational requirements.
4. Determine the Number of Hosts per Subnet:
    * Decide how many hosts each subnet needs to support. This will influence the size of the subnet and the subnet mask used.
5. Subnetting Calculation:
    * Use the subnet mask to calculate the size of each subnet. The subnet size is determined by the number of host addresses needed.
    * For example, if you need 30 hosts per subnet, you would need a subnet size that accommodates at least 32 hosts (2^5 = 32). So, a subnet mask of 255.255.255.224 (or /27 in CIDR notation) would be appropriate because it provides 32 host addresses per subnet.
6. Allocate Subnets:
    * Allocate the calculated subnets within the original network space. Each subnet will have its own network address, and the host addresses within each subnet will be used to assign individual devices.


## DNS

* DNS is a distributed system that translates human-readable domain names (like www.example.com) into IP addresses (like 192.168.1.1) that computers use to identify each other on a network.
* DNS operates on the application layer of the Internet Protocol (IP) suite.

## TCP (Transmission Control Protocol) and UDP (User Datagram Protocol):
* TCP and UDP are both transport layer protocols that facilitate communication between applications over a network.
* TCP is a connection-oriented protocol that provides reliable and ordered delivery of data. It establishes a connection, ensures data integrity, and guarantees that data is delivered in the correct order.
* UDP, on the other hand, is a connectionless protocol that does not guarantee reliable delivery or ordered data transmission. It is often used for real-time applications where a small amount of data loss is acceptable, such as in streaming or gaming.


Relationship between DNS and TCP/UDP:
* DNS primarily uses UDP for its communication, specifically for DNS query messages. UDP is chosen because DNS queries are typically short-lived, and the overhead of establishing a TCP connection for each query is unnecessary.
* However, there are situations where DNS uses TCP. For example:
    * Large Responses: If the DNS response data is too large to fit in a single UDP packet, DNS may switch to TCP. This is common when dealing with DNS responses for DNSSEC (DNS Security Extensions) or other resource records with large amounts of data.
    * Zone Transfers: When a DNS server needs to transfer a large amount of zone data to another DNS server, it uses TCP.
    * Reliability: In some cases, when a reliable and ordered delivery of DNS data is required, TCP may be used.

## SSL

Secure Sockets Layer (SSL) is a cryptographic protocol that provides secure communication over a computer network, most commonly used for securing web browsing but also applicable to other applications.

The SSL protocol operates on the application layer of the OSI model

SSL has been succeeded by newer versions of the protocol called Transport Layer Security (TLS)

Goals
1. Data Encryption: SSL uses cryptographic algorithms to encrypt data exchanged between the client and server. This ensures that even if the communication is intercepted, the intercepted data is unintelligible without the appropriate decryption key.
2. Data Integrity: SSL provides mechanisms for verifying the integrity of the data exchanged between the client and server. This prevents tampering with the data during transit.
3. Authentication: SSL facilitates the authentication of the server to the client and, optionally, the client to the server. This is typically done through the use of digital certificates, which are issued by trusted Certificate Authorities (CAs).
 
### SSL handshake

1. ClientHello:
    * The process begins when a client (e.g., a web browser) sends a "ClientHello" message to the server.
    * This message includes information like supported SSL/TLS versions, cipher suites, and random data.
2. ServerHello:
    * The server responds with a "ServerHello" message, selecting the highest SSL/TLS version that both the client and server support.
    * The server also selects a cipher suite from the list provided by the client and generates its random data.
3. Server Certificate:
    * The server sends its digital certificate to the client. The certificate contains the server's public key and information about the certificate issuer.
    * The client checks the certificate's validity and authenticity by verifying its digital signature and checking that it is signed by a trusted certificate authority (CA).
4. Key Exchange:
    * The client generates a pre-master secret and encrypts it with the server's public key obtained from the server's certificate.
    * The server decrypts the pre-master secret using its private key.
5. Pre-Master Secret:
    * Both the client and server independently generate the master secret using the pre-master secret and the random data exchanged in previous steps.
    * The master secret is then used to derive encryption keys for securing the communication.
6. Finished:
    * Both the client and server send a "Finished" message, indicating that the handshake is complete.
    * From this point on, the client and server can communicate securely using the established encryption keys.

## TLS 

1. Handshake Protocol:
    * Like SSL, TLS begins with a handshake protocol where the client and server negotiate and establish a secure connection.
    * The TLS handshake involves a series of steps, including the exchange of supported cryptographic algorithms, key exchange methods, and authentication information.
2. Key Exchange:
    * TLS supports various key exchange methods, including RSA (Rivest-Shamir-Adleman) for public key encryption, Diffie-Hellman for secure key exchange, and Elliptic Curve Cryptography (ECC) for efficient key exchange with shorter key lengths.
3. Data Encryption:
    * TLS uses symmetric-key cryptography for efficient data encryption. The shared secret established during the handshake is used to derive encryption keys for securing the data exchange.
    * Common symmetric encryption algorithms used in TLS include Advanced Encryption Standard (AES) and Triple DES.
4. Data Integrity:
    * TLS ensures data integrity through the use of cryptographic hash functions, such as SHA-256. Hash functions generate a fixed-size digest (hash) of the data, and this hash is used to verify the integrity of the transmitted data.
5. Authentication:
    * TLS provides a means of authenticating the parties involved in the communication. This is typically done using digital certificates.
    * The server presents its digital certificate during the handshake, and the client can verify the certificate's authenticity by checking its digital signature and the issuing Certificate Authority (CA).
6. Perfect Forward Secrecy (PFS):
    * TLS supports Perfect Forward Secrecy, which ensures that even if an attacker compromises a server's private key, past communications remain secure. PFS achieves this by generating unique session keys for each session, derived from the long-term keys exchanged during the handshake.
7. TLS Versions:
    * TLS has seen multiple versions, with each version addressing security vulnerabilities and introducing improvements. Common TLS versions include TLS 1.0, TLS 1.1, TLS 1.2, and TLS 1.3.
    * TLS 1.3, the latest version as of my knowledge cutoff in January 2022, brings significant security enhancements and performance improvements.


## Firewall

1. Packet Filtering:
    * Firewalls inspect individual packets of data as they travel through the network.
    * Packet filtering is based on predefined rules that specify conditions for allowing or blocking packets.
    * Criteria for filtering can include source and destination IP addresses, port numbers, and the protocol used.
2. Stateful Inspection (Dynamic Packet Filtering):
    * Stateful inspection keeps track of the state of active connections and makes decisions based on the context of the traffic.
    * It allows or denies traffic based on the state of the connection, ensuring that only legitimate and established connections are allowed.
3. Proxy Firewalls:
    * Proxy firewalls act as intermediaries between internal and external systems.
    * Instead of allowing direct connections between systems, a proxy firewall forwards requests on behalf of clients and returns the responses.
    * This helps hide the internal network structure and provides an additional layer of security.
4. Network Address Translation (NAT):
    * Firewalls often use NAT to hide the internal IP addresses of devices from external networks.
    * NAT translates private IP addresses used within a network to a single public IP address, masking the internal network structure.
5. Application Layer Filtering:
    * Some firewalls operate at the application layer and can inspect the content of data packets.
    * This allows for more granular control based on specific applications or services.
6. Intrusion Detection and Prevention Systems (IDPS):
    * Some firewalls incorporate intrusion detection and prevention capabilities to identify and respond to suspicious or malicious activities.
7. Logging and Reporting:
    * Firewalls often log information about allowed and blocked traffic, which can be useful for monitoring and analysis.
    * Reporting features provide administrators with insights into network activity and potential security threats.
8. Hardware and Software Firewalls:
    * Firewalls can be implemented as both hardware devices and software applications.
    * Hardware firewalls are standalone devices that are often deployed at the network perimeter, while software firewalls can be installed on individual computers or servers.

## System automation

1. Shell scripts -- automating daily tasks
2. Cron Jobs -- runs jobs at specific intervals
3. Configuration Management Tools - like Ansible, to automate identical setups
4. Version Control Systems -- to rollback and track changes
5. System monitoring and logging -- Prometheus
6. Task scheduling with at and batch -- echo "/path/to/script.sh" | at 2:00 AM
7. Automating User Account Management
8. Log rotation
9. Remote execution with ssh and rsync ans scp.This would requre appropriate permissions on the target system
