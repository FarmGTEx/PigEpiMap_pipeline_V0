
export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human_promoter_1025/Skeletal_Muscle --kmer -1 --run_name human_promoter_1025_Skeletal_Muscle --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 85 --output_dir ./train_output/human_promoter_1025/Skeletal_Muscle --evaluation_strategy steps --eval_steps 85 --warmup_steps 50 --logging_steps 85 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human_promoter_1025/Liver --kmer -1 --run_name human_promoter_1025_Liver --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 21 --output_dir ./train_output/human_promoter_1025/Liver --evaluation_strategy steps --eval_steps 21 --warmup_steps 50 --logging_steps 21 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human_promoter_1025/Adipose --kmer -1 --run_name human_promoter_1025_Adipose --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 14 --output_dir ./train_output/human_promoter_1025/Adipose --evaluation_strategy steps --eval_steps 14 --warmup_steps 50 --logging_steps 14 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human_promoter_1025/Heart --kmer -1 --run_name human_promoter_1025_Heart --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 56 --output_dir ./train_output/human_promoter_1025/Heart --evaluation_strategy steps --eval_steps 56 --warmup_steps 50 --logging_steps 56 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human_promoter_1025/Spleen --kmer -1 --run_name human_promoter_1025_Spleen --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 124 --output_dir ./train_output/human_promoter_1025/Spleen --evaluation_strategy steps --eval_steps 124 --warmup_steps 50 --logging_steps 124 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e1_e10_1025/Skeletal_Muscle --kmer -1 --run_name pig_e1_e10_1025_Skeletal_Muscle --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 732 --output_dir ./train_output/pig_e1_e10_1025/Skeletal_Muscle --evaluation_strategy steps --eval_steps 732 --warmup_steps 50 --logging_steps 732 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e1_e10_1025/Liver --kmer -1 --run_name pig_e1_e10_1025_Liver --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 554 --output_dir ./train_output/pig_e1_e10_1025/Liver --evaluation_strategy steps --eval_steps 554 --warmup_steps 50 --logging_steps 554 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e1_e10_1025/Adipose --kmer -1 --run_name pig_e1_e10_1025_Adipose --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 482 --output_dir ./train_output/pig_e1_e10_1025/Adipose --evaluation_strategy steps --eval_steps 482 --warmup_steps 50 --logging_steps 482 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e1_e10_1025/Heart --kmer -1 --run_name pig_e1_e10_1025_Heart --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 573 --output_dir ./train_output/pig_e1_e10_1025/Heart --evaluation_strategy steps --eval_steps 573 --warmup_steps 50 --logging_steps 573 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e1_e10_1025/Spleen --kmer -1 --run_name pig_e1_e10_1025_Spleen --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 254 --output_dir ./train_output/pig_e1_e10_1025/Spleen --evaluation_strategy steps --eval_steps 254 --warmup_steps 50 --logging_steps 254 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e1_1025/Skeletal_Muscle --kmer -1 --run_name pig_e1_1025_Skeletal_Muscle --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 588 --output_dir ./train_output/pig_e1_1025/Skeletal_Muscle --evaluation_strategy steps --eval_steps 588 --warmup_steps 50 --logging_steps 588 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e1_1025/Liver --kmer -1 --run_name pig_e1_1025_Liver --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 411 --output_dir ./train_output/pig_e1_1025/Liver --evaluation_strategy steps --eval_steps 411 --warmup_steps 50 --logging_steps 411 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e1_1025/Adipose --kmer -1 --run_name pig_e1_1025_Adipose --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 399 --output_dir ./train_output/pig_e1_1025/Adipose --evaluation_strategy steps --eval_steps 399 --warmup_steps 50 --logging_steps 399 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e1_1025/Heart --kmer -1 --run_name pig_e1_1025_Heart --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 375 --output_dir ./train_output/pig_e1_1025/Heart --evaluation_strategy steps --eval_steps 375 --warmup_steps 50 --logging_steps 375 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e1_1025/Spleen --kmer -1 --run_name pig_e1_1025_Spleen --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 185 --output_dir ./train_output/pig_e1_1025/Spleen --evaluation_strategy steps --eval_steps 185 --warmup_steps 50 --logging_steps 185 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e10_1025/Skeletal_Muscle --kmer -1 --run_name pig_e10_1025_Skeletal_Muscle --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 148 --output_dir ./train_output/pig_e10_1025/Skeletal_Muscle --evaluation_strategy steps --eval_steps 148 --warmup_steps 50 --logging_steps 148 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e10_1025/Liver --kmer -1 --run_name pig_e10_1025_Liver --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 154 --output_dir ./train_output/pig_e10_1025/Liver --evaluation_strategy steps --eval_steps 154 --warmup_steps 50 --logging_steps 154 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e10_1025/Adipose --kmer -1 --run_name pig_e10_1025_Adipose --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 87 --output_dir ./train_output/pig_e10_1025/Adipose --evaluation_strategy steps --eval_steps 87 --warmup_steps 50 --logging_steps 87 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e10_1025/Heart --kmer -1 --run_name pig_e10_1025_Heart --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 224 --output_dir ./train_output/pig_e10_1025/Heart --evaluation_strategy steps --eval_steps 224 --warmup_steps 50 --logging_steps 224 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=0
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e10_1025/Spleen --kmer -1 --run_name pig_e10_1025_Spleen --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 73 --output_dir ./train_output/pig_e10_1025/Spleen --evaluation_strategy steps --eval_steps 73 --warmup_steps 50 --logging_steps 73 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20
