#!/bin/bash
#
#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 0-0:15
#SBATCH --mem 1000
#SBATCH -J sum_series
#SBATCH -o sum_series_%j.out
#SBATCH -e sum_series_%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=robertfreeman@g.harvard.edu

source new-modules.sh
module load matlab

matlab -nojvm -nodisplay -nosplash -r "sum_series(2,10)"
