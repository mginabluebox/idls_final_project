#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=4
#SBATCH --time=48:00:00
#SBATCH --mem=128GB
#SBATCH --job-name=gpu4bs32
#SBATCH --gres=gpu:v100:4
#SBATCH --output=./slurm_output/slurm_%j_4_v100.out

module purge 

singularity exec --nv \
    --overlay /scratch/tj810/intro-dl-system/overlay-25GB-500K.ext3:ro \
    /scratch/work/public/singularity/cuda11.0-cudnn8-devel-ubuntu18.04.sif \
    /bin/bash -c "source /ext3/env.sh; python reddit.py --gpu=4 --type=v100"