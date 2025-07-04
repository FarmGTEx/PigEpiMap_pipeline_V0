#!/usr/bin/env python
# -*- coding: utf-8 -*-
# python >= 3.6

#####Import Module#####
import sys
import os
import argparse
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))  # NOQA: E402
from utils.functions import init_logger, auto_pairs, join_samples, init_dir, init_software, run_cmd_time, jude_file_length, get_random_lines_from_file, bedpetotagalign
#####Description####
usage = '''
@Date    : 2023-08-18 10:03:40
@Author  : jwdou
@Link    : http://ianimal.pro
Version: v2.0
Description:
    利用bedtools去掉blacklist的read
    利用bedtools只保留落到white list的reads
    
    双端数据：
    chromap 无法生成paired文件 ---- 自己用awk命令来进行处理
    bedtools只能处理6列bed，无法处理每2行为一个单位的read pair ---- 接上一步，做成bedpe后用pairToBed来处理
    chromap 0.2.5-r473
    bedtools 2.31.1
    
Example:
    python {} [-h] -r READS [-t THREADS] [-o OUTPUT]
'''.format(__file__[__file__.rfind(os.sep) + 1:])

## Parameter Configuration ##
def get_params():
    #创建解析器
    class HelpFormatter(argparse.RawDescriptionHelpFormatter, argparse.ArgumentDefaultsHelpFormatter):
        pass
    parser = argparse.ArgumentParser(
        formatter_class=HelpFormatter, description=usage)
    #添加参数
    parser.add_argument(
        '-r', '--reads', help='reads dir', required=True, type=str)
    parser.add_argument(
        '-t', '--threads', help='threads numbers', default=8, type=int)
    parser.add_argument(
        '-e', '--epigenome', help='epigenome type', default='chip', type=str)
    parser.add_argument(
        '-i', '--index', help='chromap index', default='None', dest='index', type=str)
    parser.add_argument(
        '-g', '--genome', help='genome file', default='None', dest='genome', type=str)
    parser.add_argument(
        '-b', '--blacklist', help='blacklist bed', default='None', dest='blacklist', type=str)
    parser.add_argument(
        '-w', '--whitelist', help='whitelist bed', default='None', dest='whitelist', type=str)
    parser.add_argument(
        '-o', '--output', help='output dir', default="./", type=str)
    parser.add_argument('-v', '--verbose', help='verbosely print information. -vv for printing debug information',
                        action="count", default=0)
    # 解析参数
    return parser.parse_args()

#####Main#####
def main():
    # 获取参数
    args = get_params()
    # 初始化路径
    bn = os.path.basename(args.reads)
    outdir = init_dir(os.path.normpath(f"{args.output}/mapping/{bn}"))
    # tmpdir = init_dir(os.path.normpath(f"{args.output}/tmp"))
    # 初始化日志
    logger = init_logger(
        level=args.verbose, filepath=f"{outdir}/{bn}.log", verbose=True)
    # 检测软件
    software = init_software(["chromap", "pigz", 'bedtools'])
    # 执行生信流程
    single_files, paired_files = auto_pairs(args.reads)
    samples = join_samples(single_files, paired_files, args.reads)
    if len(samples) == 3:
        logger.error(f"不支持混合模式{bn}！")
        exit(4)   
    elif len(samples) == 2:
        i = 1
        ##step01
        cmd = f"{software['chromap']} --preset {args.epigenome} -t {args.threads} -x {args.index} -r {args.genome} -1  {samples[0]} -2  {samples[1]} --TagAlign -o {outdir}/{bn}.tagAlign > {outdir}/{bn}.stat 2>&1"
        run_cmd_time(cmd,f"chromap PE0 for {bn}")
        
        ##step02
        cmd = f"""awk '{{ORS=NR%2?FS:RS}}1' {outdir}/{bn}.tagAlign | awk  '{{OFS="\t"}}{{print $1, $2, $3, $7, $8, $9, $4, $5"@"$11, $6, $12}}' > {outdir}/{bn}.bedpe"""
        run_cmd_time(cmd,f"tagAlign {bn} to bedpaied")
        
        ##step03
        cmd = f'pairToBed -type neither -a {outdir}/{bn}.bedpe -b {args.blacklist} > {outdir}/{bn}_blacklist.bedpe'
        run_cmd_time(cmd,f"remove blacklist for {bn}")
        
        ##step04
        cmd = f"""pairToBed -type both -a {outdir}/{bn}_blacklist.bedpe -b {args.whitelist} |awk '{{OFS="\t"}}{{print $1, $2, $3, $4, $5, $6, $7, $8, $9, $10}}' | sort -k1,1 -k2,2n | uniq > {outdir}/{bn}_whitelist.bedpe"""
        run_cmd_time(cmd,f"reserve whitelist for {bn}")
        
        #step05
        cut = get_random_lines_from_file(f'{outdir}/{bn}_whitelist.bedpe', f'{outdir}/{bn}.30M.tagAlign', '30M')
        bedtotag = bedpetotagalign(f'{outdir}/{bn}.30M.tagAlign', f'{outdir}/{bn}.new.tagAlign')
        
        
        # blacklist = f"{software['bedtools']} intersect -a {outdir}/{bn}.tagAlign -b {args.blacklist} -v > {outdir}/{bn}_black.tagAlign"
        # run_cmd_time(blacklist,f"bedtools blacklist PE0{i} for {bn}")
        # whitelist = f"{software['bedtools']} intersect -a {outdir}/{bn}_black.tagAlign -b {args.whitelist} -wa -u > {outdir}/{bn}_white.tagAlign"
        # run_cmd_time(whitelist,f"bedtools whitelist PE0{i} for {bn}")
        
        # cut = get_random_lines_from_file(f'{outdir}/{bn}_white.tagAlign', f'{outdir}/{bn}.new.tagAlign', '30M')
    elif len(samples) == 1:
        i = len(samples)
        cmd = f"{software['chromap']} --preset {args.epigenome} -t {args.threads} -x {args.index} -r {args.genome} -1 {samples[0]} --TagAlign -o {outdir}/{bn}.tagAlign > {outdir}/{bn}.stat 2>&1"
        run_cmd_time(cmd,f"chromap SE0 for {bn}")
        
        blacklist = f"{software['bedtools']} intersect -a {outdir}/{bn}.tagAlign -b {args.blacklist} -v > {outdir}/{bn}_blacklist.tagAlign"
        run_cmd_time(blacklist,f"bedtools blacklist SE0{i} for {bn}")
        
        whitelist = f"{software['bedtools']} intersect -a {outdir}/{bn}_blacklist.tagAlign -b {args.whitelist} -wa -u > {outdir}/{bn}_whitelist.tagAlign"
        run_cmd_time(whitelist,f"bedtools whitelist SE0{i} for {bn}")
        
        cut = get_random_lines_from_file(f'{outdir}/{bn}_whitelist.tagAlign', f'{outdir}/{bn}.new.tagAlign', '30M')
    else:
        logger.error(f"{bn} 中不包含有效序列！")
        exit(4)   
    ###删除中间文件、压缩结果文件
    cmd = f"{software['pigz']} -p {args.threads} {outdir}/{bn}.new.tagAlign"
    run_cmd_time(cmd, f'pigz for {bn}')
    
    # os.system(f'rm {outdir}/{bn}_black.tagAlign')
    # os.system(f'rm {outdir}/{bn}_white.tagAlign')
    # os.system(f'rm {outdir}/{bn}.tagAlign')
    # os.system(f'rm {outdir}/{bn}/*.fq.gz')
if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        sys.stderr.write("User interrupt me! ;-) See you!\n")
        sys.exit(0)