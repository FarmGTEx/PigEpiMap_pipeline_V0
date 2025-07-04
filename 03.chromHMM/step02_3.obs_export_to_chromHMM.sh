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
obs_mimic_imp=${base}/obs_mimic_imp

sta_dir=STATISTICSDIR

tmp=$(pwd)/tmp

#/home/share/huaznydxue/home/jingjli/02prject/01.epimap/02.impute

for mark in H3K4me1 H3K4me3 H3K27me3 H3K27ac ATAC
#for mark in H3K4me1
do
echo "java -mx6000M -jar ${impute} ExportToChromHMM -g 2 ${obs_mimic_imp} obs_sampleInfo_${mark}.txt ${gsize} obs_binarize_${mark}"
    xsub -N step02_obs_binarize_${mark} \
        -n 1 \
        -m 6000 \
        -o ${tmp} \
        "java -mx6000M -jar ${impute} ExportToChromHMM -g 2 ${obs_mimic_imp} obs_sampleInfo_${mark}.txt ${gsize} obs_binarize_${mark}"
        sleep 1
done
