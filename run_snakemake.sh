#!/bin/bash
#SBATCH -p main               # Queue (partition) name
#SBATCH -n 24                  # Number of CPU cores
#SBATCH -t 24:00:00           # Wall time (24 hours)
#SBATCH --mem=48G             # Memory (16 GB)
#SBATCH -o slurm-%j.out       # Standard output log
#SBATCH -e slurm-%j.err       # Standard error log

# Inicializuojam bash aplinką
source ~/.bashrc
conda activate snakemake

# Atrakinti darbus, jei buvo nutraukti
snakemake --unlock -s snakesnake

# Paleisti Snakemake su 4 branduoliais ir pakartoti nepilnus darbus
snakemake -s snakesnake --cores 24 --use-conda --conda-frontend conda --latency-wait 300 --rerun-incomplete --keep-going
