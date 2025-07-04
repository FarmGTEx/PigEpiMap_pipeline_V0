#!/bin/bash
#DSUB -n step10_2_parse
#DSUB -A root.kkbkvxu5
#DSUB -R cpu=2;mem=30000
#DSUB -eo log/step10_2_parse_%J.err
#DSUB -oo log/step10_2_parse_%J.log

source /home/HPCBase/tools/module-5.2.0/init/profile.sh
module use /home/HPCBase/modulefiles/
module load tools/anaconda3/2022.10

source /home/HPCBase/tools/anaconda3/etc/profile.d/conda.sh

conda activate ljj_common

impute=/home/share/kkbkvxu5/home/jingjinli/00.soft/ChromImpute/ChromImpute.jar
gsize=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/chrsize_no_chr0_chrY.tsv
HMM=/home/share/kkbkvxu5/home/jingjinli/00.soft/ChromHMM/ChromHMM.jar

parser=/home/share/kkbkvxu5/home/jingjinli/00.soft/SAGAconf/SAGAconf_parser.py

cwd=/home/kkbkvxu5/whcs-share36/01.work/01.epimap/01.chromHMM_test/chromHMM_model_n200_s12
base=${cwd}/base
verify=${cwd}/verif

# evenly separate files for base and verify
python step10_1.separate_posterior_files_softlink.py 12


