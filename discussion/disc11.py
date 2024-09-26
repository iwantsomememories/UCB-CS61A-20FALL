class Pair:
    """表示 Scheme 中内置的对数据结构。"""
    def __init__(self, first, rest):
        self.first = first
        if not scheme_valid_cdrp(rest):
            raise SchemeError("cdr 只能是一个对、nil 或一个 promise，但实际为 {}".format(rest))
        self.rest = rest

    def map(self, fn):
        """将 fn 映射到列表中的每个元素，返回一个新的 Pair。
        >>> Pair(1, Pair(2, Pair(3, nil))).map(lambda x: x * x)
        Pair(1, Pair(4, Pair(9, nil)))
        """
        assert isinstance(self.rest, Pair) or self.rest is nil, \
            "对中的 rest 元素必须是另一个对或 nil"
        return Pair(fn(self.first), self.rest.map(fn))

    def __repr__(self):
        return 'Pair({}, {})'.format(self.first, self.rest)

class nil:
    """表示 Scheme 中特殊的空对 nil。"""
    def map(self, fn):
        return nil

    def __getitem__(self, i):
        raise IndexError('索引超出范围')

    def __repr__(self):
        return 'nil'

nil = nil()  # 这将永远隐藏 nil 类

# Question 1.1

"""
>>> Pair('+', Pair(1, Pair(2, Pair(3, Pair(4, nil)))))
(+ 1 2 3 4)
>>> Pair('+', Pair(1, Pair(Pair('*', Pair(2, Pair(3, nil))), nil)))
(+ 1 (* 2 3))
"""

# Question 1.2

"""
1) Pair('+', Pair(Pair('-', Pair(2, Pair(4, nil))), Pair(6, Pair(8, nil))))
2) operator is '+'; operator = p.first
3) operands: (- 2 4) 6 8; operands = p.rest; first_operand =  p.rest.first.
"""

# Question 2.1

def calc_eval(exp):
    if isinstance(exp, Pair):
        if _______________________:  # and 表达式
            return eval_and(exp.rest)
        else:  # 调用表达式
            return calc_apply(calc_eval(exp.first), list(exp.rest.map(calc_eval)))
    elif exp in OPERATORS:  # 名称
        return OPERATORS[exp]
    else:  # 数字
        return exp

def eval_and(operands):
    # 实现和表达式的处理逻辑

def calc_apply(fn, args):
    """对数字列表应用计算器操作。"""
    return fn(args)


