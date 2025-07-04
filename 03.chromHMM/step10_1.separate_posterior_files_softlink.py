import re, os
from collections import defaultdict
import shutil
from sys import argv
import pandas as pd

script, number_of_states = argv

#-----preparation of path and chrs----------------------------------
chromHMM_path = os.path.join(os.getcwd(), 'chromHMM_model_n200_s12')
posterior_path = os.path.join(chromHMM_path, 'POSTERIOR')

chrs = ['chr1', 'chr2', 'chr3', 'chr4', 'chr5', 'chr6', 'chr7', 'chr8', 'chr9', 'chr10', 'chr11',
'chr12', 'chr13', 'chr14', 'chr15', 'chr16', 'chr17', 'chr18', 'chrX']

#----------function for split sample, project and tissue-----------------------------------
def change_sample_format(input_str):
    '''we will change sample format and get tissue out'''
    if input_str.startswith('Sample'):
        sample = re.compile(r'(Sample\d+)(PRJ\w+\d+)(\w*)')
        match = sample.search(input_str)
        #return [match.group(1), match.group(2), match.group(3)]
        return match.group(2) + match.group(3), match.group(1)
    elif input_str.startswith('P'):
        sample = re.compile(r'(P\d+)(\w*)')
        match = sample.search(input_str)
    #return [match.group(1), match.group(2)]
        return match.group(2), match.group(1)

#-----------function to get tissue group-------------------------------------------------
meta_path='/home/share/kkbkvxu5/home/jingjinli/01.projects/01.epimap/01.impute'
def make_bar_dict(input_file):
    '''we will make dict for bar meta info'''
    df = pd.read_csv(input_file, sep = '\t')
    #df['value'] = df[['tissue_group_v3', 'Ontology.stage', 'Ontology.breed', 'Ontology.tissue_type', 'sex']].apply(lambda row: '\t'.join(map(str,
#row)), axis=1)
    tissueGroup_dict = dict(zip(df['real_id'].str.strip(), df['tissue_group_v1'].str.strip()))
    #stage_dict = dict(zip(df['real_id'].str.strip(), df['Ontology.stage'].str.strip()))
    #breed_dict = dict(zip(df['real_id'].str.strip(), df['Ontology.breed'].str.strip()))
    #tissueType_dict = dict(zip(df['real_id'].str.strip(), df['Ontology.tissue_type'].str.strip()))
    #sex_dict = dict(zip(df['real_id'].str.strip(), df['sex'].str.strip()))
    #return tissueGroup_dict, stage_dict, breed_dict, tissueType_dict, sex_dict
    return tissueGroup_dict

tissueGroup_dict = make_bar_dict(os.path.join(meta_path, '20231114_for_ImpHeatmap_and_Umap_20231203_byHand_for_color.txt')) 

#------------function to separate all individuals into base and verify-----------------------------------------------
def separate_samples(input_path):
    '''at first, we try to separate files and try to make them even, so that we can have base and verfication for SAGAconf;
    but after we get the low r-value, we had meeting with Mehdi, we will make this totally even, so we will get a copy for both 
    base and verify if we can not separate them equally'''
    big_dict = defaultdict(list)
    base_list = defaultdict(list)
    verify_list = defaultdict(list)

    sample_names = [re.split(r'_', i)[0] for i in os.listdir(input_path) if i.endswith('_chr1_posterior.txt')]
    for i in sample_names:
        # this is the real tissue by hand define
        tissue_with_blank_in_name = tissueGroup_dict[i]
        tissue = tissue_with_blank_in_name.replace(' ', '_')
        #if tissue == 'PRJEB51716Heart':
        #    print(i, tissue, individual)
        big_dict[tissue].append(i)

    #print(big_dict['PRJEB51716Heart'])
    
    # this is to try to evenly separate individuals for each tissue in each project
    # if it can be evenly divided, we will divide them;
    # if it can not be divided, we will give them both to base and verify, we can not give them to both base and verify, this is like 
    # leaking test data. If we cannot evenly separate, we will have to discard sample or even the whole tissue
    for tissue in big_dict:
        # these two list must be emptied every time before use!!!!!!!!!!!!!!!!!!!!!!!
        first_half = []
        second_half = []
        individual_list = big_dict[tissue]
        # this means can be evenly divided
        if len(individual_list) % 2 == 0 and len(individual_list) >= 2:
            # this way, we can separate P348 and P350, they are always together
            first_half = individual_list[::2]  # 获取奇数索引元素
            second_half = individual_list[1::2]  # 获取偶数索引元素
            #print(first_half, second_half)
        # this means can not be evenly divided
        elif len(individual_list) % 2 != 0 and len(individual_list) >= 3:
            # we will pop the last individual
            last_individual = individual_list.pop()
            first_half = individual_list[::2]  # 获取奇数索引元素
            second_half = individual_list[1::2]  # 获取偶数索引元素
            # add the last individual back to both base and verify
            # according to Mehdi's email, this is like to leak training data to test data, we need to discard these data
            #first_half.append(last_individual)
            #second_half.append(last_individual)
            
        # we will perform further process only if the list is not blank
        # k is individual
        if first_half:
            for k in first_half:
                file_name = k
                base_list[tissue].append(file_name)

            # p is individual
            for p in second_half:
                file_name1 = p
                verify_list[tissue].append(file_name1)

    return base_list, verify_list

base_files, verify_files = separate_samples(posterior_path)
#print(base_files)
#print(verify_files)
# with open('base_test', 'wt') as F:
#     for i in base_files:
#         print(i, file = F)

# with open('verify_test', 'wt') as F:
#     for i in base_files:
#         print(i, file = F)

#---------------actually move files to base and verify folder-----------------------------------------------
def move_files_to_target_folder(input_list, folder_type):
    '''we will move files to their destination folder;
    folder type is base or verify, so we know which destination foler should go'''
    # base_path = os.path.join(chromHMM_path, 'base')
    # verify_path = os.path.join(chromHMM_path, 'verif')
    #
    # os.makedirs(base_path, exist_ok = True)
    #
    # os.makedirs(verify_path, exist_ok = True)
    
    if folder_type == 'base':
        for tissue in input_list:
            base_path = os.path.join(chromHMM_path, 'base_' + tissue)
            os.makedirs(base_path, exist_ok = True)
            for i in input_list[tissue]:
                for j in chrs:
                    # 15 means 15 chromHMM chromatin states, number_of_states
                    tmp_file_name = '_'.join([i, str(number_of_states), j, 'posterior.txt'])
                    source_path = os.path.join(posterior_path, tmp_file_name)
                    destination_path = os.path.join(base_path, tmp_file_name)
    
                    #print(source_path, destination_path)
                    os.symlink(source_path, destination_path)
                    #shutil.move(source_path, destination_path)
    elif folder_type == 'verify':
        for tissue in input_list:
            verify_path = os.path.join(chromHMM_path, 'verif_' + tissue)
            os.makedirs(verify_path, exist_ok = True)
            for i in input_list[tissue]:
                for j in chrs:
                    # 15 means 15 chromHMM chromatin states, number_of_states
                    tmp_file_name = '_'.join([i, str(number_of_states), j, 'posterior.txt'])
                    source_path = os.path.join(posterior_path, tmp_file_name)
                    destination_path = os.path.join(verify_path, tmp_file_name)
    
                    os.symlink(source_path, destination_path)
                    #shutil.move(source_path, destination_path)
                    #print(source_path, destination_path)

move_files_to_target_folder(base_files, 'base')
move_files_to_target_folder(verify_files, 'verify')





