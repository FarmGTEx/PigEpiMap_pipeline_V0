#!/usr/bin/env python
# -*- coding: utf-8 -*-
# python >= 3.6

#####Import Module#####
import sys
import os
import argparse
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..'))  # NOQA: E402
from utils.functions import init_logger, init_dir, init_software, run_cmd_time, jude_file_length
#####Description####
usage = '''
@Date    : 2023-08-18 10:03:40
@Author  : jwdou
@Link    : http://ianimal.pro
Version: v2.0
Description:
    一个sample中的多个fastq文件合并为一个文件
    利用fastp将read自动截取成50bp
    fastp 0.23.2
    
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
    outdir = init_dir(os.path.normpath(f"{args.output}/QC/{bn}"))
    # 初始化日志
    logger = init_logger(
        level=args.verbose, filepath=f"{outdir}/{bn}.log", verbose=True)
    # 检测软件
    software=init_software(["fastp"])
    # 执行生信流程
    files = jude_file_length(args.reads, bn)
    print(type(files))
    if len(files) == 1:
        i = len(files)
        cmd = f"{software['fastp']} -w {args.threads} -b 50 -B 50 -i {args.reads}/{files[0]} -o {outdir}/{bn}.SE0{str(i)}.fq.gz  --html {outdir}/{bn}.SE0{str(i)}.html --json {outdir}/{bn}.SE0{str(i)}.json"
        run_cmd_time(cmd,f"QC SE0{i} for {bn}")
    else:
        i = 1
        cmd = f"{software['fastp']} -w {args.threads}  -b 50 -B 50 -i {args.reads}/{files[0]} -I {args.reads}/{files[1]} -o {outdir}/{bn}_1.PE0{str(i)}.fq.gz -O {outdir}/{bn}_2.PE0{str(i)}.fq.gz --html {outdir}/{bn}.PE0{str(i)}.html --json {outdir}/{bn}.PE0{str(i)}.json"
        run_cmd_time(cmd, f"QC PE0{i} for {bn}")

if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        sys.stderr.write("User interrupt me! ;-) See you!\n")
        sys.exit(0)