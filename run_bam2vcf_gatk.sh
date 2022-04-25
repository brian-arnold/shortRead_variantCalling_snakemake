#!/bin/bash
#SBATCH -J sm
#SBATCH -o out
#SBATCH -e err
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=4G         # memory per cpu-core (4G is default)
#SBATCH --time 5-23:59:00        # DAYS-HOURS:MINUTES:SECONDS

source /home/bjarnold/miniconda3/etc/profile.d/conda.sh
source activate snakemake
snakemake --snakefile Snakefile_bam2vcf_gatk --profile ./profiles/slurm

