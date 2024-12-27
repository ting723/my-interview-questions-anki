# Semaphore

## Semaphore 概述

<!-- notecardId: 1735192786654 -->

### 详细介绍

`Semaphore` 是一个计数信号量，用于控制同时访问特定资源的线程数量。它通过维护一个许可集来实现线程的同步。

### 优点

- **资源管理**：可以限制对特定资源的访问数量，防止资源过度使用。
- **线程同步**：可以用于实现复杂的线程同步机制。
- **灵活性**：可以动态调整许可的数量，适应不同的需求。

### 缺点

- **复杂性**：使用不当可能导致死锁或资源泄露。
- **性能开销**：频繁的许可获取和释放操作可能带来性能开销。

### 使用场景

- **连接池**：限制同时访问数据库的连接数。
- **限流**：控制并发请求的数量，防止系统过载。
- **资源共享**：在多线程环境中控制对共享资源的访问。

### 底层实现机制

`Semaphore` 的底层实现依赖于 `AQS`（AbstractQueuedSynchronizer），通过内部的计数器来管理许可。主要方法包括：

- `acquire()`：获取许可，如果没有可用许可则阻塞。
- `release()`：释放许可，唤醒等待的线程。

内部使用一个 FIFO 队列来管理等待的线程，确保公平性。

```java
public class Semaphore {
    private final Sync sync;

    abstract static class Sync extends AbstractQueuedSynchronizer {
        Sync(int permits) {
            setState(permits);
        }

        final int getPermits() {
            return getState();
        }

        final int nonfairTryAcquireShared(int acquires) {
            for (;;) {
                int available = getState();
                int remaining = available - acquires;
                if (remaining < 0 ||
                    compareAndSetState(available, remaining))
                    return remaining;
            }
        }

        protected final boolean tryReleaseShared(int releases) {
            for (;;) {
                int current = getState();
                int next = current + releases;
                if (next < current) // overflow
                    throw new Error("Maximum permit count exceeded");
                if (compareAndSetState(current, next))
                    return true;
            }
        }
    }
}
```
