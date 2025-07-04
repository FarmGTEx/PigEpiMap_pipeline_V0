#!/bin/bash
#DSUB -n step03_1_geneTable
#DSUB -A root.kkbkvxu5
#DSUB -R cpu=1;mem=5000
#DSUB -eo tmp/step03_1_geneTable_%J.err
#DSUB -oo tmp/step03_1_geneTable_%J.log

impute=/home/share/kkbkvxu5/home/jingjinli/00.soft/ChromImpute/ChromImpute.jar
gsize=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/chrsize_no_chr0_chrY.tsv
HMM=/home/share/kkbkvxu5/home/jingjinli/00.soft/ChromHMM/ChromHMM.jar

base=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute

input_dir=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/00.data/all_together_for_whsc

genetable=sus11_ensembl_genePred.filtered

java -mx5000M -jar ${HMM} ConvertGeneTable -l ${gsize} ${genetable} RefSeq susScr11

# when we test learn model, we will not use gsize containing chr1
#java -mx6000M -jar ${HMM} LearnModel -p 20 chromHMM_poisson_ownCutoff ${output_dir} 15 susScr11
