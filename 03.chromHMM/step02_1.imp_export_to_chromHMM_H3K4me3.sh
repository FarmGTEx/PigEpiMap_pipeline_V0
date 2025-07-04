#!/bin/bash
#DSUB -n step02_imp_binarize_H3K4me3
#DSUB -A root.kkbkvxu5
#DSUB -R cpu=1;mem=6000
#DSUB -eo tmp/step02_imp_binarize_H3K4me3_%J.err
#DSUB -oo tmp/step02_imp_binarize_H3K4me3_%J.log

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

mark=H3K4me3

java -mx6000M -jar ${impute} ExportToChromHMM -g 2.2538 ${output_dir} imp_sampleInfo_${mark}.txt \
 ${gsize} imp_binarize_${mark}

