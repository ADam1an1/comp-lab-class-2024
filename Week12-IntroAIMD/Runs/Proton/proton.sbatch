#!/bin/bash

#SBATCH --job-name=p_aimd   # Job name
#SBATCH --output=proton_aimd_1ns_0.5fs.out  # Output file
#SBATCH --time=06:00:00    # Maximum runtime
#SBATCH --mem=20GB          # Memory per node
#SBATCH --ntasks=12         # Run a single task
#SBATCH --cpus-per-task=1  # Number of CPU cores per task

# load cp2k
module load cp2k/openmpi/intel/20201212

# command
mpirun -np 12 cp2k.popt -i proton.inp -o proton_aimd_1ns_0.5fs.log

