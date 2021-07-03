import os
import atexit
import readline

import math as m
try:
    import periodictable as p
except ImportError:
    pass

# get .python_history out of home directory:
base = ""
try:
    base = os.environ['XDG_CACHE_HOME']
except KeyError:
    base = os.path.join(os.path.expanduser("~"), ".cache")
histfile = os.path.join(base, "python_history")
try:
    readline.read_history_file(histfile)
    readline.set_history_length(1000)
except FileNotFoundError:
    pass
atexit.register(readline.write_history_file, histfile)

# factor pairs
def fac(x):
    facs = []
    for i in range(1, x + 1):
        if x % i == 0:
            if i * i == x:
                facs.append(i)
            facs.append(i)
    a = facs[:int(len(facs)/2)]
    b = facs[int(len(facs)/2):]
    return [(a[i], b[len(b)-i-1]) for i in range(0, len(b))]

# greatest common denominator
def gcd(a, b):
    while b:
        a, b = b, a % b
    return a

# least common denominator
def lcd(a, b):
    return int((a*b)/gcd(a,b))

# simplify fraction
def sf(numer, denom):
    if denom == 0:
        return None
    common_divisor = gcd(numer, denom)
    (reduced_num, reduced_den) = (numer / common_divisor, denom / common_divisor)
    if reduced_den == 1:
        return int(reduced_num)
    elif common_divisor == 1:
        return (int(numer), int(denom))
    else:
        return (int(reduced_num), int(reduced_den))

# nth root
def r(number, root):
    if root == 0: return 1
    return number ** (1 / root)

# distance formula
def dis(a, b):
    return m.sqrt( ((b[0] - a[0]) ** 2) + ((b[1] - a[1]) ** 2) )

# degree trig funcs
def dsin(a):
    return m.sin(m.radians(a))
def dcos(a):
    return m.cos(m.radians(a))
def dtan(a):
    return m.tan(m.radians(a))
def dasin(a):
    return m.degrees(m.asin(a))
def dacos(a):
    return m.degrees(m.acos(a))
def datan(a):
    return m.degrees(m.atan(a))

# dot product
def dot(a, b):
    product = 0
    for a, b in zip(a, b):
        product += a * b
    return product

# hypotenuse
def hyp(a, b):
    return m.sqrt(a**2 + b**2)

# vector angle
def veca(a, b):
    return dacos(
        dot(a,b) / (hyp(a[0],a[1]) * hyp(b[0], b[1]))
    )
