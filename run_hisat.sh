#!/bin/bash
#SBATCH -p main                # Specify partition (queue) to submit to (change as needed)
#SBATCH -n 4                   # Request 4 CPU cores
#SBATCH --mem=32G              # Request 32GB of memory
#SBATCH -t 12:00:00            # Request 48 hours of wall time (adjust as needed)
#SBATCH -J hisat2_build        # Job name for easier identification
#SBATCH -o hisat2_build_%j.out # Standard output log file
#SBATCH -e hisat2_build_%j.err # Standard error log file

# Įkelk conda aplinką
source ~/miniconda3/etc/profile.d/conda.sh
conda activate bioinfo  # <- naudok savo aplinkos pavadinimą

# Load necessary modules if any (e.g., if hisat2 or samtools needs to be loaded)
# module load hisat2
# module load samtools

# Define the paths to the reference genome and index
REFERENCE_GENOME="bioinfo2025/genome/GRCm38.p5.fa"
OUTPUT_INDEX="bioinfo2025/genome/index"

# Run hisat2-build to build the index
hisat2-build $REFERENCE_GENOME $OUTPUT_INDEX
