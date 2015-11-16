#!/bin/bash
#
#SBATCH -p serial_requeue
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -t 0-0:15
#SBATCH --mem 1000
#SBATCH -J means_from_file
#SBATCH -o means_from_file_%j.out
#SBATCH -e means_from_file%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=robertfreeman@g.harvard.edu


source new-modules.sh
module load matlab

matlab -nojvm -nodisplay -nosplash -r "means_from_file('$1')"
