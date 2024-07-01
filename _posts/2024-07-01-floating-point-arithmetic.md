---
layout: single 
title: Floating Point Arithmetic
date: 2024-07-01 01:11 -0700
categories: blog
---

I've come across this numerous times in my career thus far and have the lesson ingrained in me, but
I wanted to write something really quick to cover the perils of floating point arithmetic.

For the uninitiated, the problem of doing floating point arithmetic can be summarized by trying this
in Python (or almost any other language for that matter):
```python
>>> 1.3 + 0.1
1.4000000000000001
```

I know. Shocking, right?! There are many resources that go into great detail about why this happens,
so I won't do it here. Suffice it to say that the "floating point" type is imprecise due to the
nature of how the number is stored in computing. 

When doing any precise math (e.g. financial applications), you should be using a proper "Decimal"
type to address this, and every respectable language should have one, either natively or as a
package.

For example, in Python:
```python
>>> from decimal import Decimal
>>> Decimal('1.3') + Decimal('0.1')
Decimal('1.4')
```

Until next time, happy hacking!