
export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human/promoter_513 --kmer -1 --run_name human_promoter_513 --model_max_length 129 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 264 --output_dir ./train_output/human/promoter_513 --evaluation_strategy steps --eval_steps 264 --warmup_steps 50 --logging_steps 264 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human/enhancer_513 --kmer -1 --run_name human_enhancer_513 --model_max_length 129 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 1378 --output_dir ./train_output/human/enhancer_513 --evaluation_strategy steps --eval_steps 1378 --warmup_steps 50 --logging_steps 1378 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human/promoter_enhancer_513 --kmer -1 --run_name human_promoter_enhancer_513 --model_max_length 129 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 1643 --output_dir ./train_output/human/promoter_enhancer_513 --evaluation_strategy steps --eval_steps 1643 --warmup_steps 50 --logging_steps 1643 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human/promoter_1025 --kmer -1 --run_name human_promoter_1025 --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 264 --output_dir ./train_output/human/promoter_1025 --evaluation_strategy steps --eval_steps 264 --warmup_steps 50 --logging_steps 264 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human/enhancer_1025 --kmer -1 --run_name human_enhancer_1025 --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 1378 --output_dir ./train_output/human/enhancer_1025 --evaluation_strategy steps --eval_steps 1378 --warmup_steps 50 --logging_steps 1378 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human/promoter_enhancer_1025 --kmer -1 --run_name human_promoter_enhancer_1025 --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 1643 --output_dir ./train_output/human/promoter_enhancer_1025 --evaluation_strategy steps --eval_steps 1643 --warmup_steps 50 --logging_steps 1643 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig/e1_513 --kmer -1 --run_name pig_e1_513 --model_max_length 129 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 2045 --output_dir ./train_output/pig/e1_513 --evaluation_strategy steps --eval_steps 2045 --warmup_steps 50 --logging_steps 2045 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig/e4e5_513 --kmer -1 --run_name pig_e4e5_513 --model_max_length 129 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 1867 --output_dir ./train_output/pig/e4e5_513 --evaluation_strategy steps --eval_steps 1867 --warmup_steps 50 --logging_steps 1867 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig/e10_513 --kmer -1 --run_name pig_e10_513 --model_max_length 129 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 896 --output_dir ./train_output/pig/e10_513 --evaluation_strategy steps --eval_steps 896 --warmup_steps 50 --logging_steps 896 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig/e1_e10_513 --kmer -1 --run_name pig_e1_e10_513 --model_max_length 129 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 2821 --output_dir ./train_output/pig/e1_e10_513 --evaluation_strategy steps --eval_steps 2821 --warmup_steps 50 --logging_steps 2821 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig/e1_e4e5_e10_513 --kmer -1 --run_name pig_e1_e4e5_e10_513 --model_max_length 129 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 4638 --output_dir ./train_output/pig/e1_e4e5_e10_513 --evaluation_strategy steps --eval_steps 4638 --warmup_steps 50 --logging_steps 4638 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig/e1_1025 --kmer -1 --run_name pig_e1_1025 --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 2045 --output_dir ./train_output/pig/e1_1025 --evaluation_strategy steps --eval_steps 2045 --warmup_steps 50 --logging_steps 2045 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig/e4e5_1025 --kmer -1 --run_name pig_e4e5_1025 --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 1867 --output_dir ./train_output/pig/e4e5_1025 --evaluation_strategy steps --eval_steps 1867 --warmup_steps 50 --logging_steps 1867 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig/e10_1025 --kmer -1 --run_name pig_e10_1025 --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 896 --output_dir ./train_output/pig/e10_1025 --evaluation_strategy steps --eval_steps 896 --warmup_steps 50 --logging_steps 896 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig/e1_e10_1025 --kmer -1 --run_name pig_e1_e10_1025 --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 2821 --output_dir ./train_output/pig/e1_e10_1025 --evaluation_strategy steps --eval_steps 2821 --warmup_steps 50 --logging_steps 2821 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig/e1_e4e5_e10_1025 --kmer -1 --run_name pig_e1_e4e5_e10_1025 --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 4638 --output_dir ./train_output/pig/e1_e4e5_e10_1025 --evaluation_strategy steps --eval_steps 4638 --warmup_steps 50 --logging_steps 4638 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20

