#!/bin/bash
#SBATCH --time=24:00:00
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH -J "uyall"
#SBATCH -o uyall-slurm.%N.%j.out
#SBATCH -e uyall-slurm.%N.%j.err

python -u -c "import PyHipp as pyh; \
import DataProcessingTools as DPT; \
import pickle; \
uyall = DPT.objects.processDirs(dirs=None, exclude=['*eye*'], objtype=pyh.Unity); \
uyall.save(); \
f = open('uyallTimePerformance.pkl', 'wb'); \
pickle.dump(uyall.timePerformance, f); \
f.close()"

aws sns publish --topic-arn arn:aws:sns:ap-southeast-1:844143819306:awsnotify --message "UnityJobDone" || true
