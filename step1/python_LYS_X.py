#!/usr/bin/env python

import os

mylist= ["ALA", "GLY", "LEU"]

counter=-1

for i in mylist:

    chunk="LYS "+ i + " "
    for chunk_num in range(6,15):
    
        f = open("peptide" + str(chunk_num)+ i +".txt", "w")
        f.write("source leaprc.protein.ff14SB \n")
        seq = chunk*chunk_num
        f.write("foo = sequence { " + seq + "}")
        total_num = chunk_num*2 #total num of amino acids is num of chunks*length of chunk
        for j in range(total_num):
            if(j%2==1):
                f.write("\nselect foo."+str(j)+".CA")
        counter+=1
        f.write("\nflip foo\nsavepdb foo peptide"+str(chunk_num)+ i +".pdb\nquit")
        f.close()
        
