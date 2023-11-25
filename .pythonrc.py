import atexit
import os
import readline
import sys

p = lambda s: print("\x1b[38;5;220m", s, "\x1b[m", sep="", file=sys.stderr)

if "GNU readline" in readline.__doc__:
    histfile = os.path.join(os.path.expanduser("~"), ".python_history_gnu")
elif "libedit readline" in readline.__doc__:
    p("(!) we are using libedit readline")
    histfile = os.path.join(os.path.expanduser("~"), ".python_history_libedit")
    atexit.register(
        p, "You may want to invoke `\x1b[1mstty\x1b[22m`, as libedit messes it up."
    )


try:
    readline.clear_history()
    readline.read_history_file(histfile)
except FileNotFoundError:
    # If `readline.get_current_history_length()` returns 0,
    # default history file `~/.python_history` is used, which
    # we don't want them to do.
    readline.add_history("#")
    pass

atexit.register(readline.write_history_file, histfile)
