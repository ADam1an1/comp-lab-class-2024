#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --time=4:00:00
#SBATCH --mem=8GB
#SBATCH --job-name=2jof_10ns_md
#SBATCH --mail-type=END
#SBATCH --mail-user=avd383@nyu.edu
#SBATCH --output=2jof_md.out

module purge
module load gromacs/openmpi/intel/2020.4
mpirun gmx_mpi mdrun -cpi 2jof_10ns_md.cpt -s 2jof_10ns_md.tpr -deffnm 2jof_10ns_md  

