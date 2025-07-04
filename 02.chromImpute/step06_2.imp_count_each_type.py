import pandas as pd
import re, os

#----------------couint type--------------------------------------------------------
def count_each_type_for_imp(input_file, output_file):
    '''we will count each type for heatmap legend'''
    df = pd.read_csv(input_file, sep = '\t')
    
    #target = set(['tissue_group_v2', 'Ontology.stage' , 'Ontology.breed' , 'Ontology.tissue_type' ,   'sex'])
    
    
    with open(output_file, 'wt') as F:
        # 计算每列中每个类别的计数
        category_counts = {}
        for column in df.columns:
            category_counts[column] = df[column].value_counts()
        
        # 计算每列中类别的总数（即类别之和）
        total_category_counts = {}
        for column, counts in category_counts.items():
            total_count = counts.sum()
            total_category_counts[column] = total_count
        
        # 输出每列中每个类别的计数和类别的总数
        for column, counts in category_counts.items():
            F.write(f"Column '{column}':\n{counts}\n")
            F.write(f"Total count for column '{column}': {total_category_counts[column]}\n")
            
            
count_each_type_for_imp('imp_stat_annotation_bar.txt_chr18', 'imp_stat_count.txt')


#----------count obs and imp, obs not imp, only imp

obs = set([re.split(r'_', i, 1)[1] for i in os.listdir('CONVERTEDDATADIR_merged') if i.endswith('.wig.gz')])
imp = set([re.split(r'_', i, 1)[1] for i in os.listdir('OUTPUTDATA_merged') if i.endswith('.wig.gz')])

obs_and_imp = obs & imp

obs_not_imp = obs - imp

imp_only = imp - obs

print('obs_and_imp:', len(obs_and_imp))
print('obs_not_imp:', len(obs_not_imp))
print('imp_only', len(imp_only))