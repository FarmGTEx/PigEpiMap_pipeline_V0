#!/bin/bash
#DSUB -n step10
#DSUB -A root.kkbkvxu5
#DSUB -R cpu=1;mem=5000
#DSUB -eo log/step10_%J.err
#DSUB -oo log/step10_%J.log

source /home/HPCBase/tools/module-5.2.0/init/profile.sh
module use /home/HPCBase/modulefiles/
module load tools/anaconda3/2022.10

source /home/HPCBase/tools/anaconda3/etc/profile.d/conda.sh

conda activate ljj_common

python step10.only_soft_link_target_imp.py
