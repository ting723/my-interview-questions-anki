# JUC

## ReentrantLock

<!-- notecardId: 1735269936627 -->

### 实现机制

`ReentrantLock` 是 `java.util.concurrent.locks` 包中的一个可重入互斥锁。它提供了比 `synchronized` 更加灵活的锁机制。`ReentrantLock` 通过内部的 `AbstractQueuedSynchronizer` (AQS) 来实现锁的获取与释放。

### 主要方法

- `lock()`: 获取锁，如果锁不可用，则当前线程将被禁用以进行线程调度，并处于休眠状态，直到获得锁。
- `unlock()`: 释放锁。
- `tryLock()`: 尝试获取锁，如果锁可用，则获取锁并立即返回 `true`，否则返回 `false`。
- `lockInterruptibly()`: 获取锁，但可以在等待时中断。
- `newCondition()`: 返回一个绑定到此 `ReentrantLock` 实例的新 `Condition` 实例。

### 优缺点

#### 优点

- **灵活性**: 提供了比 `synchronized` 更加灵活的锁机制，可以实现公平锁和非公平锁。
- **可中断锁**: 支持响应中断的锁获取操作。
- **超时锁**: 支持在指定时间内尝试获取锁。
- **条件变量**: 提供了 `Condition` 类，可以实现多路通知。

#### 缺点

- **复杂性**: 使用起来比 `synchronized` 复杂，需要显式地获取和释放锁。
- **性能开销**: 在某些情况下，性能可能不如 `synchronized`。

### 使用场景

- **需要公平锁的场景**: 例如，某些需要严格按照请求顺序获取锁的场景。
- **需要可中断锁的场景**: 例如，某些需要在等待锁的过程中响应中断的场景。
- **需要超时锁的场景**: 例如，某些需要在指定时间内尝试获取锁的场景。
- **需要条件变量的场景**: 例如，某些需要多路通知的场景。

### 公平锁与非公平锁

`ReentrantLock` 可以通过构造函数来指定是公平锁还是非公平锁。

- **公平锁**: 公平锁保证线程获取锁的顺序是按照线程请求锁的顺序（FIFO）来分配的。公平锁通过在构造函数中传入 `true` 参数来实现。

```java
ReentrantLock fairLock = new ReentrantLock(true);
```

- **非公平锁**: 非公平锁不保证线程获取锁的顺序，可能会导致某些线程长时间等待锁。非公平锁通过在构造函数中传入 `false` 参数或使用默认构造函数来实现。

```java
ReentrantLock nonFairLock = new ReentrantLock();
ReentrantLock nonFairLockExplicit = new ReentrantLock(false);
```

### 公平锁和非公平锁底层实现机制

公平锁和非公平锁的主要区别在于线程获取锁的顺序。

- **公平锁**: 公平锁通过一个先进先出（FIFO）队列来管理等待线程。每当一个线程请求锁时，它会被加入到队列的末尾。当锁被释放时，队列中的第一个线程将被唤醒并获取锁。这种机制确保了锁的获取顺序是公平的。

- **非公平锁**: 非公平锁则不保证锁的获取顺序。当一个线程请求锁时，它会直接尝试获取锁，如果锁是空闲的，它将立即获取锁。如果锁被占用，它将被加入到等待队列中，但在锁被释放时，它可能会与其他等待线程竞争锁。这种机制可能会导致某些线程长时间等待锁，但在某些情况下，非公平锁的性能可能会更高，因为它减少了线程上下文切换的开销。

在 `ReentrantLock` 中，公平锁和非公平锁的实现都是基于 `AbstractQueuedSynchronizer` (AQS) 的。AQS 通过一个双向链表来管理等待线程，并提供了公平和非公平两种模式的实现。

### 示例代码

```java
import java.util.concurrent.locks.ReentrantLock;

public class FairAndNonFairLockExample {
    private final ReentrantLock fairLock = new ReentrantLock(true);
    private final ReentrantLock nonFairLock = new ReentrantLock();

    public void performFairTask() {
        fairLock.lock();
        try {
            System.out.println("Fair lock held by: " + Thread.currentThread().getName());
        } finally {
            fairLock.unlock();
        }
    }

    public void performNonFairTask() {
        nonFairLock.lock();
        try {
            System.out.println("Non-fair lock held by: " + Thread.currentThread().getName());
        } finally {
            nonFairLock.unlock();
        }
    }

    public static void main(String[] args) {
        FairAndNonFairLockExample example = new FairAndNonFairLockExample();
        Runnable fairTask = example::performFairTask;
        Runnable nonFairTask = example::performNonFairTask;

        Thread thread1 = new Thread(fairTask, "Thread-1");
        Thread thread2 = new Thread(fairTask, "Thread-2");
        Thread thread3 = new Thread(nonFairTask, "Thread-3");
        Thread thread4 = new Thread(nonFairTask, "Thread-4");

        thread1.start();
        thread2.start();
        thread3.start();
        thread4.start();
    }
}
```
### 示例代码

```java
import java.util.concurrent.locks.ReentrantLock;

public class ReentrantLockExample {
    private final ReentrantLock lock = new ReentrantLock();

    public void performTask() {
        lock.lock();
        try {
            // 关键代码部分
            System.out.println("Lock is held by: " + Thread.currentThread().getName());
        } finally {
            lock.unlock();
        }
    }

    public static void main(String[] args) {
        ReentrantLockExample example = new ReentrantLockExample();
        Runnable task = example::performTask;

        Thread thread1 = new Thread(task, "Thread-1");
        Thread thread2 = new Thread(task, "Thread-2");

        thread1.start();
        thread2.start();
    }
}
```
