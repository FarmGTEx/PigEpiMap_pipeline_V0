impute=/home/share/kkbkvxu5/home/jingjinli/00.soft/ChromImpute/ChromImpute.jar
gsize=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/chrsize_no_chr0_chrY.tsv

base=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute

input_dir=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/00.data/all_together_for_whsc
convert_dir=${base}/CONVERTEDDATADIR
distance_dir=${base}/DISTANCEDIR
train_dir=${base}/TRAINDATA
predictor_dir=${base}/PREDICTORDIR
output_dir=${base}/OUTPUTDATA
samplemarktable=${base}/test_samplemarktable_all.txt
test_marktable=${base}/test_samplemarktable.txt

sta_dir=STATISTICSDIR

#/home/share/huaznydxue/home/jingjli/02prject/01.epimap/02.impute

for mark in H3K4me1 H3K4me3 H3K27me3 H3K27ac ATAC
do
for chr in `seq 1 18` X
do
echo "java -mx6000M -jar ${impute} GenerateTrainData -c chr${chr} ${convert_dir} ${distance_dir} test_samplemarktable_all.txt ${gsize} ${train_dir} ${mark}"
    xsub -N step02_chr${chr}_${mark} \
        -q root.default \
        -n 1 \
        -m 6144 \
        -o ${base}/log \
        "java -mx6000M -jar ${impute} GenerateTrainData -c chr${chr} ${convert_dir} ${distance_dir} test_samplemarktable_all.txt ${gsize} ${train_dir} ${mark}"
        sleep 1
done
done
