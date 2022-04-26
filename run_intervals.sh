#!/bin/bash
#SBATCH -J sm
#SBATCH -o out
#SBATCH -e err
#SBATCH --nodes=1                # node count
#SBATCH --ntasks=1               # total number of tasks across all nodes
#SBATCH --cpus-per-task=1        # cpu-cores per task (>1 if multi-threaded tasks)
#SBATCH --mem-per-cpu=8G         # memory per cpu-core (4G is default)
#SBATCH --time 0-03:00:00        # DAYS-HOURS:MINUTES:SECONDS


source activate snakemake
snakemake --snakefile Snakefile_intervals \
--profile ./profiles/slurm \
--conda-prefix /home/bjarnold/miniconda3/envs

snakemake --snakefile Snakefile_bam2vcf_gatk --profile ./profiles/slurm --dryrun --conda-prefix /home/bjarnold/miniconda3/envs > bam2vcf_gatk_dryrun.txt
snakemake --snakefile Snakefile_bam2vcf_fb --profile ./profiles/slurm --dryrun --conda-prefix /home/bjarnold/miniconda3/envs > bam2vcf_fb_dryrun.txt
