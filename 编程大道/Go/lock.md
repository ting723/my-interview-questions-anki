# Go

## Go 的锁机制

<!-- notecardId: 1736472551800 -->

在 Go 语言中，锁机制主要用于在多线程环境下保护共享资源，防止数据竞争。Go 提供了多种锁机制，以下是几种常见的锁类型：

### 1. 互斥锁 (Mutex)

互斥锁是一种最基本的锁机制，用于确保在同一时间只有一个线程可以访问共享资源。Go 语言中的`sync`包提供了`Mutex`类型来实现互斥锁。

```go
import (
    "sync"
)

var mu sync.Mutex

func criticalSection() {
    mu.Lock()
    defer mu.Unlock()
    // 访问共享资源的代码
}
```

### 2. 读写锁 (RWMutex)

读写锁允许多个线程同时读取共享资源，但在写操作时，必须独占访问。Go 语言中的`sync`包提供了`RWMutex`类型来实现读写锁。

```go
import (
    "sync"
)

var rwMu sync.RWMutex

func readOperation() {
    rwMu.RLock()
    defer rwMu.RUnlock()
    // 读取共享资源的代码
}

func writeOperation() {
    rwMu.Lock()
    defer rwMu.Unlock()
    // 写入共享资源的代码
}
```

### 3. 等待组 (WaitGroup)

等待组用于等待一组线程完成。它可以用于协调多个线程的执行顺序。Go 语言中的`sync`包提供了`WaitGroup`类型来实现等待组。

```go
import (
    "sync"
)

var wg sync.WaitGroup

func worker() {
    defer wg.Done()
    // 执行任务的代码
}

func main() {
    wg.Add(1)
    go worker()
    wg.Wait()
}
```

### 4. 原子操作 (Atomic)

原子操作用于在不使用锁的情况下实现对共享资源的安全访问。Go 语言中的`sync/atomic`包提供了多种原子操作函数。

```go
import (
    "sync/atomic"
)

var counter int64

func increment() {
    atomic.AddInt64(&counter, 1)
}
```

通过使用这些锁机制，Go 语言可以有效地管理多线程环境下的并发访问，确保数据的一致性和安全性。
