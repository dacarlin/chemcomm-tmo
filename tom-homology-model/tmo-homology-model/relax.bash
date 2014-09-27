#$ -N tmo-homo-relax
#$ -cwd
#$ -S /bin/bash
#$ -t 1-2
#$ -o logs
#$ -e logs

export PATH=/home/carlin/Rosetta/main/source/bin:$PATH
export ROSETTA3_DB=/home/carlin/Rosetta/main/database
i="$( awk 'NR=="'${SGE_TASK_ID}'"' the-list )"

rosetta_scripts.static.linuxgccrelease @relax-flags -s $i
rosetta_scripts.static.linuxgccrelease @relax-flags-1 -s $i

