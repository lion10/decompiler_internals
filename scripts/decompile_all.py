from ghidra.app.decompiler import DecompInterface
from ghidra.util.task import ConsoleTaskMonitor

def run():
    currentProgram = getCurrentProgram()
    fm = currentProgram.getFunctionManager()
    funcs = fm.getFunctions(True)

    print("[PY] start decompiling {}".format(currentProgram.getName()))

    ifc = DecompInterface()
    ifc.openProgram(currentProgram)

    monitor = ConsoleTaskMonitor()

    count = 0
    for func in funcs:
        print("[PY] function {}".format(func.getName()))
        res = ifc.decompileFunction(func, 60, monitor)
        if res.decompileCompleted():
            count += 1
        else:
            print("[PY] failed {}".format(func.getName()))

    print("[PY] finished, completed={}".format(count))

run()