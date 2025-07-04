impute=/home/share/kkbkvxu5/home/jingjinli/00.soft/ChromImpute/ChromImpute.jar
gsize=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/chrsize_no_chr0_chrY.tsv

base=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute

convert_dir=${base}/test_CONVERTEDDATADIR
distance_dir=${base}/DISTANCEDIR
predictor_dir=${base}/PREDICTORDIR
output_dir=${base}/OUTPUTDATA
samplemarktable=${base}/test_samplemarktable_all.txt
test_marktable=${base}/test_samplemarktable.txt

sta_dir=STATISTICSDIR

#/home/share/huaznydxue/home/jingjli/02prject/01.epimap/02.impute

#for i in H3K4me1 H3K4me3 H3K27ac H3K27me3 ATAC
#do java -mx6000M -jar ${impute} ComputeGlobalDist -m ${i} ${convert_dir} test_samplemarktable_all.txt ${gsize} ${distance_dir}
#done

#java -mx5000M -jar ${impute} Convert ${input_dir} test_samplemarktable.txt \
# ${gsize} ${convert_dir}

for sample in `awk '{print $1}' test_samplemarktable_all.txt2 | sort | uniq`
do
for mark in H3K4me3 H3K27me3
do
echo "java -mx6000M -jar ${impute} Convert -l ${sample} -m ${mark} ${input_dir} test_samplemarktable_all.txt2 ${gsize} ${convert_dir}"
    xsub -N step00_${sample}_${mark} \
        -n 1 \
        -m 6144 \
        -o ${base}/test_log \
        "java -mx6000M -jar ${impute} Convert -l ${sample} -m ${mark} ${input_dir} test_samplemarktable_all.txt2 ${gsize} ${convert_dir}"
        sleep 0.1
done
done
