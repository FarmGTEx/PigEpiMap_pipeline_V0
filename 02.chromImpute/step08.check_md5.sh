#!/bin/bash
#DSUB -n step08_md5
#DSUB -A root.kkbkvxu5
#DSUB -R cpu=1;mem=5000
#DSUB -eo log/step08_md5_%J.err
#DSUB -oo log/step08_md5_%J.log

#find OUTPUTDATA -type f -exec md5sum {} \; > md5_single_chr_whcs.txt

#find CONVERTEDDATADIR -type f -exec md5sum {} \; > md5_single_chr_obs_whcs.txt

find CONVERTEDDATADIR_merged -type f -exec md5sum {} \; > md5_CONVERTEDDATADIR_merged_whcs.txt

#find OUTPUTDATA_merged -type f -exec md5sum {} \; > md5_merged_chr_whcs.txt

#diff md5_merged_chr_whcs.txt.sorted md5_merged_chr_zuozhong.txt.sorted

#diff md5_single_chr_whcs.txt md5_single_chr_zuozhong.txt
