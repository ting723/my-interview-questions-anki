# Go

## Goroutine

<!-- notecardId: 1736471718722 -->

Goroutine 是 Go 语言中的一种轻量级线程管理方式。它由 Go 运行时管理，具有以下特点：

### 特点

1. **轻量级**：相比于操作系统线程，Goroutine 占用的内存更少，启动速度更快。
2. **并发执行**：Goroutine 可以并发执行多个任务，提高程序的执行效率。
3. **简单易用**：使用 `go` 关键字即可启动一个新的 Goroutine。

### 使用方法

启动一个 Goroutine 非常简单，只需在函数调用前加上 `go` 关键字：

```go
package main

import (
    "fmt"
    "time"
)

func sayHello() {
    fmt.Println("Hello, Goroutine!")
}

func main() {
    go sayHello()
    time.Sleep(time.Second) // 等待 Goroutine 执行完毕
}
```

在上面的例子中，`sayHello` 函数会在一个新的 Goroutine 中执行。

### Goroutine 与线程的区别

1. **内存占用**：Goroutine 的栈大小初始只有几 KB，而线程的栈大小通常为 1 MB。
2. **调度**：Goroutine 由 Go 运行时调度，而线程由操作系统调度。
3. **数量**：一个程序可以轻松创建数百万个 Goroutine，而创建数百万个线程是不现实的。

### 常见问题

1. **同步问题**：多个 Goroutine 访问共享资源时，需要使用同步机制（如通道、互斥锁）来避免竞态条件。
2. **泄漏问题**：如果 Goroutine 无法正常退出，可能会导致 Goroutine 泄漏，消耗系统资源。

### 参考资料

- [Go 官方文档](https://golang.org/doc/)
- [Effective Go](https://golang.org/doc/effective_go.html)
- [Go 并发编程](https://golang.org/doc/effective_go.html#concurrency)

### 常见的面试题

1. **什么是 Goroutine？**
    - Goroutine 是 Go 语言中的一种轻量级线程管理方式，由 Go 运行时管理。

2. **如何启动一个 Goroutine？**
    - 使用 `go` 关键字在函数调用前启动一个新的 Goroutine，例如：`go functionName()`。

3. **Goroutine 和线程有什么区别？**
    - Goroutine 的栈大小初始只有几 KB，而线程的栈大小通常为 1 MB。Goroutine 由 Go 运行时调度，而线程由操作系统调度。

4. **如何在 Goroutine 之间进行通信？**
    - 可以使用通道（channel）在 Goroutine 之间进行通信。

5. **如何避免 Goroutine 泄漏？**
    - 确保 Goroutine 能够正常退出，例如使用上下文（context）来控制 Goroutine 的生命周期。

6. **如何处理多个 Goroutine 访问共享资源的问题？**
    - 使用同步机制（如通道、互斥锁）来避免竞态条件。

7. **什么是竞态条件？**
    - 竞态条件是指多个 Goroutine 同时访问和修改共享资源时，可能导致数据不一致的问题。

8. **如何调试 Goroutine？**
    - 可以使用 Go 提供的调试工具（如 `runtime` 包中的函数）来调试 Goroutine。

9. **Goroutine 的调度策略是什么？**
    - Goroutine 由 Go 运行时的调度器进行调度，采用的是 M:N 调度模型。

10. **如何处理 Goroutine 的错误？**
     - 可以使用 `recover` 函数在 `defer` 中捕获 Goroutine 的恐慌（panic），从而处理错误。