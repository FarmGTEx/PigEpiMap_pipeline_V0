#!/bin/bash
#DSUB -n step03_n200_s12
#DSUB -A root.kkbkvxu5
#DSUB -R cpu=120;mem=230000
#DSUB -eo log/step03_n200_s12_%J.err
#DSUB -oo log/step03_n200_s12_%J.log

impute=/home/share/kkbkvxu5/home/jingjinli/00.soft/ChromImpute/ChromImpute.jar
gsize=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/chrsize_no_chr0_chrY.tsv
HMM=/home/share/kkbkvxu5/home/jingjinli/00.soft/ChromHMM/ChromHMM.jar

base=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute

input_dir=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/00.data/all_together_for_whsc

genetable=sus11_ensembl_genePred.filtered

# when we test learn model, we will not use gsize containing chr1
#java -mx160000M -jar ${HMM} LearnModel -l ${gsize} -p 100 -n 200 -printposterior -d -1 all_for_chromHMMlearnModel \
# chromHMM_model_n200_s15 15 susScr11

java -mx230000M -jar ${HMM} LearnModel -l ${gsize} -p 120 -n 200 -printposterior -d -1 all_for_chromHMMlearnModel \
 chromHMM_model_n200_s12 12 susScr11
