#!/bin/bash
#SBATCH --job-name=1   # Job name
#SBATCH --output=./outputs/density_1.out  # Output file
#SBATCH --time=01:00:00    # Maximum runtime
#SBATCH --mem=1GB          # Memory per node
#SBATCH --ntasks=1         # Run a single task
#SBATCH --cpus-per-task=1  # Number of CPU cores per task

source /scratch/work/courses/CHEM-GA-2671-2024fa/software/lammps-gcc-30Oct2022/setup_lammps.bash
mpirun lmp -var density 1  -in ../Inputs/3dWCA.in > density_1.log

