from math import *

def _init():
    import atexit
    import os
    import readline

    def _get_hist_file():
        if "PYTHON_HISTORY" in os.environ:
            history = os.path.expanduser(os.environ["PYTHON_HISTORY"])
        elif "XDG_DATA_HOME" in os.environ:
            data_home = os.path.expanduser(os.environ["XDG_DATA_HOME"])
            history = os.path.join(data_home, "python", "python_history")
        else:
            history = os.path.join(os.path.expanduser("~"), ".python_history")

        history = os.path.abspath(history)
        _dir, _ = os.path.split(history)
        os.makedirs(_dir, exist_ok=True)

        return history

    histfile = _get_hist_file()

    try:
        readline.read_history_file(histfile)
        h_len = readline.get_current_history_length()
    except FileNotFoundError:
        open(histfile, 'wb').close()
        h_len = 0

    def save(prev_h_len, histfile):
        new_h_len = readline.get_current_history_length()
        readline.append_history_file(new_h_len - prev_h_len, histfile)

    atexit.register(save, h_len, histfile)

_init()
del _init
