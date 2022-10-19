#!/usr/bin/env python

chunk="LYS ALA LYS ALA "
chunk_size = 4

for chunk_num in range(30):

    outFile = open("peptide"+str((chunk_num+1)*chunk_size)+".txt","w")
    
    outFile.write("source leaprc.protein.ff14SB \n")

    seq = chunk*(chunk_num+1)
    
    outFile.write("peptide = sequence { " + seq + "}")

    total_num = (chunk_num+1)*chunk_size #total num of amino acids 
    
    for j in range(total_num):
        if(j%2==1):
            outFile.write("\nselect peptide."+str(j)+".CA")
    
    outFile.write("\nflip peptide\nsavepdb peptide peptide"+str((chunk_num+1)*chunk_size)+".pdb\nquit")
    
    outFile.close()
    






