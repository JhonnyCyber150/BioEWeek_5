aa_sequence = "KVRMFTSELDIMLSVNG-PADQIKYFCRHWT*"

# Remove the gap '-' from the sequence
aa_sequence_no_gap = aa_sequence.replace("-", "")

# Count the number of amino acids (excluding stop codon)
num_amino_acids = len(aa_sequence_no_gap) - 1  # -1 to exclude stop codon

# Calculate the number of bases in the open reading frame
num_bases = (num_amino_acids + 1) * 3  # +1 to include stop codon

print(f"Number of amino acids: {num_amino_acids}")
print(f"Number of bases in the open reading frame: {num_bases}")

# Output
# Number of amino acids: 30
# Number of bases in the open reading frame: 93
