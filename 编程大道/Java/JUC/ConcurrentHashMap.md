# 并发HashMap

## Java8 ConcurrentHashMap

<!-- notecardId: 1735049009102 -->

> 关键点: 分段锁，CAS，红黑树

### 实现原理

Java 8 中的 `ConcurrentHashMap` 采用了分段锁和 CAS 操作来实现高效并发。主要特点包括：

1. 数据结构
在 Java 8 中，ConcurrentHashMap 主要由以下几个部分组成：
    - Node 数组：ConcurrentHashMap 的底层是一个 Node<K,V>[] 数组，每个元素是一个链表或红黑树的头节点。
    - Node 节点：每个 Node 包含一个键值对和一个指向下一个节点的引用。
    - TreeNode 节点：当链表长度超过一定阈值（默认是 8）时，链表会转换为红黑树，Node 节点会变成 TreeNode 节点。
2. CAS 操作
CAS（Compare-And-Swap）是一种无锁的并发编程技术，用于实现原子操作。ConcurrentHashMap 使用 CAS 操作来保证并发安全，减少锁的使用。例如，在插入新节点时，会使用 CAS 操作来确保只有一个线程能够成功插入。

3. 分段锁
虽然 Java 8 中取消了 Segment，但仍然通过分段锁机制来减少锁的粒度。具体实现是通过对每个桶（bucket）进行加锁，而不是对整个 ConcurrentHashMap 加锁，从而提高并发性能。

4. 红黑树
当链表长度超过一定阈值（默认是 8）时，链表会转换为红黑树。红黑树是一种自平衡二叉搜索树，能够在 O(log n) 时间内完成插入、删除和查找操作，从而提高查询效率。

5. 扩容机制
ConcurrentHashMap 的扩容机制也进行了优化。扩容时，采用分段扩容的方式，即每次只扩容一个桶，减少扩容时的性能开销。

### 改进

相比 Java 7，Java 8 中的 `ConcurrentHashMap` 进行了以下改进：

- **取消了 Segment**：Java 8 中取消了 Segment，改为使用 Node 数组和 CAS 操作来实现并发控制。
- **引入红黑树**：当链表长度超过 8 时，链表会转换为红黑树，优化查询性能。
- **优化扩容机制**：采用分段扩容，减少扩容时的性能开销。

### 常见面试题

>**Q: ConcurrentHashMap 的实现原理是什么？**
A: 采用分段锁和 CAS 操作来实现高效并发，使用红黑树优化查询性能。
>**Q: Java 8 中 ConcurrentHashMap 相比 Java 7 有哪些改进？**
A: 取消了 Segment，改为使用 Node 数组和 CAS 操作；引入红黑树；优化扩容机制。
>**Q: ConcurrentHashMap 如何保证线程安全？**
A: 通过 CAS 操作和分段锁机制来保证线程安全。

### 应用场景

- **高并发环境**：适用于高并发读写的场景，如缓存系统、计数器等。
- **多线程数据共享**：适用于多线程环境下的数据共享，保证线程安全和高效访问。
