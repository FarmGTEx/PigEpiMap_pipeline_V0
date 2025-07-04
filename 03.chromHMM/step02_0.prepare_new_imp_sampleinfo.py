import re, os
from collections import defaultdict

#----------------prepare sampleInfo for imp data, each mark separately---------------
def make_imp_sampleInfo(imp_path):
    '''we will make sampleinfor for export2chromHMM'''
    big_dict = defaultdict(list)
    files = [i for i in os.listdir(imp_path) if i.startswith('impute_')]

    for i in files:
        name_list = re.split(r'[_\.]', i)
        sample = name_list[1]
        mark = name_list[2]
        big_dict[mark].append(sample)

    for j in big_dict:
        with open('imp_sampleInfo_' + j + '.txt', 'wt') as F:
            for k in set(big_dict[j]):
                print(k, j, sep = '\t', file = F)

make_imp_sampleInfo('/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/OUTPUTDATA_merged')