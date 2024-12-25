# AQS

## Java 的 AQS 详解

<!-- notecardId: 1735097763988 -->

### 什么是 AQS

AQS（AbstractQueuedSynchronizer）是 Java 并发包（java.util.concurrent）中的一个基础框架，用于构建锁和同步器。它通过一个 FIFO 队列来管理获取锁的线程，并提供了一个基于状态的机制来控制线程的访问。

### AQS 的核心组件

1. **State**: 一个 volatile 的 int 变量，表示同步状态。
2. **FIFO 队列**: 用于存放等待获取锁的线程。
3. **ConditionObject**: 用于实现等待/通知机制。

### AQS 的工作原理

AQS 通过维护一个同步状态（state）和一个 FIFO 等待队列来管理线程的访问。主要方法包括：

- `acquire(int arg)`: 尝试获取锁，如果失败则将线程加入等待队列。
- `release(int arg)`: 释放锁，并唤醒等待队列中的线程。
- `acquireShared(int arg)`: 共享模式下获取锁。
- `releaseShared(int arg)`: 共享模式下释放锁。

### AQS 的使用

AQS 是一个抽象类，通常通过继承 AQS 并实现其抽象方法来创建自定义的同步器。常见的实现包括 ReentrantLock、Semaphore、CountDownLatch 等。

#### 示例：自定义同步器

```java
class CustomSync extends AbstractQueuedSynchronizer {
    @Override
    protected boolean tryAcquire(int arg) {
        // 自定义获取锁的逻辑
    }

    @Override
    protected boolean tryRelease(int arg) {
        // 自定义释放锁的逻辑
    }
}
```

### 总结

AQS 是 Java 并发编程中的一个重要组件，通过它可以方便地实现各种锁和同步器。理解 AQS 的工作原理和使用方法，对于编写高效的并发程序非常有帮助。

### 常见的面试题

#### Q1: 什么是 AQS？

**A**: AQS（AbstractQueuedSynchronizer）是 Java 并发包中的一个基础框架，用于构建锁和同步器。它通过一个 FIFO 队列来管理获取锁的线程，并提供了一个基于状态的机制来控制线程的访问。

#### Q2: AQS 的核心组件有哪些？

**A**: AQS 的核心组件包括：

1. State：一个 volatile 的 int 变量，表示同步状态。
2. FIFO 队列：用于存放等待获取锁的线程。
3. ConditionObject：用于实现等待/通知机制。

#### Q3: AQS 的主要方法有哪些？

**A**: AQS 的主要方法包括：

- `acquire(int arg)`: 尝试获取锁，如果失败则将线程加入等待队列。
- `release(int arg)`: 释放锁，并唤醒等待队列中的线程。
- `acquireShared(int arg)`: 共享模式下获取锁。
- `releaseShared(int arg)`: 共享模式下释放锁。

#### Q4: 如何使用 AQS 创建自定义同步器？

**A**: AQS 是一个抽象类，通常通过继承 AQS 并实现其抽象方法来创建自定义的同步器。常见的实现包括 ReentrantLock、Semaphore、CountDownLatch 等。

#### Q5: 请举例说明如何实现一个自定义同步器？

**A**: 下面是一个自定义同步器的示例：

```java
class CustomSync extends AbstractQueuedSynchronizer {
    @Override
    protected boolean tryAcquire(int arg) {
        // 自定义获取锁的逻辑
    }

    @Override
    protected boolean tryRelease(int arg) {
        // 自定义释放锁的逻辑
    }
}
```
