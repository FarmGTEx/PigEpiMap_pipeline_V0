import re, os
from collections import defaultdict

input_path = '/home/kkbkvxu5/whcs-share36/01.work/01.epimap/01.chromHMM_align_with_umap/chromHMM_model_n200_s12'
new_path = '/home/kkbkvxu5/whcs-share36/01.work/01.epimap/01.chromHMM_align_with_umap/sagaconf_tissue_transformed'

saga_path = [d for d in os.listdir(input_path) if os.path.isdir(os.path.join(input_path, d)) and d.startswith('sagaconf_')]
#saga_path = ['sagaconf_Ileum', 'sagaconf_Caecum', 'sagaconf_B_cell']
#print(saga_path)

os.makedirs(new_path, exist_ok = True)

def make_switch_dict(input_file):
    '''we will switch states annotation from li to zhou'''
    big_dict = dict()
    with open(input_file, 'rt') as f:
        for line in f:
            if not line.startswith('Li'):
                line_list = re.split(r'\t', line.strip())
                key = line_list[0][1:]
                value = line_list[1]
                big_dict[key] = big_dict.get(key, value)
    return big_dict

states_corresponding = make_switch_dict('li_zhou_states_408s12.txt')
#print(states_corresponding)

def change_states():
    '''we will change states'''
    for target_path in saga_path:
        tissue = re.split(r'_', target_path, 1)[1]
        output_file_name = 'chromHMM_' + tissue + '.bed'
        target_file = os.path.join(input_path, target_path, 'r_values.bed')
        with open(target_file, 'rt') as f, open(os.path.join(new_path, output_file_name), 'wt') as F:
            for line in f:
                if not 'r_value' in line:
                    line_list = re.split(r'\t', line.strip())
                    # we need to transfer posterior0 to posterior1, then we can transfer E1(Li) to EX(Zhou) 
                    raw_state = str(int(line_list[3][9:]) + 1)
                    real_state = states_corresponding[raw_state]
                    r_value = "{:.2f}".format(float(line_list[-1]))
                    print('\t'.join(line_list[:3]), real_state, r_value, sep = '\t', file = F)
                    
change_states()

