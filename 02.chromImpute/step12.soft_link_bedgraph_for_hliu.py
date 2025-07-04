# we will put (qualified obs) and (imp that do not overlap with these obs) into a new folder, so that we can perform calculation together 

import re, os
import pandas as pd

ori_obs_path = '/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/CONVERTEDDATADIR_merged'
ori_imp_path = '/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/OUTPUTDATA_merged'

target_soft_path = 'soft_all_bedgraph_for_hliu'

os.makedirs(target_soft_path, exist_ok = True)

def make_set_for_red_flagged_obs(input_file):
    '''they are some red flagged low quality obs that need to be replaced by imp'''
    df = pd.read_csv(input_file, sep = '\t', names = ['mark', 'sample'])
    df['key'] = df['sample'] + '_' + df['mark']
    return set(df['key'].to_list())

red_flagged = make_set_for_red_flagged_obs('red_flagged_data.txt')
#print(red_flagged)

def make_dict_for_files(input_path):
    '''we will make dict for files'''
    all_list = []
    files = [i for i in os.listdir(input_path) if i.endswith('.wig.gz')]
    for i in files:
        name_list = re.split(r'[\._]', i)
        sample = name_list[1]
        mark = name_list[2]
        key = sample + '_' + mark
        all_list.append(key)
    return set(all_list)

raw_obs = make_dict_for_files(ori_obs_path)
raw_imp = make_dict_for_files(ori_imp_path)

# qualified obs
real_obs = raw_obs - red_flagged
# we only use imp to replace non-existed obs
real_imp = raw_imp - real_obs

def soft_link_file(ori_path, target_path, choosen_set):
    '''we will soft link file from ori_path to target_path
    choosen set is real_obs or real_imp'''
    raw_files = [i for i in os.listdir(ori_path) if i.endswith('.wig.gz')]
    for i in raw_files:
        name_list = re.split(r'[\._]', i)
        sample = name_list[1]
        mark = name_list[2]
        key = sample + '_' + mark
        if key in choosen_set:
            ori_file = os.path.join(ori_path, i)
            link_file = os.path.join(target_path, i)
            try:
                os.symlink(ori_file, link_file)
            except FileExistsError:
                # print(f"软链接 '{link_file}' 已存在，跳过创建")
                pass

soft_link_file(ori_obs_path, target_soft_path, real_obs)
soft_link_file(ori_imp_path, target_soft_path, real_imp)



