#$ -cwd
#$ -S /bin/bash
#$ -N tmo-homo
#$ -t 2

infile=$( awk 'NR==n' n=$SGE_TASK_ID the-list )
export PATH=/home/carlin/Rosetta/main/source/bin:$PATH
export ROSETTA3_DB=/home/carlin/Rosetta/main/database
rosetta_scripts.static.linuxgccrelease @relax-flags -s $infile
