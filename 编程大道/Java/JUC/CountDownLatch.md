# CountDownLatch

## CountDownLatch 概述

<!-- notecardId: 1735192667266 -->

### 概述

`CountDownLatch` 是一个同步辅助类，用于协调多个线程之间的同步。它允许一个或多个线程等待，直到在其他线程中执行的一组操作完成。

### 底层实现

`CountDownLatch` 基于 `AQS`（AbstractQueuedSynchronizer）实现。其核心是一个计数器，初始值由构造函数指定。每调用一次 `countDown()` 方法，计数器减一；每调用一次 `await()` 方法，线程会阻塞，直到计数器为零。

#### 主要方法

- `CountDownLatch(int count)`: 构造方法，初始化计数器。
- `void countDown()`: 计数器减一。
- `void await() throws InterruptedException`: 阻塞当前线程，直到计数器为零。
- `boolean await(long timeout, TimeUnit unit) throws InterruptedException`: 在指定时间内阻塞当前线程，直到计数器为零或超时。

### 优缺点

#### 优点

- 简单易用，适合线程间的简单同步。
- 可以实现一次性事件的等待。

#### 缺点

- 计数器不能重置，`CountDownLatch` 只能使用一次。
- 不适合需要重复使用的场景。

### 作用场景

- **并行计算**: 将一个任务分解为多个子任务，并行执行，等待所有子任务完成后再进行汇总。
- **启动顺序控制**: 确保某些服务在启动前依赖的其他服务已经启动。
- **模拟并发测试**: 控制多个线程同时开始执行，以测试并发性能。

### 示例代码

```java
import java.util.concurrent.CountDownLatch;

public class CountDownLatchExample {
    public static void main(String[] args) throws InterruptedException {
        int count = 3;
        CountDownLatch latch = new CountDownLatch(count);

        for (int i = 0; i < count; i++) {
            new Thread(new Worker(latch)).start();
        }

        latch.await(); // 主线程等待所有子线程完成
        System.out.println("All workers finished.");
    }
}

class Worker implements Runnable {
    private final CountDownLatch latch;

    Worker(CountDownLatch latch) {
        this.latch = latch;
    }

    @Override
    public void run() {
        try {
            // 模拟任务执行
            Thread.sleep(1000);
            System.out.println(Thread.currentThread().getName() + " finished.");
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        } finally {
            latch.countDown();
        }
    }
}
```
