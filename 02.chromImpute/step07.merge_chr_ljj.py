import re, os
import pandas as pd
import numpy as np
from sys import argv

script, sample_mark = argv

chrs = ['chr1', 'chr10', 'chr11', 'chr12', 'chr13', 'chr14', 'chr15', 'chr16', 'chr17', 'chr18', 'chr2', 'chr3', 'chr4', 'chr5', 
       'chr6', 'chr7', 'chr8', 'chr9', 'chrX']

#chrs = ['chr10', 'chr11']

def read_file(chr, sample_mark):
    '''we will read in one file'''
    path = 'OUTPUTDATA'
    df = pd.read_csv(os.path.join(path, chr + '_impute_' + sample_mark + '.wig.gz'), sep = '\t', low_memory = False)
    return df

#a = read_file('chr18', 'P348Adipose_ATAC')
#print(a)

def merge_files(output_path, sample_mark):
    '''we will merge all chrs into one file'''
    all = []
    for i in chrs:
        tmp = read_file(i, sample_mark)
        all.append(tmp)
    merged = pd.concat(all)
    #merged.to_csv(os.path.join(output_path, 'impute_' + sample_mark + '.wig.gz'), sep = '\t', index = False, compression='gzip')
    merged.to_csv(os.path.join(output_path, 'ljj_impute_' + sample_mark + '.wig.gz'), sep = '\t', index = False)
    
merge_files('merge_test', sample_mark)
    

