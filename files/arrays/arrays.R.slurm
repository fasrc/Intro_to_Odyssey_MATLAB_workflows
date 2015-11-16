#!/bin/bash
#
#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 0-0:15
#SBATCH --mem 1000
#SBATCH -J process_file_in_array
#SBATCH -o process_file_in_array_%A_%a.out
#SBATCH -e process_file_in_array_%A_%a.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=robertfreeman@g.harvard.edu

# filename will come in as parameters (== $1)
# job slot # will be created by bash ($SLURM_ARRAY_TASK_ID)

source new-modules.sh
module load matlab

# pause an amount of time, picked radomly
#  from 1 to our job slot number
sleep $(( ( RANDOM % $SLURM_ARRAY_TASK_ID )  + 1 ))

# so tell our MATLAB code what file to choose and what line to keep
matlab -nojvm -nodisplay -nosplash -r "process_file_in_array(\"$1, $SLURM_ARRAY_TASK_ID\"); exit"

