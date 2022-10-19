#!/bin/sh 
package require Tk 
package require solvate
package require autoionize


#process argv. $1=file_name; $2=path_name
set i 0; foreach n $argv {set [incr i] $n}

solvate $2$1.psf $2$1.pdb -t 10 -o $1"_wb"
#autoionize -psf $1"_wb".psf -pdb $1"_wb".pdb -neutralize

quit
