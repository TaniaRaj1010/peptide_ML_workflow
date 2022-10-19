#!/bin/bash
python ../tleap_input/tleap_input_generator.py
conda activate AmberTools22

for ((i=4; i<=120; i+=4))
do
	tleap -f peptide$i.txt
done

conda deactivate

mkdir pdb_files
mv *.pdb pdb_files
rm *.txt


