# get the directory where this script resides
set thisDir [file dirname [info script]]
# source common utilities
source -notrace $thisDir/utils.tcl

# Set prj to project name and vsn to version number
set prj ""
set vsn ""

# filepaths for bit and mcs
set bit_dir [file join . ${prj}.bit]
set mcs_dir [file join .. image ${prj}_v$vsn]

# open the project
open_project [file join . ${prj} ${prj}.xpr]

# Implement and write_bitstream
launch_runs impl_1 
wait_on_run impl_1
open_run impl_1

# The following 2 lines are required when block IP is used
# write_hwdef -file Corellian_Link_Top.hwdef
# write_sysdef -bitfile Corellian_Link_Top.bit -hwdef Corellian_Link_Top.hwdef -file Corellian_Link_Top.sysdef

write_bitstream ${prj}.bit

# Create an MCS file (overwrite any previous file)
# Flash size = 16 Mb, SPI buswidth = 2
write_cfgmem -force \
-format mcs -size 16 -interface SPIx2 \
-loadbit "up 0x00000000 ${bit_dir}" \
-file $mcs_dir

# If successful, "touch" a file so the make utility will know it's done 
touch {.compile.done}
