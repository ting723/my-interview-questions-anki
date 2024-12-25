# Spring

## Spring Boot 自动配置和加载类

<!-- notecardId: 1735098607142 -->

Spring Boot 通过自动配置和类加载机制简化了 Spring 应用的开发。以下是其实现方式：

### 自动配置

Spring Boot 的自动配置功能通过 `@EnableAutoConfiguration` 注解实现。该注解会自动配置 Spring 应用上下文，尝试根据项目中的依赖和配置自动配置 Spring Bean。

#### 关键步骤

1. **注解扫描**: `@SpringBootApplication` 注解包含了 `@EnableAutoConfiguration`，它会触发自动配置。
2. **自动配置类**: Spring Boot 会扫描 `META-INF/spring.factories` 文件，找到所有 `org.springframework.boot.autoconfigure.EnableAutoConfiguration` 的实现类。
3. **条件注解**: 自动配置类通常使用 `@Conditional` 注解，只有在满足特定条件时才会生效。

### 类加载机制

Spring Boot 使用 `SpringFactoriesLoader` 来加载自动配置类。

#### 关键步骤

1. **加载配置文件**: `SpringFactoriesLoader` 会加载 `META-INF/spring.factories` 文件。
2. **实例化类**: 根据配置文件中的类名，使用反射机制实例化这些类。
3. **注册 Bean**: 将实例化的类注册为 Spring Bean。

通过以上机制，Spring Boot 实现了自动配置和类加载，大大简化了开发过程。
