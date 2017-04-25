import argparse
try:
    from Tkinter import *
    from ttk import *
except ImportError:  # Python 3
    from tkinter import *
    from tkinter.ttk import *

somearray = [0 for x in range(8)]
anames = ['A', 'B', 'C', 'D', 'F']
arrays = {}
[arrays.update({x: somearray}) for x in anames]

class App(Frame):

    def __init__(self, parent):
        Frame.__init__(self, parent)
        self.CreateUI()
        self.LoadTable()
        self.grid(sticky = (N,S,W,E))

    def CreateUI(self):
        tv = Treeview(self)
        columns = []
        for i in range(8):
                columns += [str(i+1)]
        tv['columns'] = tuple(columns)
        for x in tv['columns']:
            tv.heading(x, text=x)
            tv.column(x, anchor='center', width=70)
        tv.grid(sticky = (N,S,W,E))
        self.treeview = tv

    def LoadTable(self):
        [self.treeview.insert('', str(idx), text=i, value=tuple(arrays[i])) for idx, i in enumerate(anames)]
        

def main():
    root = Tk()
    parseargs()
    root.resizable(width=False, height=False)
    App(root)
    root.mainloop()


def parseargs():
    arguments_parser = argparse.ArgumentParser()
    [arguments_parser.add_argument(x, nargs="+") for x in ['--'+x for x in anames]]
    arguments = arguments_parser.parse_args()
    for x in anames:
        arrays[x] = getattr(arguments, x) or somearray

if __name__ == '__main__':
    main()