#!/bin/bash
#DSUB -n step02_6_mergeMark
#DSUB -A root.kkbkvxu5
#DSUB -R cpu=2;mem=80000
#DSUB -eo tmp/step02_6_mergeMark_%J.err
#DSUB -oo tmp/step02_6_mergeMark_%J.log

source /home/HPCBase/tools/module-5.2.0/init/profile.sh
module use /home/HPCBase/modulefiles/
module load tools/anaconda3/2022.10

source /home/HPCBase/tools/anaconda3/etc/profile.d/conda.sh

conda activate ljj_common

obs_path=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/CONVERTEDDATADIR
imp_path=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/OUTPUTDATA

#python step02_4.soft_link_all.py

python step02_5.merge_mark_into_one_file.py
