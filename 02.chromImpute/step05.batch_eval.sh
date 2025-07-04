#!/bin/bash
#DSUB -n step01_distace
#DSUB -q root.default
#DSUB -R cpu=4;mem=24240
#DSUB -e log/step01_distance.err
#DSUB -o log/step01_distance.log

impute=/home/share/huaznydxue/home/jingjli/01software/ChromImpute/ChromImpute.jar
gsize=/home/huaznydxue/whcs-share03/ljj/01.projects/01.epimap/01.impute/chrsize_no_chr0_chrY.tsv

base=/home/huaznydxue/whcs-share03/ljj/01.projects/01.epimap/01.impute

convert_dir=${base}/CONVERTEDDATADIR
distance_dir=${base}/DISTANCEDIR
predictor_dir=${base}/PREDICTORDIR
output_dir=${base}/OUTPUTDATA
samplemarktable=${base}/test_samplemarktable_all.txt
test_marktable=${base}/test_samplemarktable.txt

sta_dir=STATISTICSDIR

#/home/share/huaznydxue/home/jingjli/02prject/01.epimap/02.impute


if [ ! -d STATISTICSDIR  ];then
mkdir STATISTICSDIR
else
  echo "already exists"
fi

for j in `awk -F"[\t_.]" '{OFS="_"}{print $3, $4, $5}' test_samplemarktable_all.txt`
do
java -mx6000M -jar ${impute} Eval -o ${sta_dir}/STA.${j} ${convert_dir} ${j}.bedGraph.gz.wig.gz \
 ${output_dir} impute_${j#*_}.wig.gz ${gsize}
done
