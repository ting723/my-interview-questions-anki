# mybatis

## MyBatis 架构设计和原理

<!-- notecardId: 1735115555032 -->

### 架构设计

MyBatis 是一个优秀的持久层框架，它简化了 JDBC 的使用。MyBatis 的架构主要包括以下几个部分：

1. **SqlSessionFactory**：用于创建 SqlSession 对象的工厂。
2. **SqlSession**：用于执行 SQL 语句，获取映射器，管理事务。
3. **Mapper**：MyBatis 提供的接口，用于绑定 SQL 语句和 Java 方法。
4. **Executor**：负责 SQL 语句的执行。
5. **Configuration**：MyBatis 的核心配置类，包含了所有的配置信息。

### 原理

MyBatis 的工作原理可以分为以下几个步骤：

1. **加载配置文件**：MyBatis 通过加载 XML 配置文件或注解来获取配置信息。
2. **创建 SqlSessionFactory**：根据配置信息创建 SqlSessionFactory。
3. **获取 SqlSession**：通过 SqlSessionFactory 获取 SqlSession。
4. **执行 SQL 语句**：通过 SqlSession 执行 SQL 语句，获取结果。
5. **处理结果**：将 SQL 语句的执行结果映射为 Java 对象。

### 优点

1. **简单易用**：MyBatis 使用简单，配置灵活。
2. **SQL 可控**：开发者可以完全控制 SQL 语句，方便进行优化。
3. **支持动态 SQL**：MyBatis 支持动态生成 SQL 语句。
4. **良好的扩展性**：MyBatis 提供了丰富的插件机制，方便扩展。

### 缺点

1. **SQL 维护成本高**：由于需要手写 SQL 语句，维护成本较高。
2. **性能问题**：对于复杂查询，手写 SQL 可能导致性能问题。
3. **学习成本**：需要学习 MyBatis 的配置和使用方法。
