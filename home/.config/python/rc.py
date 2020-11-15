import os
import atexit
import readline

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
