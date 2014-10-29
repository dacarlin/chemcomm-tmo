#$ -cwd
#$ -S /bin/bash 
#$ -e logs
#$ -o logs

# experimental: may allow you to pass in a list of PDBs 
# to run concurrently in a SGE task array

my=( "$@" ) 

export PATH=/home/carlin/Rosetta/main/source/bin:$PATH
export ROSETTA3_DB=/home/carlin/Rosetta/main/database

rosetta_scripts.linuxgccrelease --parser:protocol design-off.xml \
  @enzdes.flags -s $1 

