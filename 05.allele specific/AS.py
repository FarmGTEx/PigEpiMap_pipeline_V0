#!/usr/bin/env python
# -*- coding: utf-8 -*-
# python >= 3.6

#####Import Module#####
import sys
import os
import argparse
import logging
import time
import subprocess
import math
from difflib import SequenceMatcher
import glob
import re



#####Description####
usage = '''
@Date    : 2024-2-21
@Author  : jwdou
@Link    : http://ianimal.pro
Version: v2.0
Description:
    AS analysis
    
    fastp 0.23.2
    hisat2 2.2.1
    samtools 1.18
    gatk 4.5.0.0
    picard 3.1.1
    bedtools 2.31.1
    
    
Example:
    python {} [-h] -r READS [-t THREADS] [-o OUTPUT]
'''.format(__file__[__file__.rfind(os.sep) + 1:])



def check_software(software_path):
    if software_path == 'ftp':
        software = 'wget'
    elif software_path == 'http':
        software = 'wget'
    elif software_path == 'aws':
        software = 'wget'
    else:
        software = software_path
    if os.path.exists(software):
        logging.debug("Choose software:" + software + "!")
    else:
        output = os.popen('which ' + software)
        software_temp = output.read().strip()
        if os.path.exists(software_temp):
            software = software_temp
            logging.debug("Choose software:" + software + "!")
        else:
            logging.error("Can't locate the " + software + "!")
            exit(1)
    return software 


def fmt_time(spend_time):  # sourcery skip: avoid-builtin-shadow, move-assign
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

def run_cmd_time(cmd):
    start_time = time.time()
    #logging.info(f"=========={task_description} is start!==========")
    try:
        logging.info(cmd)
        res=subprocess.getstatusoutput(cmd)
        spend_time = time.time() - start_time
        logging.info(
            f"共耗时: {fmt_time(spend_time)} ({spend_time}s)")
        if res[0] != 0:
            logging.error(f"Command fail: {cmd}")
            exit(3)
    except Exception:
        logging.error("无法正常执行上述任务！")
        

def similarity(a, b):
    return SequenceMatcher(None, a, b).ratio()
       
def auto_pairs(path):  # sourcery skip: use-next
    files = glob.glob(f"{path}/*.gz")
    files = sorted([os.path.basename(x) for x in files])
    single_files = []
    paired_files = []
    while len(files):
        f1 = files[0]
        files.remove(f1)
        if len(files):
            for f2 in files:
                flag = 1
                ss = similarity(f1, f2)
                if int(ss*len(f1)) == len(f1)-1 and len(f1) == len(f2):
                    diff_flag = 0
                    for k in range(len(f1)):  # 差异的字符为1和2，且要求前面的字符不是数字，可以根据需求调整
                        if f1[k] != f2[k] and f1[k] == "1" and f2[k] == "2" and "unpaired" not in f1 and re.findall("\D", f1[k-1]):
                            diff_flag = 1
                            break
                    if diff_flag:
                        paired_files.append(sorted([f1, f2]))
                        files.remove(f2)
                        flag = 0
                        break
            if flag:
                single_files.append(f1)
        else:
            single_files.append(f1)
    return single_files, paired_files    
        
        
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
        '-t', '--threads', help='threads numbers', default=1, type=int)
    parser.add_argument(
        '-g', '--genome', help='genome_fa', default='Sus_scrofa.Sscrofa11.1.dna.primary_assembly.18.fa', type=str)
    parser.add_argument(
        '-f', '--vcf', help='vcf_file', default='vcf file', type=str)
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
    fastp = check_software('fastp')
    hisat2_extract_snps_haplotypes = check_software('hisat2_extract_snps_haplotypes_VCF.py')
    hisat2_build = check_software('hisat2-build')
    hisat2 = check_software('hisat2')
    #picard = check_software('picard.jar')
    samtools = check_software('samtools')
    gatk = check_software('gatk')
    SNP_genotype_prefix = 'pig11_chr1_18'
    hisat2_genome_index_prefix = '/public/home/jwdou/05Analysis/imputation/ljj_scripts/hisat2_index.pig11_chr_all'
   # hisat2_genome_index_prefix = '/public/home/jwdou/05Analysis/imputation/graph/hisat2_index.pig11_chr1_18'
    
    #------------step 01: build all necessary index------------------------------------------------------------------------------------------
    # only need to be run once for each chr
    # build index for all necessary files, this only need to be run once!
    # use hisat2-own script to obtain SNP and genotype information for next graph-based reference building
    # phased genotype can help reduce memory usage!!#
#     cmd = f'python {hisat2_extract_snps_haplotypes} --non-rs {args.genome} {args.vcf} {SNP_genotype_prefix}'
#     run_cmd_time(cmd)
    
#     # build hisat2 index
#     cmd = f'{hisat2_build } --snp {SNP_genotype_prefix}.snp --haplotype {SNP_genotype_prefix}.haplotype {args.genome} {hisat2_genome_index_prefix}'
#     run_cmd_time(cmd)
    
#     # build index for genome fasta file, that will bed used by downstream GATK
#     cmd = f'java -jar {picard}  CreateSequenceDictionary R=Sus_scrofa.Sscrofa11.1.dna.primary_assembly.18.fa \
#  O=Sus_scrofa.Sscrofa11.1.dna.primary_assembly.18.dict'
#     run_cmd_time(cmd)
    
#     cmd = f'{samtools} faidx Sus_scrofa.Sscrofa11.1.dna.primary_assembly.18.fa'
#     run_cmd_time(cmd)
    
#     # build index for vcf file what will bed used by downstream GATK
#     cmd = f'{gatk} IndexFeatureFile -F chr18.onlineVCF.1241.recode.vcf'
#     run_cmd_time(cmd)
 
    #------------step 02: mapping for each sample--------------------------------------------------------------------------------------------

    # we need to seqtk and reads like the pipeline before???????????????

    # maaping by hisat2, this is graph-based mapping!
    # be careful about the name of fastq files!!!!!!!!!!!!!!!!!!!!!
    # paired-end data
    output_path = f'{args.output}/{bn}'
    if not os.path.exists(output_path):
        os.makedirs(output_path)
    single_files, paired_files = auto_pairs(args.reads)
    if single_files:
        
        cmd = f"{fastp} -w {args.threads} -i {args.reads}/*.fastq.gz -o {output_path}/{bn}.SE01.fq.gz  --html {output_path}/{bn}.SE01.html --json {output_path}/{bn}.SE01.json"
        run_cmd_time(cmd)
    
        cmd = f'{hisat2} -p {args.threads} --no-spliced-alignment --rg-id {bn} --rg SM:{bn} -x {hisat2_genome_index_prefix} \
 -U  {output_path}/{bn}.SE01.fq.gz -S {output_path}/{bn}.sam'
        run_cmd_time(cmd)
    if paired_files:
        cmd = f"{fastp} -w {args.threads} -i {args.reads}/*1*.gz -I {args.reads}/*2*.gz -o {output_path}/{bn}_1.PE02.fq.gz -O {output_path}/{bn}_2.PE02.fq.gz --html {output_path}/{bn}.PE02.html --json {output_path}/{bn}.PE02.json"
        run_cmd_time(cmd)
        cmd = f'{hisat2} -p {args.threads} --no-spliced-alignment --rg-id {bn} --rg SM:{bn} -x {hisat2_genome_index_prefix} \
    -1 {output_path}/{bn}_1.PE02.fq.gz -2{output_path}/{bn}_2.PE02.fq.gz -S {output_path}/{bn}.sam'
        run_cmd_time(cmd)
    
    
    # we need to keep the original bam file and remove sam file
    cmd = f'{samtools} view -S -b {output_path}/{bn}.sam | samtools sort -@ {args.threads} -o {output_path}/{bn}.sorted.bam'
    run_cmd_time(cmd)
    
    
    cmd = f'{samtools} index {output_path}/{bn}.sorted.bam'
    run_cmd_time(cmd)
    
    os.system(f'rm {output_path}/{bn}.sam')
    
    
    
    #------------step 03: merge sample and ASEreadCount--------------------------------------------------------------------------------------
    # here, we may need to merge all bam files, and then count reads for each CRE
    # if the chr does not has length, we need to add!
    # this is to get all count, so that we could calculate bias and have a global view
    cmd = f'{gatk} ASEReadCounter -R {args.genome} -I {output_path}/{bn}.sorted.bam \
 -V {args.vcf} --add-output-sam-program-record --create-output-bam-index -O {output_path}/{bn}.count_result.txt '
    run_cmd_time(cmd) 
    
    cmd = f'pigz -p 8 {output_path}/{bn}.count_result.txt' 
    run_cmd_time(cmd)
    
    
    #------------step 04: checking and bedtools for promoter and enhancer--------------------------------------------------------------------------------------
    cmd = f'/usr/bin/python3 /public/home/jwdou/05Analysis/imputation/ljj_scripts/step01.filter_alt_ref_improved.py {output_path}/{bn}.count_result.txt.gz 12'
    run_cmd_time(cmd)
    
    cmd = f'bedtools intersect -wa -wb -a {output_path}/{bn}.count_result.txt.gz.filtered.bed \
        -b /public/home/jwdou/05Analysis/imputation/ljj_scripts/merged.E4E5.bed \
        > {output_path}/enhancer.{bn}.count.bed'
    run_cmd_time(cmd)
    
    cmd = f'bedtools intersect -wa -wb -a {output_path}/{bn}.count_result.txt.gz.filtered.bed \
        -b /public/home/jwdou/05Analysis/imputation/ljj_scripts/merged.E1.bed \
        > {output_path}/promoter.{bn}.count.bed'
    run_cmd_time(cmd)
    # cmd = f'{samtools} view -h -b -L /public/home/jwdou/05Analysis/imputation/graph/merged.E4.bed {output_path}/{bn}.sorted.bam > {output_path}/{bn}.sorted.E4.bam'
    # run_cmd_time(cmd) 
    
    # cmd = f'pigz -p 8 {output_path}/{bn}.sorted.E4.bam' 
    # run_cmd_time(cmd)
    
if __name__ == '__main__':
    try:
        main()
    except KeyboardInterrupt:
        sys.stderr.write("User interrupt me! ;-) See you!\n")
        sys.exit(0)

