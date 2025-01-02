# 算法

## 算法中针对二进制的题型

<!-- notecardId: 1735833685516 -->

### 操作类型

1. **位操作**：

   - **位与（AND）**：用于清零操作或判断某一位是否为 1。
   - **位或（OR）**：用于设置某一位为 1。
   - **位异或（XOR）**：用于翻转某一位或用于找出不同的位。
   - **位非（NOT）**：用于取反操作。
   - **左移（<<）**：用于乘以 2 的幂。
   - **右移（>>）**：用于除以 2 的幂。

2. **常见题型**：

   - **计算二进制中 1 的个数**：使用位与操作和右移操作。
   - **判断一个数是否是 2 的幂**：使用位与操作。
   - **找出数组中唯一出现一次的数字**：使用位异或操作。
   - **交换两个数**：使用位异或操作。
   - **找出缺失的数字**：使用位异或操作。
   - **二进制加法**：使用位与、位异或和左移操作。

3. **进阶题型**：
   - **汉明距离**：计算两个数的二进制表示中不同位的个数。
   - **位计数**：计算从 0 到 n 每个数的二进制中 1 的个数。
   - **最大二进制间距**：计算一个数的二进制表示中两个连续 1 之间的最大距离。

这些题型都利用了二进制的特性和操作，能够高效地解决问题。

### 示例

1. **位操作**：

   - **位与（AND）**：

     ```python
     # 清零操作
     a = 0b1101
     b = 0b1010
     result = a & b  # 结果是 0b1000
     ```

   - **位或（OR）**：

     ```python
     # 设置某一位为1
     a = 0b1101
     b = 0b1010
     result = a | b  # 结果是 0b1111
     ```

   - **位异或（XOR）**：

     ```python
     # 翻转某一位
     a = 0b1101
     b = 0b1010
     result = a ^ b  # 结果是 0b0111
     ```

   - **位非（NOT）**：

     ```python
     # 取反操作
     a = 0b1101
     result = ~a  # 结果是 -0b1110
     ```

   - **左移（<<）**：

     ```python
     # 乘以2的幂
     a = 0b1101
     result = a << 2  # 结果是 0b110100
     ```

   - **右移（>>）**：
     ```python
     # 除以2的幂
     a = 0b1101
     result = a >> 2  # 结果是 0b11
     ```

2. **常见题型**：

   - **计算二进制中 1 的个数**：

     ```python
     def count_ones(n):
         count = 0
         while n:
             n &= (n - 1)
             count += 1
         return count

     result = count_ones(0b1101)  # 结果是 3
     ```

   - **判断一个数是否是 2 的幂**：

     ```python
     def is_power_of_two(n):
         return n > 0 and (n & (n - 1)) == 0

     result = is_power_of_two(16)  # 结果是 True
     ```

   - **找出数组中唯一出现一次的数字**：

     ```python
     def find_unique(nums):
         unique = 0
         for num in nums:
             unique ^= num
         return unique

     result = find_unique([4, 1, 2, 1, 2])  # 结果是 4
     ```

   - **交换两个数**：

     ```python
     a = 5
     b = 3
     a ^= b
     b ^= a
     a ^= b
     # 交换后 a = 3, b = 5
     ```

   - **找出缺失的数字**：

     ```python
     def find_missing(nums):
         missing = len(nums)
         for i, num in enumerate(nums):
             missing ^= i ^ num
         return missing

     result = find_missing([3, 0, 1])  # 结果是 2
     ```

   - **二进制加法**：

     ```python
     def add_binary(a, b):
         while b:
             carry = a & b
             a = a ^ b
             b = carry << 1
         return a

     result = add_binary(0b1101, 0b1011)  # 结果是 0b11000
     ```

3. **进阶题型**：

   - **汉明距离**：

     ```python
     def hamming_distance(x, y):
         return bin(x ^ y).count('1')

     result = hamming_distance(1, 4)  # 结果是 2
     ```

   - **位计数**：

     ```python
     def count_bits(n):
         res = [0] * (n + 1)
         for i in range(1, n + 1):
             res[i] = res[i >> 1] + (i & 1)
         return res

     result = count_bits(5)  # 结果是 [0, 1, 1, 2, 1, 2]
     ```

   - **最大二进制间距**：

     ```python
     def binary_gap(n):
         last = None
         max_gap = 0
         for i in range(32):
             if (n >> i) & 1:
                 if last is not None:
                     max_gap = max(max_gap, i - last)
                 last = i
         return max_gap

     result = binary_gap(22)  # 结果是 2
     ```
