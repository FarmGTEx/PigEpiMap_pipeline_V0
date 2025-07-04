import re, os
import pandas as pd

target_path = os.path.join(os.getcwd(), 'chromHMM_model_n200_s12_transformed')
#target_path = '/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/04.chromHMM_filtered/just_test'

def get_pig_genome_size(input_file):
    '''we will get genoem size'''
    df = pd.read_csv(input_file, names = ['chr', 'size'], sep = '\t')
    pig_gsize = df['size'].sum()
    return pig_gsize

pig_gsize = get_pig_genome_size('/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/chrsize_no_chr0_chrY.tsv')

def process_one_bed_file(input_file):
    '''we will process one bed file'''
    df = pd.read_csv(input_file, names = ['chr', 'start', 'end', 'states'], sep = '\t')

    grouped = df.groupby('states')
    
    # using groupby 
    count = grouped['states'].count()
    #median_size = grouped.apply(lambda x: (x['end'] - x['start']).median())
    mean_size = grouped.apply(lambda x: (x['end'] - x['start']).mean())

    size = grouped.apply(lambda x: (x['end'] - x['start']).sum())
    coverage = 100 * (size / pig_gsize)

    # 创建一个新DataFrame来存储结果
    result_df = pd.DataFrame({'count': count, 'mean': mean_size, 'coverage': coverage})

    return result_df

def concat_for_distribution(input_path, output_file):
    '''we will calculate count size and genome coverage'''
    all = []

    files = [i for i in os.listdir(input_path) if i.endswith('_12_segments_transformed.bed')]

    for i in files:
        tmp_df = process_one_bed_file(os.path.join(input_path, i))
        all.append(tmp_df)

    df = pd.concat(all)

    df.to_csv(output_file, sep = '\t')

concat_for_distribution(target_path, 'for_plot.count_size_coverage.txt')
