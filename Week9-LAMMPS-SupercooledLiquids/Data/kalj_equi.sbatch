#!/bin/bash

#SBATCH --job-name=kalj_e   # Job name
#SBATCH --output=kalj_equi.out  # Output file
#SBATCH --time=02:00:00    # Maximum runtime
#SBATCH --mem=8GB          # Memory per node
#SBATCH --ntasks=4         # Run a single task
#SBATCH --cpus-per-task=1  # Number of CPU cores per task

# load lmps
source /scratch/work/courses/CHEM-GA-2671-2024fa/software/lammps-gcc-30Oct2022/setup_lammps.bash

# make system
mpirun lmp -var configfile ../Inputs/n360/kalj_n360_create.lmp -var id 1 -in ../Inputs/create_3d_binary.lmp

# equilibrate
temps=(1.5 1.0 0.9 0.8 0.7 0.65 0.6 0.55 0.5 0.475 0.45)

for temp in "${temps[@]}"
do 
	mpirun lmp -var configfile ../Inputs/n360/kalj_n360_T${temp}.lmp -var id 1 -in ../Inputs/anneal_3d_binary.lmp
	echo "completed equilibration step fpr ${temp}"
done

echo "completed all temps"
