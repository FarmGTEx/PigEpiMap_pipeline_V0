#!/bin/bash
#DSUB -n step07_1
#DSUB -A root.kkbkvxu5
#DSUB -R cpu=1;mem=10000
#DSUB -eo log/step07_1_%J.err
#DSUB -oo log/step07_1_%J.log

source /home/HPCBase/tools/module-5.2.0/init/profile.sh
module use /home/HPCBase/modulefiles/
module load tools/anaconda3/2022.10

source /home/HPCBase/tools/anaconda3/etc/profile.d/conda.sh

conda activate ljj_common

# prepare file for plot
#python step07.prepare_states_count_size_coverage_for_plot.py

# plot count, size, coverage
for i in count mean coverage
do python step07_2.plot_distribution_of_countSizeCoverage.py for_plot.count_size_coverage.txt ${i}
done

