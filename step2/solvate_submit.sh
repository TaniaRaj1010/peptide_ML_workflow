#!/bin/bash

for i in {1..3}
do
	file_name=peptide$(($i*4))
	path_name="pdb_files/"
	
	vmd -dispdev text -e solvate.tcl -args $file_name $path_name
	echo exit
done






