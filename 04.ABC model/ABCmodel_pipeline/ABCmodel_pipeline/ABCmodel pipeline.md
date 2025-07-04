## ABCmodel pipeline

#### 环境配置 & 文件准备

```sh
#活性文件准备
multiBigwigSummary BED-file --BED bed_file -b ./ATAC*.bw --outRawCounts ATAC.tab -out ATAC.npz

multiBigwigSummary BED-file --BED bed_file -b ./H3K27ac*.bw --outRawCounts H3K27ac.tab -out H3K27ac.npz

#取平均活性
python3 ./01process/01.mean_activity.py -i ./ATAC*.tab -o ./mean_file

#合并ATAC和H3K27ac活性
python3 ./01process/02.merge_activity.py -a ./ATAC_mean_file -h ./H3K27ac_mean_file -o ./merge_file
```

#### 运行ABCmodel

```sh
python3 ./03ABCmodel/stare_tissue.py -i ./merge_file -o ./03output
```
