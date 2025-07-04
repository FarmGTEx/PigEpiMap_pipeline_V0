import re, os
import pandas as pd

def make_bar_dict(input_file):
    '''we will make dict for bar meta info'''
    df = pd.read_csv(input_file, sep = '\t')
    #df['value'] = df[['tissue_group_v3', 'Ontology.stage', 'Ontology.breed', 'Ontology.tissue_type', 'sex']].apply(lambda row: '\t'.join(map(str, row)), axis=1)
    #cleaned_dict = dict(zip(df['real_id'].str.strip(), df['value'].str.strip()))

    sort_list = df['tissue_group_v3'].to_list()
    # to make sure we have the right and unique sort 
    last = []
    for i in sort_list:
        if not i in last:
            last.append(i)
    return last

id_list = make_bar_dict('20231114_for_ImpHeatmap_and_Umap_20231203_byHand_for_color.txt')
#print(len(id_list))

def print_format_that_pheatmap_need(input_file, sort_list):
    '''we will print tissue-color relationship that pheatmap needs'''
    big_dict = dict()
    with open(input_file, 'rt') as f:
        for line in f:
            if not line.startswith('tissue_group_v3'):
                line_list = re.split(r'\t', line.strip())
                tissue = line_list[0]
                color = line_list[1]
                big_dict[tissue] = big_dict.get(tissue, color)
    
    for i in sort_list:
        tissue = i
        color = big_dict[tissue]
        print("'"+tissue+"'"+"="+"'"+color+"'"+",")

    #print(big_dict.keys()-set(sort_list))
    #print()
    #print(set(sort_list)-big_dict.keys())

print_format_that_pheatmap_need('mimic_GTEx_color.txt', id_list)