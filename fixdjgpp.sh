#!/bin/sh
#  allegro/fixdjgpp.sh
#
#  Bash script to fix up Allegro for DJGPP compilation after downloading
#  from CVS or whatever.
#

# First, evaluate if we need to run the `utod' utility.

if ! [ $UNIX_FILES ]
then
  echo "Converting Allegro files to DOS (djgpp) format..."
  utod *.bat */*.c */*/*.c *.cfg */*.h */*/*.h */*/*.inc
  utod */*/*.s *.txt */*.txt */*/*.txt */*._tx makefile.* readme.*
fi

# Now, generate makefile.inc

echo "# generated by fixdjgpp.sh" > makefile

# Evaluate any options

if [ $CROSSCOMPILE ]
then
  echo "CROSSCOMPILE := 1" >> makefile
fi
if [ $WARNMODE ]
then
  echo "WARNMODE := 1" >> makefile
fi
if [ $PENTIUM_ONLY ]
then
  echo "PENTIUM_ONLY := 1" >> makefile
fi
if [ $I686_ONLY ]
then
  echo "I686_ONLY := 1" >> makefile
fi
if [ $UNIX_TOOLS ]
then
  echo "UNIX_TOOLS := 1" >> makefile
fi

# finish makefile.inc

echo "MAKEFILE_INC = makefile.dj" >> makefile
echo "include makefile.all" >> makefile

echo "/* generated by fixdjgpp.sh */" > include/allegro/alplatf.h
echo "#define ALLEGRO_DJGPP" >> include/allegro/alplatf.h

# End allegro/fixdjgpp.sh

