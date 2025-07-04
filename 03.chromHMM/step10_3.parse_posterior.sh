#!/bin/bash
#DSUB -n step10_3_parse
#DSUB -A root.kkbkvxu5
#DSUB -R cpu=2;mem=30000
#DSUB -eo log/step10_3_parse_%J.err
#DSUB -oo log/step10_3_parse_%J.log

source /home/HPCBase/tools/module-5.2.0/init/profile.sh
module use /home/HPCBase/modulefiles/
module load tools/anaconda3/2022.10

source /home/HPCBase/tools/anaconda3/etc/profile.d/conda.sh

conda activate ljj_common

impute=/home/share/kkbkvxu5/home/jingjinli/00.soft/ChromImpute/ChromImpute.jar
gsize=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/chrsize_no_chr0_chrY.tsv
HMM=/home/share/kkbkvxu5/home/jingjinli/00.soft/ChromHMM/ChromHMM.jar

parser=/home/share/kkbkvxu5/home/jingjinli/00.soft/SAGAconf/SAGAconf_parser.py
SAGAconf=/home/share/kkbkvxu5/home/jingjinli/00.soft/SAGAconf/SAGAconf.py

# evenly separate files for base and verify
#python step10_1.separate_posterior_files_softlink.py 12

# this is just a test, we will use step10_4.batch_parse_posterior.sh for batch dsub to the system!!!!!!!!!!!!!!
for i in Lung
#do python ${parser} --saga chmm chromHMM_model_n200_s12/base_${i} 200 chromHMM_model_n200_s12/base_${i}
#python ${parser} --saga chmm chromHMM_model_n200_s12/verif_${i} 200 chromHMM_model_n200_s12/verif_${i}
do python ${SAGAconf} chromHMM_model_n200_s12/base_${i}/parsed_posterior.bed \
 chromHMM_model_n200_s12/verif_${i}/parsed_posterior.bed chromHMM_model_n200_s12/sagaconf_${i}
done
