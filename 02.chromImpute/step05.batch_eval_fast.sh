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

if [ ! -d STATISTICSDIR  ];then
mkdir STATISTICSDIR
else
  echo "already exists"
fi

for j in `awk -F"[\t_.]" '{OFS="_"}{print $3, $4, $5}' test_samplemarktable_all.txt`
do
echo "java -mx6000M -jar ${impute} Eval -o ${sta_dir}/STA.${j} ${convert_dir} ${j}.bedGraph.gz.wig.gz ${output_dir} impute_${j#*_}.wig.gz ${gsize}"
    xsub -N step05_${j} \
        -q root.default \
        -n 1 \
        -m 6000 \
        -o ${base}/log \
        "java -mx6000M -jar ${impute} Eval -o ${sta_dir}/STA.${j} ${convert_dir} ${j}.bedGraph.gz.wig.gz ${output_dir} impute_${j#*_}.wig.gz ${gsize}"
        sleep 0.5
done
