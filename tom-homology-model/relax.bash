#$ -N tmo-homo-relax
#$ -cwd
#$ -S /bin/bash
##$ -t 1

export PATH=/home/carlin/Rosetta/main/source/bin:$PATH
export ROSETTA3_DB=/home/carlin/Rosetta/main/database
rosetta_scripts.linuxgccrelease @relax-flags -s S_0133.pdb
