parser=/home/share/kkbkvxu5/home/jingjinli/00.soft/SAGAconf/SAGAconf_parser.py
SAGAconf=/home/share/kkbkvxu5/home/jingjinli/00.soft/SAGAconf/SAGAconf.py

for i in Thymus Cardia Pancreas Lymph_Node Other Stomach Adipose Brain Spleen Ileum Lung Testis Alveolar_Macrophage T_cell Duodenum Myosatellite \ Neutrophils Colon Kidney Intestine Cerebellum Skeletal_Muscle Liver Myeloid_Leukocyte Pituitary Smooth_Muscle Pylorus Hypothalamus B_cell \
 Caecum Jejunum Heart
do
echo "python ${SAGAconf} chromHMM_model_n200_s12/base_${i}/parsed_posterior.bed \
 chromHMM_model_n200_s12/verif_${i}/parsed_posterior.bed chromHMM_model_n200_s12/sagaconf_${i}"
 xsub -N sagaconf_${i} \
 -n 2 \
 -m 30000 \
 -o sagaconf_tmp \
 "source /home/HPCBase/tools/module-5.2.0/init/profile.sh; module use /home/HPCBase/modulefiles/; \
  module load tools/anaconda3/2022.10; source /home/HPCBase/tools/anaconda3/etc/profile.d/conda.sh; \
  conda activate ljj_common; \
  python ${parser} --saga chmm chromHMM_model_n200_s12/base_${i} 200 chromHMM_model_n200_s12/base_${i}; \
  python ${parser} --saga chmm chromHMM_model_n200_s12/verif_${i} 200 chromHMM_model_n200_s12/verif_${i}; \
  python ${SAGAconf} chromHMM_model_n200_s12/base_${i}/parsed_posterior.bed \
  chromHMM_model_n200_s12/verif_${i}/parsed_posterior.bed chromHMM_model_n200_s12/sagaconf_${i}"
 sleep 1
done

