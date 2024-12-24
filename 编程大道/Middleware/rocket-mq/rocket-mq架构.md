# RocketMQ

## RocketMQ 架构介绍

<!-- notecardId: 1735052305339 -->

RocketMQ 是一款分布式消息中间件，具有高性能、高可靠性、高实时性和海量堆积能力。其架构主要包括以下几个核心组件：

### 1. Producer（消息生产者）

Producer 负责产生消息，并将消息发送到 RocketMQ 服务器。Producer 支持同步发送、异步发送和单向发送三种方式。

### 2. Consumer（消息消费者）

Consumer 负责从 RocketMQ 服务器拉取消息并进行处理。Consumer 分为两种模式：推模式（Push）和拉模式（Pull）。此外，Consumer 还支持集群消费和广播消费两种消费方式。

### 3. Broker（消息代理）

Broker 是 RocketMQ 的核心组件，负责存储消息、处理消息发送和接收请求。Broker 主要由以下几个子模块组成：

- **Name Server**：提供路由信息管理，支持 Broker 动态注册和发现。
- **Store Service**：负责消息的存储和查询。
- **Client Manager**：管理客户端（Producer 和 Consumer）的连接。
- **HA Service**：提供高可用服务，支持主从同步。

### 4. Name Server（名称服务器）

Name Server 是一个几乎无状态的节点，支持 Broker 的动态注册与发现，存储整个集群的路由信息，并为 Producer 和 Consumer 提供路由查找服务。

### 5. Topic（主题）

Topic 是消息的逻辑分类，Producer 将消息发送到指定的 Topic，Consumer 订阅相应的 Topic 以接收消息。

### 6. Message（消息）

消息是 RocketMQ 传递的基本单元，包含消息体、消息属性等信息。消息可以设置延迟投递、定时投递等属性。

### 7. Queue（队列）

Queue 是消息的物理存储单位，每个 Topic 包含多个 Queue。Producer 将消息发送到指定的 Queue，Consumer 从 Queue 中拉取消息。

### 8. Filter（过滤器）

RocketMQ 支持消息过滤，Consumer 可以通过 Tag 或 SQL92 表达式对消息进行过滤，确保只接收感兴趣的消息。

### 9. 高可用机制

RocketMQ 通过主从架构实现高可用，主节点（Master）负责处理读写请求，从节点（Slave）负责备份数据。当主节点发生故障时，从节点可以快速接管，保证服务的连续性。

### 10. 分布式事务

RocketMQ 支持分布式事务，Producer 可以在发送消息的同时执行本地事务，确保消息和本地事务的一致性。

通过以上组件的协同工作，RocketMQ 能够提供高效、可靠的消息传递服务，满足各种分布式系统的需求。
