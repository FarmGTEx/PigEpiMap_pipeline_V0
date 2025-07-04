# in order to perform wig2bigwig, we need to merge obs_chr into one file
import re, os
import pandas as pd
import numpy as np
from collections import defaultdict
from sys import argv

script, target_mark = argv

chrs = ['chr1', 'chr10', 'chr11', 'chr12', 'chr13', 'chr14', 'chr15', 'chr16', 'chr17', 'chr18', 'chr2', 'chr3', 'chr4', 'chr5', 
       'chr6', 'chr7', 'chr8', 'chr9', 'chrX']

ori_path = 'CONVERTEDDATADIR'
destination_path = ori_path + '_merged'
os.makedirs(destination_path, exist_ok = True)

def read_file(input_file):
    '''we will read in one file'''
    df = pd.read_csv(os.path.join(ori_path, input_file), sep = '\t', low_memory = False)
    return df

#a = read_file('chr18', 'P348Adipose_ATAC')
#print(a)

def merge_files(output_path):
    '''we will merge all chrs into one file'''
    files = [i for i in os.listdir(ori_path) if i.endswith('.wig.gz') and target_mark in i]
    all_sample_mark = defaultdict(list)
    for i in files:
        name_list = re.split(r'[\._]', i)
        sample = name_list[2]
        mark = name_list[3]
        sample_mark = sample + '_' + mark
        all_sample_mark[sample_mark].append(i)

    for sample_mark in all_sample_mark:
        all = []
        for i in sorted(all_sample_mark[sample_mark]):
            tmp = read_file(i)
            all.append(tmp)
        merged = pd.concat(all)
        merged.to_csv(os.path.join(output_path, 'observed_' + sample_mark + '.wig.gz'), sep = '\t', index = False)
        #merged.to_csv('impute_' + sample_mark + '.wig.gz', sep = '\t', index = False, compression='gzip')
    
merge_files(destination_path)


    

        