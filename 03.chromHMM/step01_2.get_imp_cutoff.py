import os
import pandas as pd
import numpy as np
from multiprocessing import Pool
from sys import argv

script, input_path, mark, obs_quantile, CPU = argv

def process_25bp_bw_file(input_file):
    '''get score column'''
    raw_df = pd.read_csv(input_file, sep='\t', skiprows=[0, 1], names=['score'], dtype={'score': float})
    # through this, we sum each 8 lines into one line
    df = raw_df.groupby(raw_df.index // 8).mean()
    return df['score'].values

def process_one_mark(input_path, mark, obs_quantile, n_processes=int(CPU)):
    '''for each mark, we will perform overall analysis to check the quantile of cutoff=2'''
    all_scores = []
    files = [i for i in os.listdir(input_path) if mark in i]

    with Pool(processes=int(n_processes)) as pool:
        for tmp_scores in pool.imap_unordered(process_25bp_bw_file, [os.path.join(input_path, i) for i in files]):
            all_scores.append(tmp_scores)

    merged = np.concatenate(all_scores)
    q = np.quantile(merged, float(obs_quantile))
    with open(f'quantile.imp.{mark}', 'wt') as F:
        print(f'cutoff.imp.{mark}: {q:.4f}', file=F)

process_one_mark(input_path, mark, obs_quantile, n_processes=int(CPU))
