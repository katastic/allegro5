#! /bin/sh
#
#  Sets up the Allegro package for building under Unix, converting text
#  files from CR/LF to LF format.


echo "Converting Allegro files to Unix format..."

echo "/* generated by fixunix.sh */" > include/allegro/alplatf.h
echo "#define ALLEGRO_UNIX" >> include/allegro/alplatf.h

find . -type f "(" \
   -name "*.c" -o -name "*.cfg" -o -name "*.cpp" -o -name "*.dep" -o \
   -name "*.h" -o -name "*.hin" -o -name "*.in" -o -name "*.inc" -o \
   -name "*.m4" -o -name "*.mft" -o -name "*.s" -o -name "*.sh" -o \
   -name "*.spec" -o -name "*.pl" -o -name "*.txt" -o -name "*._tx" -o \
   -name "makefile.*" -o -name "readme.*" \
   ")" \
   -exec sh -c "echo {};
		mv {} _tmpfile;
		tr -d \\\r < _tmpfile > {};
		touch -r _tmpfile {}; 
		rm _tmpfile" \;

chmod +x configure *.sh misc/*.sh misc/*.pl

echo "Done!"
echo
echo "Now run the configure script."
