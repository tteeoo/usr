import os
import atexit
import readline

# get .python_history outta ~!
histfile = os.path.join(os.path.expanduser("~"), ".local/share/python_history")
try:
    readline.read_history_file(histfile)
    readline.set_history_length(1000)
except FileNotFoundError:
    pass
atexit.register(readline.write_history_file, histfile)
