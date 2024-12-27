# CyclicBarrier 详细介绍

## CyclicBarrier

<!-- notecardId: 1735192792683 -->

### 特点

- **可重用**：CyclicBarrier 在释放等待线程后可以被重用。
- **可指定线程数**：可以指定需要等待的线程数。
- **可执行任务**：在所有线程到达屏障后，可以执行一个指定的任务。

### 作用

CyclicBarrier 是一个同步辅助类，它允许一组线程互相等待，直到所有线程都到达一个公共的屏障点（barrier）。CyclicBarrier 在并发编程中用于协调多个线程的执行顺序。

### 使用场景

- **多线程计算结果合并**：将一个大任务分解成多个小任务并行执行，最后汇总结果。
- **多阶段任务**：将一个任务分成多个阶段，每个阶段需要多个线程协作完成。
- **模拟并发场景**：在测试中模拟多个线程同时执行某个操作。

### 示例代码

```java
import java.util.concurrent.CyclicBarrier;

public class CyclicBarrierExample {
    public static void main(String[] args) {
        int parties = 3;
        CyclicBarrier barrier = new CyclicBarrier(parties, () -> {
            System.out.println("所有线程都到达屏障点，执行汇总任务");
        });

        for (int i = 0; i < parties; i++) {
            new Thread(new Task(barrier)).start();
        }
    }
}

class Task implements Runnable {
    private CyclicBarrier barrier;

    public Task(CyclicBarrier barrier) {
        this.barrier = barrier;
    }

    @Override
    public void run() {
        try {
            System.out.println(Thread.currentThread().getName() + " 到达屏障点");
            barrier.await();
            System.out.println(Thread.currentThread().getName() + " 继续执行");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
```

### 底层实现

CyclicBarrier 的底层实现主要依赖于 ReentrantLock 和 Condition。每个 CyclicBarrier 对象包含一个内部类 Generation，用于表示当前的屏障状态。CyclicBarrier 使用一个计数器来跟踪已到达屏障的线程数，当计数器达到指定的线程数时，所有等待的线程被唤醒并继续执行。

- **ReentrantLock**：用于确保对计数器的操作是线程安全的。
- **Condition**：用于在计数器未达到指定线程数时，使线程等待。

当所有线程都到达屏障点时，CyclicBarrier 会重置计数器，并可以选择执行一个预定义的任务。
