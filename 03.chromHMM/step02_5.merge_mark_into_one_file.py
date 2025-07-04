import re, os
import pandas as pd
import numpy as np
import gzip

base_path = '/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/'
cwd_path = os.getcwd()

#-------------------------------------------------------
input_path = os.path.join(cwd_path, 'all_soft_link')
output_path = os.path.join(cwd_path, 'all_for_chromHMMlearnModel')

try:
    os.makedirs(output_path)
except:
    pass
#-------------------------------------------------------

mark = set(['ATAC', 'H3K27ac', 'H3K27me3', 'H3K4me1', 'H3K4me3'])

chrs = ['chr1', 'chr2', 'chr3', 'chr4', 'chr5', 'chr6', 'chr7', 'chr8', 'chr9', 'chr10', 'chr11',
'chr12', 'chr13', 'chr14', 'chr15', 'chr16', 'chr17', 'chr18', 'chrX']

#chrs = ['chr17', 'chr18']

def read_in_meta(input_file):
    '''we will get all samples from sampleinfo'''
    total_sample = []
 
    with open(input_file, 'rt') as f:
        for line in f:
            line_list = re.split(r'\t', line.strip())
            sample = line_list[0]
            total_sample.append(sample)
    return set(total_sample)

all_samples = read_in_meta(os.path.join(base_path, 'test_samplemarktable_all.txt'))

def read_in_binarized_file(input_file, mark):
    '''get score column'''
    df = pd.read_csv(input_file, sep='\t', skiprows=[0, 1], names=[mark], dtype={mark: int})
    return df[mark]

def batch_process(input_path, output_path):
    '''we will merge marks into one file for each chr_sample'''
    for i in all_samples:
        for j in chrs:
            tmp_5_mark = []
            for k in mark:
                file_name = '_'.join([k, i, j, 'binary.txt.gz'])
                tmp_binary = read_in_binarized_file(os.path.join(input_path, file_name), k)
                tmp_5_mark.append(tmp_binary)
            tmp_df = pd.concat(tmp_5_mark, axis = 1)
            out_file_name = '_'.join([i, j, 'binary.txt.gz'])
            with gzip.open(os.path.join(output_path, out_file_name), 'wt') as F:
                print(i, j, sep = '\t', file = F)
            # need to pay attention of this retract!!!!!!!!!
            # in addition, because we are using adding mode, so we can only run this script once, if you want to re-run, please delete the existing results!!
            tmp_df.to_csv(os.path.join(output_path, out_file_name), mode = 'a', sep = '\t', index = False)
            
batch_process(input_path, output_path)
