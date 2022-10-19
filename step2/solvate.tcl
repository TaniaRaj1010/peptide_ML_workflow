#!/bin/sh 

package require Tk 
package require solvate
package require autoionize
package require psfgen

#process argv. $1=file_name; $2=path_name
set i 0; foreach n $argv {set [incr i] $n}
set suffix "_wb"
set suffix2 "_ionized"

#GENERATE PSF FOR EACH PDB
resetpsf
topology par_all36m_prot.prm
topology top_all36_prot.rtf
topology toppar_all36_prot_c36m_d_aminoacids.str
pdbalias residue LYS DLYS

segment U {pdb $2$1.pdb}
coordpdb $2$1.pdb U
guesscoord
writepdb $1.pdb
writepsf $1.psf

solvate $1.psf $1.pdb -t 10 -o $1${suffix}
autoionize -psf $1${suffix}.psf -pdb $1${suffix}.pdb -neutralize -o $1${suffix}${suffix2}

quit
