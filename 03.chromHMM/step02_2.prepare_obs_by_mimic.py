import re
import os
from collections import defaultdict

obs_path = '/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/CONVERTEDDATADIR'
link_path = '/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/obs_mimic_imp'

def change_obs_name_make_sampleinfo(obs_path, link_path):
    big_dict = defaultdict(list)

    if not os.path.exists(link_path):
        os.makedirs(link_path)  # 使用 os.makedirs 创建目录

    files = [i for i in os.listdir(obs_path) if i.endswith('.gz.wig.gz')]
    
    for i in files:
        name_list = re.split(r'[\._]', i)
        chr = name_list[0]
        sample = name_list[2]
        mark = name_list[3]
        
        # here must use impute, because the ExportToChromHMM only process files with certain names!!!!!!!
        new_name = '_'.join([chr, 'impute', sample, mark]) + '.wig.gz'
        obs_file = os.path.join(obs_path, i)
        link_file = os.path.join(link_path, new_name)
        
        # 使用 os.symlink 创建软链接
        os.symlink(obs_file, link_file)
        
        big_dict[mark].append(sample)

    for j in big_dict:
        with open('obs_sampleInfo_' + j + '.txt', 'wt') as F:
            for k in set(big_dict[j]):
                print(k, j, sep = '\t', file = F)

change_obs_name_make_sampleinfo(obs_path, link_path)
