@echo off
rem
rem  Sets up the Allegro package for building with Watcom, generating the
rem  makefile.inc stub and converting text files from LF to CR/LF format.
rem

echo Converting Allegro files to DOS (Watcom) format...

echo # generated by fixwat.bat > makefile
echo MAKEFILE_INC = makefile.wat >> makefile
echo include makefile.all >> makefile

echo /* generated by fixwat.bat */ > include\allegro\alplatf.h
echo #define ALLEGRO_WATCOM >> include\allegro\alplatf.h

utod *.bat .../*.c *.cfg .../*.h .../*.inc
utod .../*.s .../*.txt .../*._tx makefile.* readme.*

echo Done!
