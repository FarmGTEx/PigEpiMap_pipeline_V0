import re, os

def prepare_tissue_names(input_path):
    '''we will print all the tissue names for batch dsub'''
    verify_directories = [re.split(r'_', d, 1)[1] for d in os.listdir(input_path) if os.path.isdir(os.path.join(input_path, d)) and d.startswith('verif_')]
    #for i in set(verify_directories):
    #    print(i)
    print(*set(verify_directories), sep=' ')

prepare_tissue_names('/home/kkbkvxu5/whcs-share36/01.work/01.epimap/01.chromHMM_align_with_umap/chromHMM_model_n200_s12')