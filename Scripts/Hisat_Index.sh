#!/bin/bash
##
## Lines starting with #SBATCH are read by Slurm. Lines starting with ## are comments.
## All other lines are read by the shell.
##
## Basic parameters
##
#SBATCH --account=priority-jenniferlachowiec      # specify the account to use if using a priority partition
#SBATCH --partition=priority                # queue partition to run the job in
#SBATCH --cpus-per-task=2               # number of cores to allocate
#SBATCH --mem=200G                        # ammount of Memory allocated
#SBATCH --time=0-06:00:00               # maximum job run time in days-hours:minutes:secconds
#SBATCH --job-name=fastqc              # job name
#SBATCH --output=example-%j.out         # standard output from job
#SBATCH --error=example-%j.err          # standard error from job
#SBATCH --mail-user=brodysturgis@gmail.com      # enter your email to recieve email notifications
#SBATCH --mail-type=ALL                 # specify conditions on which to recieve emails
##
## Optional parameters - remove one leading hashtag to enable
##
#SBATCH --nodes=1                      # number of nodes to allocate for multinode job
#SBATCH --ntasks-per-node=1            # number of descrete tasks to allocate for MPI job
#SBATCH --array=1-3                    # number of jobs in array for job array

## Run 'man sbatch' for more information on the options above.
## Below, enter commands needed to execute your workload
# Example for basic test
#date                                    # print out the date
#hostname -s                             # print a message from the compute node
#date                                    # print the date again

# Example for running a python script
#module load Python/3.8.0
#python $HOME/my_script.py
source ~/.bashrc
module load Anaconda3/2022.05
conda activate brody
hisat2-build --ss /home/group/jenniferlachowiec/2023/202302_csativa_flowers/data/reference/camelina_splices --exon /home/group/jenniferlachowiec/2023/202302_csativa_flowers/data/reference/camelina_exons /home/group/jenniferlachowiec/2023/202302_csativa_flowers/data/reference/Camelina_sativa.Cs.dna.toplevel.fa /home/group/jenniferlachowiec/2023/202302_csativa_flowers/data/reference/camelina_index