#!/bin/bash
#SBATCH--job-name=ash_script
#SBATCH--output=ash.out
#SBATCH--error=ash.err
#SBATCH--time=1:00:00

OUTPUT_FILE="/home/caichoj/BioEWeek_5/output_Prodigal.fna"


RESULTS_FILE="/home/caichoj/BioEWeek_5/prodigal_results.txt"

ALL_COUNTS_FILE="/home/caichoj/BioEWeek_5/all_genome_counts_prodigal.txt"

MAX_GENES=0
MAX_GENOME=""

for genome in $(find /home/caichoj/ncbi_dataset  -type f -name "*GCF*.fna"); do

    prodigal -i "$genome" -d "$OUTPUT_FILE"
    gene_count=$(grep ">" -c "$OUTPUT_FILE")
    echo "$genome: $gene_count" >> "$ALL_COUNTS_FILE"

    if [ "$gene_count" -gt "$MAX_GENES" ]; then
        MAX_GENES=$gene_count
        MAX_GENOME=$genome
    fi
done

result="Genome with the highest number of genes:
File: $MAX_GENOME
Number of genes: $MAX_GENES"

echo "$result"

echo "$result" > "$RESULTS_FILE"

rm "$OUTPUT_FILE"
