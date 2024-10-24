#!/bin/bash

dist=$1
f0=$2
trials=$3

for ((i=0; i < $trials; i++)); # loop to generate all the trials
do
        density=$(awk "BEGIN {print $f0 + ($dist * $i)}") # get the tension
        echo $density
        str_rep="density_$density"

        sbatch_script="./$str_rep.sh"
        cat <<EOT > $sbatch_script
#!/bin/bash
#SBATCH --job-name=$density   # Job name
#SBATCH --output=./outputs/$str_rep.out  # Output file
#SBATCH --time=01:00:00    # Maximum runtime
#SBATCH --mem=1GB          # Memory per node
#SBATCH --ntasks=1         # Run a single task
#SBATCH --cpus-per-task=1  # Number of CPU cores per task

source /scratch/work/courses/CHEM-GA-2671-2024fa/software/lammps-gcc-30Oct2022/setup_lammps.bash
mpirun lmp -var density $density  -in ../Inputs/2dWCA.in > density_$density.log

EOT
	sbatch $sbatch_script

done

