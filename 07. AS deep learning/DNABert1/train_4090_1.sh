

export KMER=6
export MODEL_PATH=/data2/zyd_workspace/2024_10_pig_AS_SNV/DNABERT/6-new-12w-0
export DATA_PATH=./train_valid_tsv/human/promoter_513
export OUTPUT_PATH=./train_output/human/promoter_513

CUDA_VISIBLE_DEVICES=0 python run_finetune.py --model_type dna --tokenizer_name=dna$KMER --model_name_or_path $MODEL_PATH --task_name dnaprom --do_train --do_eval --data_dir $DATA_PATH --max_seq_length 510 --per_gpu_eval_batch_size=32   --per_gpu_train_batch_size=32   --learning_rate 5e-5 --num_train_epochs 20 --output_dir $OUTPUT_PATH --evaluate_during_training --logging_steps 132 --save_steps 132 --warmup_percent 0.1 --hidden_dropout_prob 0.1 --overwrite_output --weight_decay 0.01 --n_process 32




export KMER=6
export MODEL_PATH=/data2/zyd_workspace/2024_10_pig_AS_SNV/DNABERT/6-new-12w-0
export DATA_PATH=./train_valid_tsv/human/enhancer_513
export OUTPUT_PATH=./train_output/human/enhancer_513

CUDA_VISIBLE_DEVICES=0 python run_finetune.py --model_type dna --tokenizer_name=dna$KMER --model_name_or_path $MODEL_PATH --task_name dnaprom --do_train --do_eval --data_dir $DATA_PATH --max_seq_length 510 --per_gpu_eval_batch_size=32   --per_gpu_train_batch_size=32   --learning_rate 5e-5 --num_train_epochs 20 --output_dir $OUTPUT_PATH --evaluate_during_training --logging_steps 689 --save_steps 689 --warmup_percent 0.1 --hidden_dropout_prob 0.1 --overwrite_output --weight_decay 0.01 --n_process 32




export KMER=6
export MODEL_PATH=/data2/zyd_workspace/2024_10_pig_AS_SNV/DNABERT/6-new-12w-0
export DATA_PATH=./train_valid_tsv/human/promoter_enhancer_513
export OUTPUT_PATH=./train_output/human/promoter_enhancer_513

CUDA_VISIBLE_DEVICES=0 python run_finetune.py --model_type dna --tokenizer_name=dna$KMER --model_name_or_path $MODEL_PATH --task_name dnaprom --do_train --do_eval --data_dir $DATA_PATH --max_seq_length 510 --per_gpu_eval_batch_size=32   --per_gpu_train_batch_size=32   --learning_rate 5e-5 --num_train_epochs 20 --output_dir $OUTPUT_PATH --evaluate_during_training --logging_steps 821 --save_steps 821 --warmup_percent 0.1 --hidden_dropout_prob 0.1 --overwrite_output --weight_decay 0.01 --n_process 32




export KMER=6
export MODEL_PATH=/data2/zyd_workspace/2024_10_pig_AS_SNV/DNABERT/6-new-12w-0
export DATA_PATH=./train_valid_tsv/human/promoter_351
export OUTPUT_PATH=./train_output/human/promoter_351

CUDA_VISIBLE_DEVICES=0 python run_finetune.py --model_type dna --tokenizer_name=dna$KMER --model_name_or_path $MODEL_PATH --task_name dnaprom --do_train --do_eval --data_dir $DATA_PATH --max_seq_length 348 --per_gpu_eval_batch_size=32   --per_gpu_train_batch_size=32   --learning_rate 5e-5 --num_train_epochs 20 --output_dir $OUTPUT_PATH --evaluate_during_training --logging_steps 132 --save_steps 132 --warmup_percent 0.1 --hidden_dropout_prob 0.1 --overwrite_output --weight_decay 0.01 --n_process 32




export KMER=6
export MODEL_PATH=/data2/zyd_workspace/2024_10_pig_AS_SNV/DNABERT/6-new-12w-0
export DATA_PATH=./train_valid_tsv/human/enhancer_351
export OUTPUT_PATH=./train_output/human/enhancer_351

CUDA_VISIBLE_DEVICES=0 python run_finetune.py --model_type dna --tokenizer_name=dna$KMER --model_name_or_path $MODEL_PATH --task_name dnaprom --do_train --do_eval --data_dir $DATA_PATH --max_seq_length 348 --per_gpu_eval_batch_size=32   --per_gpu_train_batch_size=32   --learning_rate 5e-5 --num_train_epochs 20 --output_dir $OUTPUT_PATH --evaluate_during_training --logging_steps 689 --save_steps 689 --warmup_percent 0.1 --hidden_dropout_prob 0.1 --overwrite_output --weight_decay 0.01 --n_process 32




export KMER=6
export MODEL_PATH=/data2/zyd_workspace/2024_10_pig_AS_SNV/DNABERT/6-new-12w-0
export DATA_PATH=./train_valid_tsv/human/promoter_enhancer_351
export OUTPUT_PATH=./train_output/human/promoter_enhancer_351

CUDA_VISIBLE_DEVICES=0 python run_finetune.py --model_type dna --tokenizer_name=dna$KMER --model_name_or_path $MODEL_PATH --task_name dnaprom --do_train --do_eval --data_dir $DATA_PATH --max_seq_length 348 --per_gpu_eval_batch_size=32   --per_gpu_train_batch_size=32   --learning_rate 5e-5 --num_train_epochs 20 --output_dir $OUTPUT_PATH --evaluate_during_training --logging_steps 821 --save_steps 821 --warmup_percent 0.1 --hidden_dropout_prob 0.1 --overwrite_output --weight_decay 0.01 --n_process 32




export KMER=6
export MODEL_PATH=/data2/zyd_workspace/2024_10_pig_AS_SNV/DNABERT/6-new-12w-0
export DATA_PATH=./train_valid_tsv/pig/e1_513
export OUTPUT_PATH=./train_output/pig/e1_513

CUDA_VISIBLE_DEVICES=0 python run_finetune.py --model_type dna --tokenizer_name=dna$KMER --model_name_or_path $MODEL_PATH --task_name dnaprom --do_train --do_eval --data_dir $DATA_PATH --max_seq_length 510 --per_gpu_eval_batch_size=32   --per_gpu_train_batch_size=32   --learning_rate 5e-5 --num_train_epochs 20 --output_dir $OUTPUT_PATH --evaluate_during_training --logging_steps 1022 --save_steps 1022 --warmup_percent 0.1 --hidden_dropout_prob 0.1 --overwrite_output --weight_decay 0.01 --n_process 32




export KMER=6
export MODEL_PATH=/data2/zyd_workspace/2024_10_pig_AS_SNV/DNABERT/6-new-12w-0
export DATA_PATH=./train_valid_tsv/pig/e4e5_513
export OUTPUT_PATH=./train_output/pig/e4e5_513

CUDA_VISIBLE_DEVICES=0 python run_finetune.py --model_type dna --tokenizer_name=dna$KMER --model_name_or_path $MODEL_PATH --task_name dnaprom --do_train --do_eval --data_dir $DATA_PATH --max_seq_length 510 --per_gpu_eval_batch_size=32   --per_gpu_train_batch_size=32   --learning_rate 5e-5 --num_train_epochs 20 --output_dir $OUTPUT_PATH --evaluate_during_training --logging_steps 933 --save_steps 933 --warmup_percent 0.1 --hidden_dropout_prob 0.1 --overwrite_output --weight_decay 0.01 --n_process 32




export KMER=6
export MODEL_PATH=/data2/zyd_workspace/2024_10_pig_AS_SNV/DNABERT/6-new-12w-0
export DATA_PATH=./train_valid_tsv/pig/e10_513
export OUTPUT_PATH=./train_output/pig/e10_513

CUDA_VISIBLE_DEVICES=0 python run_finetune.py --model_type dna --tokenizer_name=dna$KMER --model_name_or_path $MODEL_PATH --task_name dnaprom --do_train --do_eval --data_dir $DATA_PATH --max_seq_length 510 --per_gpu_eval_batch_size=32   --per_gpu_train_batch_size=32   --learning_rate 5e-5 --num_train_epochs 20 --output_dir $OUTPUT_PATH --evaluate_during_training --logging_steps 448 --save_steps 448 --warmup_percent 0.1 --hidden_dropout_prob 0.1 --overwrite_output --weight_decay 0.01 --n_process 32




export KMER=6
export MODEL_PATH=/data2/zyd_workspace/2024_10_pig_AS_SNV/DNABERT/6-new-12w-0
export DATA_PATH=./train_valid_tsv/pig/e1_e4e5_e10_513
export OUTPUT_PATH=./train_output/pig/e1_e4e5_e10_513

CUDA_VISIBLE_DEVICES=0 python run_finetune.py --model_type dna --tokenizer_name=dna$KMER --model_name_or_path $MODEL_PATH --task_name dnaprom --do_train --do_eval --data_dir $DATA_PATH --max_seq_length 510 --per_gpu_eval_batch_size=32   --per_gpu_train_batch_size=32   --learning_rate 5e-5 --num_train_epochs 20 --output_dir $OUTPUT_PATH --evaluate_during_training --logging_steps 2319 --save_steps 2319 --warmup_percent 0.1 --hidden_dropout_prob 0.1 --overwrite_output --weight_decay 0.01 --n_process 32


