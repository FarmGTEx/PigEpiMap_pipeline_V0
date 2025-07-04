import re, os

def make_dict(input_file):
    '''we will make dict for md5'''
    big_dict = dict()
    with open(input_file, 'rt') as f:
        for line in f:
            line_list = re.split(r'\s+', line.strip())
            md5 = line_list[0]
            raw_name = line_list[1]
            name = re.split(r'\/', raw_name)[-1]
            big_dict[name] = big_dict.get(name, md5)
    return big_dict

zuozhong = make_dict('md5_CONVERTEDDATADIR_merged_zuozhong.txt')
whcs = make_dict('md5_CONVERTEDDATADIR_merged_whcs.txt')

for i in zuozhong:
    a = zuozhong[i]
    b = whcs[i]
    if a != b:
        print(i)
    else:
        print('good')
