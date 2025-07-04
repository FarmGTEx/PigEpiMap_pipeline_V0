import os
import pandas as pd
import numpy as np
from multiprocessing import Pool
from sys import argv

script, input_path, mark, CPU = argv

def process_25bp_bw_file(input_file, cutoff=2):
    '''we will sort each file, and get the quantile of cutoff=2'''
    raw_df = pd.read_csv(input_file, sep = '\t', skiprows=[0, 1], names = ['score'])
    # through this, we sum each 8 lines into one line
    df = raw_df.groupby(raw_df.index//8).mean()
    total_lines = df.shape[0]

    df1 = df.loc[df['score']>=cutoff]
    cutoff_lines = df1.shape[0]

    #quantile = cutoff_lines / total_lines
    return total_lines, cutoff_lines

def process_one_file(file_path):
    '''process a single file'''
    return process_25bp_bw_file(file_path)

def process_one_mark(input_path, mark, n_processes=int(CPU)):
    '''for each mark, we will perform overall analysis to check the quantile of cutoff=2'''
    files = [os.path.join(input_path, i) for i in os.listdir(input_path) if mark in i]
    with Pool(processes=int(n_processes)) as pool:
        result = pool.map(process_one_file, files)

    total_lines = [i[0] for i in result]
    cutoff_lines = [i[1] for i in result]
    with open('quantile.obs.mean8_multiCPU.' + mark, 'wt') as F:
        quantile = sum(cutoff_lines) / sum(total_lines)
        print('>2', 'total', 'quantile', sep = '\t', file = F)
        print(sum(cutoff_lines), sum(total_lines), 1-quantile, sep = '\t', file = F)

process_one_mark(input_path, mark, n_processes=int(CPU))
