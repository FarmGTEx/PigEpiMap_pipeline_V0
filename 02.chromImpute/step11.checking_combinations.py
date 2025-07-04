# when we get all good obs, and uget all imp that do not overlap with existed good obs, we need to checking the combinations to see
# if we have mixed obs and imp that cover the whole coverage of sample-mark combination!

import re, os

def make_whole_combination(input_file):
    '''we will make whole combination'''
    big_set = []
    
    mark_set = []
    sample_set = []
    with open(input_file, 'rt') as f:
        for line in f:
            line_list = re.split(r'\t', line.strip())
            sample = line_list[0]
            #print(sample)
            mark = line_list[1]
            
            mark_set.append(mark)
            sample_set.append(sample)
            
        for i in set(mark_set):
            for j in set(sample_set):
                big_set.append(j+'_'+i)
    
    return set(big_set)

whole_combination = make_whole_combination('test_samplemarktable_all.txt')

def make_set_for_obs_or_imp(input_path):
    '''we will make set for obs or imp data'''
    all = []
    files = [i for i in os.listdir(input_path) if i.endswith('.wig.gz')]
    for i in files:
        name_list = re.split(r'[\._]', i)
        # in OUTPUTDATA dir and OUTPUTDATA_merged dir, files have different pre-fix, so we use this way to avoid distinguish between them
        sample_mark = name_list[-4] + '_' + name_list[-3]
        all.append(sample_mark)
    return set(all)

good_obs = make_set_for_obs_or_imp('good_obs_mimic_imp')
used_imp = make_set_for_obs_or_imp('softlink_OUTPUTDATA')

# we found that PRJNA741351 only has H3K27me3, and its unique mapping ratio is low, if we remove these obs data, there will be no imp data to
# replace, so we could not remove them
print('missing sample and mark:')
print(whole_combination - (good_obs | used_imp))
print('duplicate sample and mark:')
print((good_obs | used_imp) - whole_combination)

