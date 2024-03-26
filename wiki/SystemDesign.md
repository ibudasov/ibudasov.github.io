# System Design

## Blocking vs non blocking
- blocking are easy to develop and debug

## Buffering and batching
- batching events and send them in batches
    - request compreccion is effective
    - introduces complexity on client and server side
        - think of partial batch succeeding

## Timeouts
- how much time to wait before the connection is established
- should be less that 95 percentile, so generally the connecton should be fast

## Retries
- if connectio is unsuccessfull — try them
- exponential backoff 
- jitter — adds randomness , so new nodes are not overloaded
- curcuit breaker — calculates how may requests failed and stops adressing server if there are too many failed. Gives time for the server to recover
    - makes the system di 

## Load balancers
- software — http —terminates the connection — looks at the content
- hardware — tcp — proxies the traffic
- algoriyhms:
    - least response time
    - leart processor load
    - round robin
    - etc
- got interface for registering and unregistering services
- does health checks and removes unhealthy ones from the rotation
- there are primary and secondary nodes — basically failover 

## DNS
- maintains names and maps to the IP addresses
- like a phone book

partition service and partitions
service - 
- receives request
- parses it
- routes traffic to a partition
- acts like a load balancer, distributing load over partitions

service discovery
- server-side
    - server knows about clients (nodes in case of load balancer, partitions in case of partitioned)
- client side
    - each service registers itself in the service registry
        - the registry is another HA service
        - zookeeper is an example
        - also called the central registry 
    - gossip protocol — every node knows all the other nodes. each node picks a random node and shares the data

replication
- single leader
    - SQL db
- multi leader
    - between fed DC
- leaderless
    - Cassandra (or dynamoDB)


message formats
- text — human readable, chunky
    - XML
    - JSON
    - ..
- binary - compact, faster to parse, no field names, there is a schema for that
    - proto buff
    - atro

STORAGE
hot storage — DB, master
cold storage — another DB, or even object storage
data federation — multiple data sources united under one API
good case for distributed cache

use a batch processing framework like map-reduce if we are not latency sensitive, and use a stream processing if we are. Not both

qualities of the system — pick less than 3
- scalability
- availability
- performance
- consistency
- durability
- maintainability
- cost


Data flow
- how gets in
- how is stored
- how gets out

