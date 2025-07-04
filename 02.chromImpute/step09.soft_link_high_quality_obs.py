# because some obs are low quality, so we will only use high quality obs for all downstream analysis, especially for 
# obs to check the quantile when -log10P-value=2. As a result, we will only soft link high-quality obs to new path
# the soft link of good obs in these dir is now ready for check quantil for downstream binarization

import re, os
import pandas as pd

# base_path='/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/'
cwd_path=os.getcwd()

def low_quality_obs(input_file):
    '''we will make a dict for low quality obs
    this files should be sample_mark format
    low quality should be from two parts: 1) red_flagged_low_quality.txt; 2) low_unique_mapping_obs.txt. !!!!!!!!!'''
    df = pd.read_csv(input_file, sep = '\t')
    df['low_obs'] = df['sample'] + '_' + df['mark']
    return set(df['low_obs'].to_list())

low_obs_1 = low_quality_obs('red_flagged_low_quality.txt')
low_obs_2 = low_quality_obs('low_unique_mapping_obs.txt')
low_obs = low_obs_1 | low_obs_2
#print(low_obs)

def soft_link_data(ori_path):
    '''we will soft link high quality obs data to new folder
    ori_path should be OUTPUTDATA or OUTPUTDATA_merged'''
    # destination path
    new_path = 'good_obs_mimic_imp'
    os.makedirs(new_path, exist_ok = True)

    high_quality_obs = []

    # get high quality obs
    files = [i for i in os.listdir(ori_path) if i.endswith('.wig.gz')]
    for i in files:
        name_list = re.split(r'[\._]', i)
        sample_mark = name_list[2] + '_' + name_list[3]
        if not sample_mark in low_obs:
            high_quality_obs.append(i)

    for i in high_quality_obs:
        name_list = re.split(r'[\._]', i)
        chr = name_list[0]
        sample = name_list[2]
        mark = name_list[3]

        new_name = '_'.join([chr, 'impute', sample, mark]) + '.wig.gz'

        ori_file = os.path.join(cwd_path, ori_path, i)
        link_file = os.path.join(cwd_path, new_path, new_name)
        try:
            os.symlink(ori_file, link_file)
        except FileExistsError:
            # print(f"软链接 '{link_file}' 已存在，跳过创建")
            pass

soft_link_data('CONVERTEDDATADIR')





