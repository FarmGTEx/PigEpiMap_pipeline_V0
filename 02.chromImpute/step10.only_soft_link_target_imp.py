# we will generate a file list for high-quality obs data, so that we can soft link imp data and avoid these good obs
# after that, we will only soft imp data where no obs data or no good obs data existed. After the soft lin, we can estimate 
# their quantile for downstream binarization

import re, os
import pandas as pd

# base_path='/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/'
cwd_path=os.getcwd()

def make_set_for_good_obs(input_path):
    '''we will make set for good obs data'''
    good_obs = []
    files = [i for i in os.listdir(input_path) if i.startswith('chr10_') and i.endswith('.wig.gz')]
    for i in files:
        name_list = re.split(r'[\._]', i)
        sample_mark = name_list[2] + '_' + name_list[3]
        good_obs.append(sample_mark)
    return set(good_obs)

good_obs = make_set_for_good_obs('good_obs_mimic_imp')
#print(good_obs)

def soft_link_data(ori_path):
    '''we will soft link imp data to new folder (only if the corresponding obs do not exist!)
    ori_path should be OUTPUTDATA or OUTPUTDATA_merged'''
    # destination path
    new_path = 'softlink_' + ori_path
    os.makedirs(new_path, exist_ok = True)

    imp_should_be_softlink = []

    # get all imp
    files = [i for i in os.listdir(ori_path) if i.endswith('.wig.gz')]
    for i in files:
        name_list = re.split(r'[\._]', i)
        # in OUTPUTDATA dir and OUTPUTDATA_merged dir, files have different pre-fix, so we use this way to avoid distinguish between them
        sample_mark = name_list[-4] + '_' + name_list[-3]
        if not sample_mark in good_obs:
            imp_should_be_softlink.append(i)

    for i in imp_should_be_softlink:
        ori_file = os.path.join(cwd_path, ori_path, i)
        link_file = os.path.join(cwd_path, new_path, i)
        try:
            os.symlink(ori_file, link_file)
        except FileExistsError:
            # print(f"软链接 '{link_file}' 已存在，跳过创建")
            pass

soft_link_data('OUTPUTDATA_merged')
soft_link_data('OUTPUTDATA')