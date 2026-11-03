#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH -J "unity"
#SBATCH -o unity-slurm.%N.%j.out
#SBATCH -e unity-slurm.%N.%j.err

python -u -c "import PyHipp as pyh; \
import DataProcessingTools as DPT; \
DPT.objects.processDirs(dirs=None, objtype=pyh.Unity, saveLevel=1);"
