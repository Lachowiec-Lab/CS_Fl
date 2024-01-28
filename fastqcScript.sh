#!/bin/bash
##
## Lines starting with #SBATCH are read by Slurm. Lines starting with ## are comments.
## All other lines are read by the shell.
##
## Basic parameters
##
#SBATCH --account=priority-jenniferlachowiec      # specify the account to use if using a priority partition
#SBATCH --partition=priority                # queue partition to run the job in
#SBATCH --cpus-per-task=10               # number of cores to allocate
#SBATCH --mem=10G                        # ammount of Memory allocated
#SBATCH --time=0-06:00:00               # maximum job run time in days-hours:minutes:secconds
#SBATCH --job-name=fastqc              # job name
#SBATCH --output=example-%j.out         # standard output from job
#SBATCH --error=example-%j.err          # standard error from job
#SBATCH --mail-user=brodysturgis@gmail.com      # enter your email to recieve email notifications
#SBATCH --mail-type=ALL                 # specify conditions on which to recieve emails

fastqc -t 10 -o /home/group/jenniferlachowiec/2023/202302_csativa_flowers/results /home/group/jenniferlachowiec/2023/202302_csativa_flowers/data/raw_rnaseq/*.fastq.gz
