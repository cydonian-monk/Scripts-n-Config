#!/bin/bash
# Display the current ACPI battery state. Used by inittab.
#
# Authors: AWC - Andy W. Cummings <cydonian.monk@gmail.com>
# Revision History:
#      2012/04/12 AWC Initial github copy.

cat /proc/acpi/battery/BAT1/state

