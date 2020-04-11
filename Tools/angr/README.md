# Angr

## Installation

1. virtualenv  /tmp/MyEnv
2. source /tmp/MyEnv/bin/activate 
3. sudo apt-get install python3-dev libffi-dev build-essential virtualenvwrapper

Src: <https://docs.angr.io/introductory-errata/install>

## Scripting Setup:

```python
>>>Import angr
>>>Proj = angr.Project(‘fauxware’)
>>> p.arch
<Arch AMD64 (LE)>
>>> p.entry
0x400580
>>> p.filename
'fauxware'
>>> p.loader
<Loaded fauxware, maps [0x400000:0x5008000]>
>>> p.loader.shared_objects
{'fauxware': <ELF Object fauxware, maps [0x400000:0x60105f]>,
 u'libc.so.6': <ELF Object libc-2.27.so, maps [0x1000000:0x13f0adf]>,
 u'ld-linux-x86-64.so.2': <ELF Object ld-2.27.so, maps [0x2000000:0x222916f]>}
>>> p.loader.min_addr
0x400000
>>> p.loader.max_addr
0x5008000
>>> p.loader.main_object.execstack
False
>>> p.loader.main_object.pic
False
```

## ANGR INTRO start

### The factory
Allows you to pass certain parts of the project around instead of the entire project, AFTER instantiation. 

#### Blocks
Extracts a basic code block — fyi, Angr analyzes code in units of basic blocks.

In [11]: block = proj.factory.block(proj.entry)
In [12]: block.pp() # pretty-print a disassembly to stdout

#### States

```python
#When you’re performing execution with Angr, you are working with a specific object representing a simulated program state - a SimState. 
In [15]: state = proj.factory.entry_state()
In [17]: state.regs.rax
Out[17]: <BV64 0x1c>
In [18]: state.mem[proj.entry].int.resolved # note these are bitvectors, not actual integers. 
Out[18]: <BV32 0x8949ed31> # Use resolved for bitvector and concrete for python int
```

#### Note

```python
In [19]: state.regs.rdi
Out[19]: <BV64 reg_rdi_0_64{UNINITIALIZED}>
#Doesn't contain a numerical value. Instead, it has a name! This is called a symbolic variable and it is the underpinning of symbolic execution
```

#### Simulation Manager

Let’s us get to the next point in a simulated program.
 the primary interface in angr for performing execution, simulation, whatever you want to call it, with states.

```python
In [20]: simgr = proj.factory.simulation_manager(state)

In [21]: simgr.active
Out[21]: [<SimState @ 0x400580>]

#A simulation manager can contain several stashes of states. The default stash, active, is initialized with the state we passed in. We could look at simgr.active[0] to look at our state some more, if we haven't had enough!
```

#### Analyses

```python
proj.analyses.{tab} # in ipython
proj.analyses.CFGFast() # Control Flow Graph
```

## ANGR INTRO end

```python
# Ipython trick - save current session
%save my_useful_session 10-20 23 to save input lines 10 to 20 and 23 to my_useful_session.py
#src: https://stackoverflow.com/questions/947810/how-to-save-a-python-interactive-session
```
