# -*- coding: utf-8 -*-
# python >= 2.7

#####Import Module#####
import logging
import sys
import os
import math
import time
import argparse
import glob
import re
from functools import wraps,partial
from collections import defaultdict
import gzip
from multiprocessing import Pool
import subprocess

#####Description####
usage = '''
@Date    : 2022-06-24 16:07:16
@Author  : Your Name (you@example.org)
@Link    : http://example.org
@Version : $Id$
Description:
    This script is used to average Hi-C files.
    required ABC-Enhancer-Gene-Prediction
    required juicebox
Example:
    python {} [-i input] [-o output]
Step:

'''.format(__file__[__file__.rfind(os.sep) + 1:])


#####decorator#####
def timeit(function):
    '''
    用装饰器实现函数计时
    :param function: 需要计时的函数
    :return: None
    '''
    @wraps(function)
    def function_timer(*args, **kwargs):
        print('[Function: {name} start...]'.format(name = function.__name__))
        t0 = time.time()
        result = function(*args, **kwargs)
        t1 = time.time()
        print('[Function: {name} finished, spent time: {time:.2f}s]'.format(name = function.__name__,time = t1 - t0))
        return result
    return function_timer


#####HelpFormat#####
class HelpFormatter(argparse.RawDescriptionHelpFormatter, argparse.ArgumentDefaultsHelpFormatter):
    pass

def check_software(software_path):
    if os.path.exists(software_path):
        logging.debug("Choose software:" + software_path + "!")
    else:
        output = os.popen('which ' + software_path)
        software_temp = output.read().strip()
        if os.path.exists(software_temp):
            software_path = software_temp
            logging.debug("Choose software:" + software_path + "!")
        else:
            logging.error("Can't locate the " + software_path + "!")
            exit(1)
    return software_path

def show_info(text):
    now_time = time.time()
    logging.info(text)
    return now_time

def run_cmd(cmd):
    logging.info(cmd)
    flag = os.system(cmd)
    if flag != 0:
        logging.error("Command fail: " + cmd)
        exit(2)
    return 0

def run_time(start_time):
    spend_time = time.time() - start_time
    logging.info("Total  spend time : " + fmt_time(spend_time))
    return 0

def fmt_time(spend_time):
    spend_time = int(spend_time)
    day = 24 * 60 * 60
    hour = 60 * 60
    min = 60
    if spend_time < 60:
        return "%ds" % math.ceil(spend_time)
    elif spend_time > day:
        days = divmod(spend_time, day)
        return "%dd%s" % (int(days[0]), fmt_time(days[1]))
    elif spend_time > hour:
        hours = divmod(spend_time, hour)
        return '%dh%s' % (int(hours[0]), fmt_time(hours[1]))
    else:
        mins = divmod(spend_time, min)
        return "%dm%ds" % (int(mins[0]), math.ceil(mins[1]))

def parse_args():
    parser = argparse.ArgumentParser(
        formatter_class=HelpFormatter, description=usage)
    parser.add_argument('-i', '--input',
                        help='wig files path', dest='input', type=str)
    parser.add_argument('-o', '--output',
                        help='output path', dest='output', type=str)
    args = parser.parse_args()
    
    
    return args
    
    
@timeit
def main():
    args = parse_args()

    tissue = os.path.basename(args.input).split(".")[0]

    gtf = "./01data/tissue_gtf/chromHMM_" + tissue + ".gtf"

    output_dir = args.output + "/" + tissue

    cmd = "STARE.sh -c 20 -b %s -a %s -w 500000 -m 500000 -g ./01data/Genome/real_genome.fa -s ./01data/PFM/Sus_scrofa_motif_all_new.PFM -o %s -n 4+ -f ./01data/hic -k 1000 -t 0.02" % (
        args.input, gtf, output_dir)

    os.system(cmd)
        
            
if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        sys.stderr.write("User interrupt me! ;-) See you!\n")
        sys.exit(0)
           