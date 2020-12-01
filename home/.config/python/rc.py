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
