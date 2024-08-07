# Question 1.1
def count_stair_ways(n):
    if n == 1:
        return 1
    if n == 2:
        return 2
    return count_stair_ways(n-1)+count_stair_ways(n-2)

# Question 1.2
def count_k(n, k):
    """
    >>> count_k(3, 3) # 3, 2 + 1, 1 + 2, 1 + 1 + 1
    4
    >>> count_k(4, 4)
    8
    >>> count_k(10, 3)
    274
    >>> count_k(300, 1) # 一次只能走一步
    1
    """
    if n == 0:
        return 1
    if k == 1:
        return 1
    res, i = 0, 1
    while i < k + 1 and n - i >= 0:
        res += count_k(n-i, k)
        i += 1
    
    return res

# Question 2.1
# >>> a = [1, 5, 4, [2, 3], 3]
# >>> print(a[0], a[-1])
# 1 3
# >>> len(a)
# 5
# >>> 2 in a
# False
# >>> 4 in a
# True
# >>> a[3][0]
# 2

# Question 2.2
def even_weighted(s):
    """
    >>> x = [1, 2, 3, 4, 5, 6]
    >>> even_weighted(x)
    [0, 6, 20]
    """
    return [s[i]*i for i in range(len(s)) if i % 2 == 0]

# Question 2.3
def max_product(s):
    """Return the maximum product that can be formed using non-consecutive elements of s.
    >>> max_product([10,3,1,9,2]) # 10 * 9
    90
    >>> max_product([5,10,5,10,5]) # 5 * 5 * 5
    125
    >>> max_product([])
    1
    """
    if len(s) == 0:
        return 1
    if len(s) == 1:
        return s[0]
    first = s[0] * max_product(s[2:]) if len(s) >= 3 else s[0]
    second = s[1] * max_product(s[3:]) if len(s) >= 4 else s[1]
    return max(s[0] * max_product(s[2:]), s[1] * max_product(s[3:]))
