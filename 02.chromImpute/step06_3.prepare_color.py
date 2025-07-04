import re, os

def get_tissue_dict(input_file):
    '''we will get tissue dict'''
    big_dict = dict()
    with open(input_file, 'rt') as f:
        for line in f:
            if not line.startswith('tissue_group_v3'):
                line_list = re.split(r'\t', line.strip())
                raw_tissue = line_list[0]
                tissue = re.split(r'\(', raw_tissue)[0].strip()
                big_dict[tissue] = big_dict.get(tissue, raw_tissue)
    return big_dict

tissue_dict = get_tissue_dict('imp_stat_annotation_bar.txt_chr18_count')

#print(tissue_dict['Alveolar Macrophage'])               

tissue_sort = []
with open('imp_tissue_sort_for_label.txt', 'rt') as f:
    for line in f:
        tissue_sort.append(line.strip())

def get_raw_color(input_file):
    '''we will get raw color for count'''
    big_dict = dict()
    big_list = []
    
    sort_dict = dict()
    with open(input_file, 'rt') as f:
        for line in f:
            line_list = re.split(r'[\'=]', line.strip())
            #print(line_list)
            tissue = line_list[1]
            color = line_list[4]
            raw_tissue = tissue_dict[tissue]
            #print(tissue, raw_tissue)
            key = "'"+raw_tissue+"'='"+color+"',"
            sort_dict[tissue] = sort_dict.get(tissue, key)
    for i in tissue_sort:
        print(sort_dict[i])
            
            
get_raw_color('imp_stat_raw_color.txt')

print()
print()
print()

#-this is for no count version----------------------------------
def get_raw_color(input_file):
    '''we will get raw color for no count'''
    big_dict = dict()
    big_list = []
    
    sort_dict = dict()
    with open(input_file, 'rt') as f:
        for line in f:
            line_list = re.split(r'[\'=]', line.strip())
            #print(line_list)
            tissue = line_list[1]
            color = line_list[4]
            raw_tissue = tissue
            #print(tissue, raw_tissue)
            key = "'"+raw_tissue+"'='"+color+"',"
            sort_dict[tissue] = sort_dict.get(tissue, key)
    for i in tissue_sort:
        print(sort_dict[i])
            
            
get_raw_color('imp_stat_raw_color.txt')