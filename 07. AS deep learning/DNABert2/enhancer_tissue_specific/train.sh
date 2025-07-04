
export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human_enhancer_1025/Skeletal_Muscle --kmer -1 --run_name human_enhancer_1025_Skeletal_Muscle --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 355 --output_dir ./train_output/human_enhancer_1025/Skeletal_Muscle --evaluation_strategy steps --eval_steps 355 --warmup_steps 50 --logging_steps 355 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human_enhancer_1025/Liver --kmer -1 --run_name human_enhancer_1025_Liver --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 62 --output_dir ./train_output/human_enhancer_1025/Liver --evaluation_strategy steps --eval_steps 62 --warmup_steps 50 --logging_steps 62 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human_enhancer_1025/Adipose --kmer -1 --run_name human_enhancer_1025_Adipose --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 51 --output_dir ./train_output/human_enhancer_1025/Adipose --evaluation_strategy steps --eval_steps 51 --warmup_steps 50 --logging_steps 51 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human_enhancer_1025/Heart --kmer -1 --run_name human_enhancer_1025_Heart --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 133 --output_dir ./train_output/human_enhancer_1025/Heart --evaluation_strategy steps --eval_steps 133 --warmup_steps 50 --logging_steps 133 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/human_enhancer_1025/Spleen --kmer -1 --run_name human_enhancer_1025_Spleen --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 507 --output_dir ./train_output/human_enhancer_1025/Spleen --evaluation_strategy steps --eval_steps 507 --warmup_steps 50 --logging_steps 507 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e4e5_1025/Skeletal_Muscle --kmer -1 --run_name pig_e4e5_1025_Skeletal_Muscle --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 212 --output_dir ./train_output/pig_e4e5_1025/Skeletal_Muscle --evaluation_strategy steps --eval_steps 212 --warmup_steps 50 --logging_steps 212 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e4e5_1025/Liver --kmer -1 --run_name pig_e4e5_1025_Liver --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 440 --output_dir ./train_output/pig_e4e5_1025/Liver --evaluation_strategy steps --eval_steps 440 --warmup_steps 50 --logging_steps 440 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e4e5_1025/Adipose --kmer -1 --run_name pig_e4e5_1025_Adipose --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 346 --output_dir ./train_output/pig_e4e5_1025/Adipose --evaluation_strategy steps --eval_steps 346 --warmup_steps 50 --logging_steps 346 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e4e5_1025/Heart --kmer -1 --run_name pig_e4e5_1025_Heart --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 149 --output_dir ./train_output/pig_e4e5_1025/Heart --evaluation_strategy steps --eval_steps 149 --warmup_steps 50 --logging_steps 149 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20


export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e4e5_1025/Spleen --kmer -1 --run_name pig_e4e5_1025_Spleen --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 3e-05 --num_train_epochs 20 --fp16 --save_steps 119 --output_dir ./train_output/pig_e4e5_1025/Spleen --evaluation_strategy steps --eval_steps 119 --warmup_steps 50 --logging_steps 119 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20




# Due to the poor prediction performance on the pig's spleen and liver, the learning rate is set to 1e-5.

export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e4e5_1025/Liver --kmer -1 --run_name pig_e4e5_1025_Liver_lr1e5 --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 1e-05 --num_train_epochs 20 --fp16 --save_steps 440 --output_dir ./train_output/pig_e4e5_1025/Liver_lr1e5 --evaluation_strategy steps --eval_steps 440 --warmup_steps 50 --logging_steps 440 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20



export CUDA_VISIBLE_DEVICES=1
python /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT_2/finetune/train.py --model_name_or_path /data2/zyd_workspace/2024_12_multi_species_models/dnabert-2/DNABERT-2-117M --data_path ./train_valid_csv/pig_e4e5_1025/Spleen --kmer -1 --run_name pig_e4e5_1025_Spleen_lr1e5 --model_max_length 257 --per_device_train_batch_size 16 --per_device_eval_batch_size 16 --gradient_accumulation_steps 1 --learning_rate 1e-05 --num_train_epochs 20 --fp16 --save_steps 119 --output_dir ./train_output/pig_e4e5_1025/Spleen_lr1e5 --evaluation_strategy steps --eval_steps 119 --warmup_steps 50 --logging_steps 119 --overwrite_output_dir True --log_level info --find_unused_parameters False --save_total_limit 20W