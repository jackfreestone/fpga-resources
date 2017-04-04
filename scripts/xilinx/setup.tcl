# get the directory where this script resides
set thisDir [file dirname [info script]]

# set variable to the project name
set prj ""

# set target device
set fpga ""

# set to design and testbench top modules
set rtl_top ""
set tb_top ""

# source common utilities
source -notrace $thisDir/utils.tcl

# set directories for sources
set hdlRoot ../source/hdl
set tbRoot  ../source/testbench
set xdcRoot ../source/constraint

# Create project and set fpga part
create_project -force $prj [file join . ${prj}] -part $fpga

# Set project properties
set obj [get_projects $prj]
set_property "simulator_language" "Mixed" $obj
set_property "target_language" "VHDL" $obj

# add design sources
add_files -norecurse $hdlRoot/${rtl_top}.vhd
add_files -norecurse $hdlRoot/Module.vhd

# add design constraints
add_files -norecurse $xdcRoot/Timing.xdc
add_files -norecurse $xdcRoot/Physical.xdc

update_compile_order -fileset sources_1
set_property SOURCE_SET sources_1 [get_filesets sim_1]

# add the testbench
add_files -fileset sim_1 -norecurse $tbRoot/${tb_top}.vhd
update_compile_order -fileset sim_1

# Set the top level for design and testbench
set_property top ${rtl_top} [get_filesets sources_1]
set_property top ${tb_top} [get_filesets sim_1]

# If successful, "touch" a file so the make utility will know it's done 
touch {.setup.done}
