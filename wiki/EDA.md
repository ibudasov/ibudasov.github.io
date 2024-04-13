# EDA

## Message bus 

Criteria:
- managed service - so no RabbitMQ. However, we keep Zero MQ, because it might be useful for dev purposes
- Event Grid is excluded because of it got different purpose: Message routing between Azure Services
- Event Hub is excluded because of it got different purpose: Event Ingestion

Assumptions:
- Azure Service Bus looks pretty much the same as Confluent Kafka. We will get into details if we decide to go with ASB

| Criteria                           | Azure Service bus         | Azure Queue             | Azure Queue Storage                          | ZeroMQ         |
|------------------------------------|---------------------------|-------------------------|----------------------------------------------|----------------|
| Purpose                            | Microservices message bus | MQ, Part of Service Bus | Blob storage, less features, more durability | MQ             |
| Guarantee of delivery              | Yes                       | Yes                     | Yes                                          | Yes            |
| Order of messages                  | Yes                       | Yes                     | Yes                                          | Yes            |
| Idempotency                        | Yes                       | Yes                     | Yes                                          | Yes            |
| Topics                             | Yes                       | Yes                     | No                                           | Yes            |
| Messaging protocol                 | AMQP and MQTT             | AMQP and HTTP           | HTTP/REST                                    | TCP,PGM,IPC    |
| Pub/Sub                            | Yes                       | Yes                     | No                                           | Yes            |
| Distributed transactions           | NO, but "exactly once"    | Yes                     | No                                           | Yes            |
| Durability                         | Yes                       | Yes                     | Yes                                          | Yes            |
| Time-series last value             | No                        | No                      | No                                           | Yes            |
| Dead letter Q                      | Yes                       | Yes                     | Yes                                          | No             |
| Persistence until consumed         | Yes                       | Yes                     | No                                           | No             |
| Event Store for processed messages | Yes                       | No                      | No                                           | No             |
| Batching                           | Yes                       | Yes                     | Yes                                          | Yes            |
| Message versioning                 | With Protobuff            | With Protobuff          | With Protobuff                               | With Protobuff |