#!/bin/bash

#Call python script to generate tleap input txt files
python python_LYS_X.py

#Generate PDB files for each TXT file using tleap
conda activate AmberTools22
amino_acids=("ALA" "GLY" "LEU")
for str in ${amino_acids[@]}
do
	for ((i=6; i<=14; i+=1))
	do
		tleap -f peptide$i$str.txt
	done
done

conda deactivate

mkdir pdb_files
mv *.pdb pdb_files
rm *.txt


