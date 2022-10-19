#!/bin/bash

amino_acids=("ALA" "GLY" "LEU")

for str in ${amino_acids[@]}
do
	for i in {6..14}
	do
		file_name=peptide$i$str
		path_name="pdb_files/"
		
		vmd -dispdev text -e solvate.tcl -args $file_name $path_name
		echo exit
	done
done





