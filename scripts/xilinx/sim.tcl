# get the directory where this script resides
set thisDir [file dirname [info script]]
# source common utilities
source -notrace $thisDir/utils.tcl

# Set prj to project name
set prj ""

# Create project
open_project [file join . ${prj} ${prj}.xpr]

# "touch" a file so the make utility will know it's done
# done before launch as running through GUI
touch {.sim.done}

# This script launches Vivado Simulator
launch_simulation
start_gui
