# BioEWeek_5

## Problem 1
### Amino Acid Sequence Count
Create a python code to count 
```bash
nano amino_count.py
```
Run in the terminal 

```bash
python amino_count.py

OUTPUT

Number of amino acids: 30
Number of bases in the open reading frame: 93
```


## Problem 2
### Runprodigal on one of the genomes you have previously downloaded (ecoli.fna)

Copy the ecoli file from root terminal
```bash
cp ../ecoli.fna .
```

```bash
module load prodigal
prodigal -i ecoli.fna -o ecoli.gbk -d ecoli_genes.fna
grep ">" ecoli_genes.fna -c > gene_count.txt
````

OUTPUT: 4161

Value in the gene_count.txt

## Problem 3
### Run prodigal on all of the genomes creating a .sh script

Create a .sh file and code 

```bash
touch Prodigal_Problem3.sh
nano Prodigal_Problem3.sh
```
Make executable and run it 
```bash
chmod +x Prodigal_Problem3.sh
sbatch Prodigal_Problem3.sh
```
OUTPUT: prodigal_results.txt

A file that contains the sequence the genome with the highest number of genes



## Problem 4
### Annotate all genomes using prokka instead of prodigal.

```bash


```

## Problem 5


## Problem 6
