#!/bin/bash
#DSUB -n step01
#DSUB -A root.kkbkvxu5
#DSUB -R cpu=50;mem=170000
#DSUB -eo log/step01_%J.err
#DSUB -oo log/step01_%J.log

source /home/HPCBase/tools/module-5.2.0/init/profile.sh
module use /home/HPCBase/modulefiles/
module load tools/anaconda3/2022.10

source /home/HPCBase/tools/anaconda3/etc/profile.d/conda.sh

conda activate ljj_common

obs_path=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/CONVERTEDDATADIR
imp_path=/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/OUTPUTDATA

# for i in H3K4me1 H3K4me3 H3K27me3 H3K27ac ATAC
# do python step01_1.get_obs_cutoff_quantile_multiCPU.py ${obs_path} ${i} 50
# done

python3 step01_2.get_imp_cutoff.py ${imp_path} H3K4me1 0.9449 50
python3 step01_2.get_imp_cutoff.py ${imp_path} H3K4me3 0.9815 50
python3 step01_2.get_imp_cutoff.py ${imp_path} H3K27me3 0.9560 50
python3 step01_2.get_imp_cutoff.py ${imp_path} H3K27ac 0.9549 50
python3 step01_2.get_imp_cutoff.py ${imp_path} ATAC 0.9726 50
