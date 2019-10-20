# coding: utf-8
import angr
import monkeyhex
proj = angr.Project('fauxware')
proj.arch
proj.entry
proj.filename
p.loader.main_object.execstack
proj.loader.main_object.execstack
proj.loader.main_object.all_symbols
proj.loader.main_object.pic
block = proj.factory.block(proj.entry)
block.pp()
block.instructions
block.instruction_addrs
state = proj.factory.entry_state()
state.regs.rip
state.regs.rax
state.mem[proj.entry].int.resolved
state.regs.rdi
simgr = proj.factory.simulation_manager(state)
simgr.active
simgr.step()
simgr.active
simgr.active[0].regs.rip
state.regs.rip
# Note: state.regs.rip is still the same while the simgr.`` is new!
get_ipython().magic(u'save angrlearningsession 1-27')
