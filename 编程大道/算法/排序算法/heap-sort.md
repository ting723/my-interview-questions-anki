# 排序

## 堆排序

<!-- notecardId: 1735194751735 -->

- 堆排序是一种基于堆数据结构的比较排序算法。
- 堆是一棵完全二叉树，分为最大堆和最小堆。最大堆的特点是每个节点的值都大于或等于其子节点的值，最小堆则相反。
- 堆排序的基本思想是将待排序的数组构造成一个最大堆，此时，整个数组的最大值就是堆顶的根节点。将它移走（其实是将其与堆数组的末尾元素交换，此时末尾元素就是最大值），然后将剩余的 n-1 个元素重新构造成一个最大堆。依此类推，便能得到一个有序数组。
- 堆排序的时间复杂度为 O(nlogn)，其中 n 为数组的长度。由于堆排序的过程中，需要不断地调整堆的结构，因此其时间复杂度与堆的高度有关，而堆的高度与数组的长度有关。因此，堆排序的时间复杂度为 O(nlogn)。
- 堆排序是不稳定的排序算法，因为在堆排序的过程中，相同元素的相对顺序可能会发生改变。

### 堆排序的步骤

1. **构建最大堆**：将初始数组（无序）构建成一个最大堆。
2. **堆排序**：将堆顶元素与末尾元素交换，断开末尾元素（最大值），然后重新调整堆，直到所有元素排序完毕。

### Go 语言实现代码

```go
package main

import "fmt"

// heapify is a function to maintain the heap property
func heapify(arr []int, n int, i int) {
    largest := i
    left := 2*i + 1
    right := 2*i + 2

    if left < n && arr[left] > arr[largest] {
        largest = left
    }

    if right < n && arr[right] > arr[largest] {
        largest = right
    }

    if largest != i {
        arr[i], arr[largest] = arr[largest], arr[i]
        heapify(arr, n, largest)
    }
}

// heapSort is the main function to sort an array using heap sort
func heapSort(arr []int) {
    n := len(arr)

    // Build a maxheap
    for i := n/2 - 1; i >= 0; i-- {
        heapify(arr, n, i)
    }

    // One by one extract elements from heap
    for i := n - 1; i >= 0; i-- {
        arr[0], arr[i] = arr[i], arr[0]
        heapify(arr, i, 0)
    }
}

func main() {
    arr := []int{12, 11, 13, 5, 6, 7}
    fmt.Println("Unsorted array:", arr)
    heapSort(arr)
    fmt.Println("Sorted array:", arr)
}
```

在上述代码中，`heapify`函数用于维护堆的性质，`heapSort`函数用于执行堆排序。`main`函数展示了如何使用`heapSort`函数对一个数组进行排序。
