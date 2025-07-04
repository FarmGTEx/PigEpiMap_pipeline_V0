#!/bin/bash
#DSUB -n step07_merge_test
#DSUB -A root.kkbkvxu5
#DSUB -R cpu=1;mem=5000
#DSUB -eo log/step07_merge_test_ljj_%J.err
#DSUB -oo log/step07_merge_test_ljj_%J.log

source /home/HPCBase/tools/module-5.2.0/init/profile.sh
module use /home/HPCBase/modulefiles/
module load tools/anaconda3/2022.10

source /home/HPCBase/tools/anaconda3/etc/profile.d/conda.sh

conda activate ljj_common

for i in P348Cerebellum_H3K27ac Sample9PRJNA883228LongissimusDorsiMuscle_H3K4me3 Sample9PRJNA733023MAD_H3K4me1
do python step07.merge_chr_ljj.py ${i}
done
