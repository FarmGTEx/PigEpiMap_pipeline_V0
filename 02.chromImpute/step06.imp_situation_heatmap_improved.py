import re, os
from collections import defaultdict
import pandas as pd
import numpy as np

meta_path='/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/00.data/20230410_real_by_hand_meta_table'

# def change_sample_format(input_str):
#     '''we will get tissue out from sample name by regular expression'''
#     if input_str.startswith('Sample') and 'PRJ' in input_str:
#         sample = re.compile(r'(Sample\d+)(PRJ\w+\d+)(\w*)')
#         match = sample.search(input_str)
#         #return [match.group(1), match.group(2), match.group(3)]
#         return match.group(3)+'@'+match.group(1)+match.group(2)
#     elif input_str.startswith('P'):
#         sample = re.compile(r'(P\d+)(\w*)')
#         match = sample.search(input_str)
#     #return [match.group(1), match.group(2)]
#         return match.group(2)+'@'+match.group(1)
#     # this is for sample and Sample of PAM and satellite
#     else:
#         sample = re.compile(r'(\wample\d+)(\w*)')
#         match = sample.search(input_str)
#     #return [match.group(1), match.group(2)]
#         return match.group(2)+ '@' +match.group(1)

def make_bar_dict(input_file):
    '''we will make dict for bar meta info'''
    df = pd.read_csv(input_file, sep = '\t')
    df['value'] = df[['tissue_group_v2', 'Ontology.stage', 'Ontology.breed', 'Ontology.tissue_type', 'sex']].apply(lambda row: '\t'.join(map(str, row)), axis=1)
    cleaned_dict = dict(zip(df['real_id'].str.strip(), df['value'].str.strip()))

    sort_list = df['real_id'].to_list()
    # to make sure we have the right and unique sort 
    last = []
    for i in sort_list:
        if not i in last:
            last.append(i)
    return cleaned_dict, last

bar_dict, id_list = make_bar_dict(os.path.join(meta_path, '02.by_hand_812_obs_data_meta_module_sort.txt'))
#print(id_list)

#---------------------we will prepare for obs, imp and whole set, so we can judge imp state-----------------
def make_whole_combination(input_file):
    '''we will make whole combination'''
    big_set = []
    obs_set = []
    
    mark_set = []
    sample_set = []
    with open(input_file, 'rt') as f:
        for line in f:
            line_list = re.split(r'\t', line.strip())
            sample = line_list[0]
            #print(sample)
            mark = line_list[1]
            
            obs = mark + '_' + sample
            obs_set.append(obs)
            
            mark_set.append(mark)
            sample_set.append(sample)
            
        for i in set(mark_set):
            for j in set(sample_set):
                big_set.append(i+'_'+j)
    
    return set(big_set), set(obs_set)

make_whole_combination('test_samplemarktable_all.txt')

def make_imp_set(input_path):
    '''we will collect all imputed files into imp set'''
    imp_set = []
    
    # we can judge failure impute samples by file size!!!!!!!!!!!!!!!!
    # any chr is okay, this is a rough statistic
    files = [i for i in os.listdir(input_path) if i.startswith('chr18_impute_') and i.endswith('.wig.gz')]
    for i in files:
        name_list = re.split(r'[\._]', i)
        key = name_list[3] + '_' + name_list[2]
        imp_set.append(key)
        
    return set(imp_set)

def make_big_heatmap(output_file, annotation_file):
    '''we will make big heatmap'''
    target_sort = ['H3K4me1', 'H3K4me3', 'H3K27ac', 'H3K27me3', 'ATAC']
    
    imp_stat = defaultdict(dict)
    
    whole_set, obs_set = make_whole_combination('test_samplemarktable_all.txt')
    imp_set = make_imp_set('OUTPUTDATA')
    
    for i in whole_set:
        name_list = re.split(r'_', i)
        mark = name_list[0]
        sample = name_list[1]
        
        if i in obs_set and i in imp_set:
            imp_stat[sample][mark] = 3
        elif i in obs_set and not i in imp_set:
            imp_stat[sample][mark] = 2
        elif i in imp_set and not i in obs_set:
            imp_stat[sample][mark] = 1
        elif i not in obs_set and i not in imp_set:
            imp_stat[sample][mark] = 0
        else:
            imp_stat[sample][mark] = np.nan
            
    df = pd.DataFrame(imp_stat)
    df.fillna(999, inplace = True)
    sorted_df = df.loc[target_sort]
    sorted_df2 = sorted_df.sort_index(axis = 1)
    sorted_df3 = sorted_df2[id_list]
    sorted_df3.to_csv(output_file, sep = '\t')
    
    # prepare for annotation
    with open(annotation_file, 'wt') as F:
        print('tissue_group_v3', 'Ontology.stage', 'Ontology.breed', 'Ontology.tissue_type', 'sex', sep ='\t', file = F)
        for i in sorted_df3.columns:
            print(bar_dict[i], sep='\t', file = F)
    
#make_big_heatmap('imp_stat_heatmap.txt', 'imp_stat_annotation_bar.txt')

make_big_heatmap('imp_stat_heatmap.txt_chr18', 'imp_stat_annotation_bar.txt_chr18')


# we will add count for legend
# import pandas as pd
#
# # 创建DataFrame
# data = {
#     'tissue_group_v3': ['Adipose', 'Adipose', 'Adipose', 'Adipose', 'Adipose', 'Adipose', 'Adipose', 'Adipose', 'Adipose', 'Adipose'],
#     'Ontology.stage': ['Adult', 'Adult', 'Adult', 'Adult', 'Adult', 'Adult', 'Adult', 'Adult', 'Adult', 'Adult'],
#     'Ontology.breed': ['Duroc', 'Duroc', 'Enshiblack', 'Enshiblack', 'Largewhite', 'Largewhite', 'Largewhite', 'Largewhite', 'Meishan', 'Meishan'],
#     'Ontology.tissue_type': ['Tissue', 'Tissue', 'Tissue', 'Tissue', 'Tissue', 'Tissue', 'Tissue', 'Tissue', 'Tissue', 'Tissue'],
#     'sex': ['Male', 'Male', 'Male', 'Male', 'Male', 'Male', 'Male', 'Male', 'Male', 'Male']
# }

df = pd.read_csv('imp_stat_annotation_bar.txt_chr18', sep = '\t')

# 统计每个元素出现的次数
counts = df.apply(pd.value_counts)

# 将出现次数添加到元素后面
for col in counts.columns:
    df[col] = df[col].apply(lambda x: f"{x} ({int(counts[col][x])})")

df.to_csv('imp_stat_annotation_bar.txt_chr18_count', sep = '\t', index = False)