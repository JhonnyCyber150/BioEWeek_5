#!/bin/bash
#SBATCH--job-name=ash_script
#SBATCH--output=ash_prokka.out
#SBATCH--error=ash_prokka.err
#SBATCH--time=1:00:00

# Create output directory if it doesn't exist
mkdir -p prokka_output

# Clear the previous cds_counts.txt file
> prokka_output/CDS_counts.txt

# Loop through all .fna files in the specified directory and subdirectories
find /home/caichoj/ncbi_dataset/data/ -name "GCA*.fna" | while read fna_file; do

    base_name=$(basename "$fna_file" .fna)

    # Run Prokka for each .fna file
    echo "Annotating $fna_file with Prokka..."
    prokka --outdir "prokka_output/$base_name" --prefix "$base_name" "$fna_file"

    # After annotation, count CDS from the .gff file
    gff_file="prokka_output/$base_name/$base_name.gff"
    if [[ -f "$gff_file" ]]; then
        # Count the number of CDS in the .gff file and append to cds_counts.txt
        num_cds=$(grep -c "CDS" "$gff_file")
        echo "$base_name: $num_cds CDS" >> prokka_output/cds_counts2.txt
    else
        echo "$base_name: No GFF file found" >> prokka_output/cds_counts.txt
    fi
done

echo "Annotation complete. CDS counts saved to prokka_output/cds_counts.txt."
