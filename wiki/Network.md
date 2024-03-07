https://www.youtube.com/watch?v=H7-NR3Q3BeI&list=PLIFyRwBY_4bRLmKfP1KnZA6rZbRHtxmXi&index=2&t=655s


NETWORK DEVICES

HOST - basically any device in the network, which can serve requests. Basically, it’s a server. Each host must have
- IP address
- subnet mask
- default gateway, if talking to their subnets
- DNS server if you want to connect to the internet

NETWORK - a union of correlated hosts
- got a network address space
- each host got an address within that space

EPEATER - amplifier of the signal, which dies out in the cable of the network

HUB -  multi-port repeater,, s it translates the signal from one machine to the rest 


bridge - communication between networks, crss-huub 

switch - within a network. Switching - process of moving data within a network. 
- switch use and maintain MAC address tables (switch port to MAC address)
- does
    - learn — update the table
    - flood— send new frame to all the hosts 
    - forward - use mac address table t send frame 
- can be configured as a hst, with an IP address, if yu want t send traffic to the switch. Might be used fr cnfiguring switch 
- unicast - 1-1 cmmunication, one MAC t another
- broadcast - a type of frame with  MAC=ffffff. Hwever, flood - is an actin f the switch, based n the broadcast type of frame

VLAN
- Virtual llcal area netwrk
- devides switch ports int virtual smaller  swithes
- each smaller switch gt MAC address table
-  

RUTER - communication between networks, also creates a hierarchy in networks. Creates internet. Routing - moving data between networks. 
- have an IP and a MAC
- n0de - anything with IP
- router - a node that forwards ipv6 packets not explicitly addressed to itself 
- host - node, buut nt a ruter
- ARP tables are there on each ruuter
- routing table for correlating networks 
    - directly connected  - routes fr the networks which are attached
        - drop a packet if doesn’t know the destination IP, n0 ARP
    - static routing - manually configured
    - dynamic rutes - rouuters learn autmatically from other routers, exchanging ruutes 
- internet is a bunch of routers
- routers can make hierarchies
    - t have consistent connectivity
    - easier to scale  
    - rute suummarizatin - 
        - /8,, /16, /24 - amunt f fist ctets t lok at whhile matching a rute
            - /8 wuld be fr routers, ,because it is next hop
            - the mask is needed t determine if the hst talks t the host inside r utside f suubnet
        - 255.255.255.0 - means that first 3 octets are no bigger than 255 in decimal interpretation
            - als means that the IP addresses in the subnet are not unique in first 3 ctets 
        - 0.0.0.0/0 — ultimate route summary
            - fr everything else g there

PRTOCLS
- ARP -- address resolutin prtocol
- FTP
- HTTP
- TLS
- HTTPS
- SSL
- DNS
- DHCP - provides back IP address, subnet mask, defauult gateway  and DNS 


OSI MODEL

1. physiclal - transporting bits
2. data link - H0P-t-H0P
    1. netwrk cardNIC
    2.  addressed with  scheme MAC, 
    3. switches - switch wires to physically connect NIC 
3. netwrk - end-to-end
    1. addressing with IP
4. transprt service-t-service
    1. data streams fr different services
    2. addressing with ports
    3. TCP fr reliability
    4. UDP fr efficiaency 
    5. based on the new surce connectin port we wnw that this is a new session, , a new client
5. session
6. presentation
7. application

-------------------------------------------------------
BROADCAST DOMAINS

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
-------------------------------------------------------
SUBNETTING

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
-------------------------------------------------------
DNS (Domain Name System)

* DNS is a distributed system that translates human-readable domain names (like www.example.com) into IP addresses (like 192.168.1.1) that computers use to identify each other on a network.
* DNS operates on the application layer of the Internet Protocol (IP) suite.
-------------------------------------------------------
TCP (Transmission Control Protocol) and UDP (User Datagram Protocol):
* TCP and UDP are both transport layer protocols that facilitate communication between applications over a network.
* TCP is a connection-oriented protocol that provides reliable and ordered delivery of data. It establishes a connection, ensures data integrity, and guarantees that data is delivered in the correct order.
* UDP, on the other hand, is a connectionless protocol that does not guarantee reliable delivery or ordered data transmission. It is often used for real-time applications where a small amount of data loss is acceptable, such as in streaming or gaming.
-------------------------------------------------------
Relationship between DNS and TCP/UDP:
* DNS primarily uses UDP for its communication, specifically for DNS query messages. UDP is chosen because DNS queries are typically short-lived, and the overhead of establishing a TCP connection for each query is unnecessary.
* However, there are situations where DNS uses TCP. For example:
    * Large Responses: If the DNS response data is too large to fit in a single UDP packet, DNS may switch to TCP. This is common when dealing with DNS responses for DNSSEC (DNS Security Extensions) or other resource records with large amounts of data.
    * Zone Transfers: When a DNS server needs to transfer a large amount of zone data to another DNS server, it uses TCP.
    * Reliability: In some cases, when a reliable and ordered delivery of DNS data is required, TCP may be used.
-------------------------------------------------------
SSL

Secure Sockets Layer (SSL) is a cryptographic protocol that provides secure communication over a computer network, most commonly used for securing web browsing but also applicable to other applications.

The SSL protocol operates on the application layer of the OSI model

SSL has been succeeded by newer versions of the protocol called Transport Layer Security (TLS)

Goals
1. Data Encryption: SSL uses cryptographic algorithms to encrypt data exchanged between the client and server. This ensures that even if the communication is intercepted, the intercepted data is unintelligible without the appropriate decryption key.
2. Data Integrity: SSL provides mechanisms for verifying the integrity of the data exchanged between the client and server. This prevents tampering with the data during transit.
3. Authentication: SSL facilitates the authentication of the server to the client and, optionally, the client to the server. This is typically done through the use of digital certificates, which are issued by trusted Certificate Authorities (CAs).
-------------------------------------------------------
SSL HANDSHAKE

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

-------------------------------------------------------
TLS 

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
-------------------------------------------------------
FIREWALLS

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
-------------------------------------------------------
SYSTEM AUTOMATION

1. Shell scripts -- automating daily tasks
2. Cron Jobs -- runs jobs at specific intervals
3. Configuration Management Tools - like Ansible, to automate identical setups
4. Version Control Systems -- to rollback and track changes
5. System monitoring and logging -- Prometheus
6. Task scheduling with at and batch -- echo "/path/to/script.sh" | at 2:00 AM
7. Automating User Account Management
8. Log rotation
9. Remote execution with ssh and rsync ans scp.This would requre appropriate permissions on the target system
