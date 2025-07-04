base=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute

for mark in H3K4me1 H3K4me3 H3K27me3 H3K27ac ATAC
do
echo "python step09_2.merge_single_chr_obs.py ${mark}"
    xsub -N step09_02_${mark} \
        -q root.default \
        -n 1 \
        -m 20000 \
        -o ${base}/log \
        "python step09_2.merge_single_chr_obs.py ${mark}"
        sleep 0.5
done
