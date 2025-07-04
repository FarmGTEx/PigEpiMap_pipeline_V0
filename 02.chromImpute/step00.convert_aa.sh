#!/bin/bash
#DSUB -n step00_aa
#DSUB -A root.kkbkvxu5
#DSUB -R cpu=4;mem=24240
#DSUB -eo log/step00_aa_%J.err
#DSUB -oo log/step00_aa_%J.log

impute=/home/share/kkbkvxu5/home/jingjinli/00.soft/ChromImpute/ChromImpute.jar
gsize=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/chrsize_no_chr0_chrY.tsv

base=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute

input_dir=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/00.data/all_together_for_whsc
convert_dir=${base}/CONVERTEDDATADIR
distance_dir=${base}/DISTANCEDIR
predictor_dir=${base}/PREDICTORDIR
output_dir=${base}/OUTPUTDATA
samplemarktable=${base}/test_samplemarktable_all.txt
test_marktable=${base}/test_samplemarktable.txt

sta_dir=STATISTICSDIR

#/home/share/huaznydxue/home/jingjli/02prject/01.epimap/02.impute

java -mx6000M -jar ${impute} Convert ${input_dir} split_sample_aa.txt \
 ${gsize} ${convert_dir}
