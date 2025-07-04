#!/bin/bash
#DSUB -n step09
#DSUB -A root.kkbkvxu5
#DSUB -R cpu=2;mem=50000
#DSUB -eo log/step09_%J.err
#DSUB -oo log/step09_%J.log

source /home/HPCBase/tools/module-5.2.0/init/profile.sh
module use /home/HPCBase/modulefiles/
module load tools/anaconda3/2022.10

source /home/HPCBase/tools/anaconda3/etc/profile.d/conda.sh

conda activate ljj_common

#python step09.soft_link_high_quality_obs.py

python step09_2.merge_single_chr_obs.py
