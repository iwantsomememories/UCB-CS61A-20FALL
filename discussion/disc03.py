# Question 1.1
def multiply(m, n):
    """
    >>> multiply(5, 3)
    15
    """
    if m == 0 or n == 0:
        return 0
    if m == 1:
        return n
    if n == 1:
        return m

    if m > n:
        return multiply(m, n-1) + m
    else:
        return multiply(m-1, n) + n

# Question 1.2
# rec do what pow(x, y) do

# Question 1.3
def hailstone(n):
    """Print out the hailstone sequence starting at n, and return the
    number of elements in the sequence.
    >>> a = hailstone(10)
    10
    5
    16
    8
    4
    2
    1
    >>> a
    7
    """
    print(n)
    if n == 1:
        return 1
    if n % 2 == 0:
        return hailstone(n//2) + 1
    else:
        return hailstone(n*3+1) + 1

# Question 1.4
def merge(n1, n2):
    """ 合并两个数字
    >>> merge(31, 42)
    4321
    >>> merge(21, 0)
    21
    >>> merge (21, 31)
    3211
    """
    if n1 == 0:
        return n2
    if n2 == 0:
        return n1
    n1_almost, n1_last = n1 // 10, n1 % 10
    n2_almost, n2_last = n2 // 10, n2 % 10
    if n1_last < n2_last:
        return merge(n1_almost, n2) * 10 + n1_last
    else:
        return merge(n1, n2_almost) * 10 + n2_last

# Question 1.5
def make_func_repeater(f, x):
    """
    >>> incr_1 = make_func_repeater(lambda x: x + 1, 1)
    >>> incr_1(2) #same as f(f(x))
    3
    >>> incr_1(5)
    6
    """
    def repeat(y):
        if y == 1:
            return f(x)
        else:
            return f(repeat(y-1))
    return repeat

# Question 1.6
def is_prime(n):
    """
    >>> is_prime(7)
    True
    >>> is_prime(10)
    False
    >>> is_prime(1)
    False
    """
    def prime_helper(factor):
        if factor == 1:
            return 1
        elif n % factor == 0:
            return prime_helper(factor-1) + 1
        else:
            return prime_helper(factor-1)

    return prime_helper(n) == 2
