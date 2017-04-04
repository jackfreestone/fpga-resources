# these are the sources - everything depends upon them
RTL=../source/hdl/Top.vhd ../source/hdl/Module.vhd
XDC=../source/constraint/Timing.xdc ../source/constraint/Physical.xdc

# These are all the compilation targets, starting with "all"
all : setup compile

# This setups up the top level project
setup : .setup.done
.setup.done : $(RTL) $(XDC)
	cmd /c "vivado -mode batch -source ../scripts/setup.tcl -log setup.log -jou setup.jou"

compile : .compile.done
.compile.done : .setup.done
	cmd /c "vivado -mode batch -source ../scripts/compile.tcl -log compile.log -jou compile.jou"
  
sim : .sim.done
.sim.done : .setup.done $(RTL)
	cmd /c "vivado -mode batch -source ../scripts/sim.tcl -log sim.log -jou sim.jou"

# delete everything except this Makefile
clean :	
	find . -not -name "Makefile*" -not -name "." | xargs rm -rf
