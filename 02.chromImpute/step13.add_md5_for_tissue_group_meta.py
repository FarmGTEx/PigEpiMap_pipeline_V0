import re, os
import pandas as pd

meta_path='/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/00.data/20230410_real_by_hand_meta_table'

def process_tissue_group(input_file):
    '''we will process tissue group file'''
    df = pd.read_csv(input_file, sep = '\t')
    return df

a = process_tissue_group(os.path.join(meta_path, '01.by_hand_812_obs_data_meta.txt'))
#print(a)

def process_md5(input_file):
    '''we wil lprocess md5 file'''
    df = pd.read_csv(input_file, sep = '\t', names = ['real_id', 'mark', 'raw_md5'])
    df['md5'] = df['raw_md5'].str.split(r'_', expand = True)[0]
    return df.loc[:, ['real_id', 'mark', 'md5']]

b = process_md5('test_samplemarktable_all.txt')
#print(b)

merged = a.merge(b, on = 'real_id', how = 'inner')
print(merged)


