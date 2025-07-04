import re, os
from collections import defaultdict

base_path='/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute/'
cwd_path=os.getcwd()

all_soft_path=os.path.join(cwd_path, 'all_soft_link')
try:
    os.makedirs(all_soft_path)
except:
    pass

def makedict_for_red_flagged(input_file):
    '''we will make dict for red flagged obs, so that we will use imp to replace them'''
    big_dict = defaultdict(list)
    with open(input_file, 'rt') as f:
        for line in f:
            if not line.startswith('mark'):
                line_list = re.split(r'\t', line.strip())
                mark = line_list[0]
                sample = line_list[1]
                big_dict[mark].append(sample)
    return big_dict

red_dict = makedict_for_red_flagged('red_flagged_obs_sample.txt')
#print(red_dict)

#-------------------get soft link for all data, so that easy for merge mark-------------------------------
obs_binary_folder = [d for d in os.listdir(cwd_path) if os.path.isdir(os.path.join(cwd_path, d)) and 'obs_binarize_' in d]
imp_binary_folder = [d for d in os.listdir(cwd_path) if os.path.isdir(os.path.join(cwd_path, d)) and 'imp_binarize_' in d]
#print(obs_binary_folder)

def soft_link_file_for_imp(input_path, target_path):
    '''we will soft link all data into new path, so that we can easily perfrom merging marks'''
    name_list = re.split(r'_', input_path)
    mark = name_list[-1]

    ori_files = [i for i in os.listdir(input_path) if i.endswith('_binary.txt.gz')]
    for i in ori_files:
        ori_file = os.path.join(cwd_path, input_path, i)
        link_file = os.path.join(cwd_path, target_path, mark + '_' + i)
        
        # except must be used, or it will fail and stop
        try:
            os.symlink(ori_file, link_file)
        except FileExistsError:
            # print(f"软链接 '{link_file}' 已存在，跳过创建")
            pass

def soft_link_file_for_obs(input_path, target_path):
    '''we will soft link all data into new path, so that we can easily perfrom merging marks'''
    name_list = re.split(r'_', input_path)
    mark = name_list[-1]

    ori_files = [i for i in os.listdir(input_path) if i.endswith('_binary.txt.gz')]
    for i in ori_files:
        # we will not softlink red flagged sample !!!!!!!!!!!!!!!!
        tmp_sample = re.split(r'_', i)[0]
        if not tmp_sample in set(red_dict[mark]):
            ori_file = os.path.join(cwd_path, input_path, i)
            link_file = os.path.join(cwd_path, target_path, mark + '_' + i)
            
            # except must be used, or it will fail and stop
            try:
                os.symlink(ori_file, link_file)
            except FileExistsError:
                # print(f"软链接 '{link_file}' 已存在，跳过创建")
                pass

# we will soft link binarized files to one unified target folder, for downstream merge marks and begin chromHMM  
# obs data first
for before_link_path in obs_binary_folder:
    soft_link_file_for_obs(before_link_path, all_soft_path)

# imp data second, so that we will always use obs before imp if possible
for before_link_path in imp_binary_folder:
    soft_link_file_for_imp(before_link_path, all_soft_path)

# after this, we can check the file count of all_soft_link, it should be individual * 5 (mark count) * 19 (chr count)
# then it should be right and we can move next    

