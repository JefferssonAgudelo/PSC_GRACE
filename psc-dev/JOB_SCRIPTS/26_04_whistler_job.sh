#!/bin/bash -l
# Batch script to run an MPI parallel job with the upgraded software
# stack under SGE with Intel MPI.
# 1. Force bash as the executing shell.
#$ -S /bin/bash
# 2. Request ten minutes of wallclock time (format hours:minutes:seconds).
#$ -l h_rt=2:00:0
# 3. Request 1 gigabyte of RAM per process (must be an integer)
#$ -l mem=2G
# 4. Request 15 gigabyte of TMPDIR space per node (default is 10 GB)
#$ -l tmpfs=15G
# 5. Set the name of the job.
#$ -N whistler_I
# 6. Select the MPI parallel environment and 32 processes.
#$ -pe mpi 32
# 7. Set the working directory to somewhere in your scratch space.  This is
# a necessary step with the upgraded software stack as compute nodes cannot
# write to $HOME.
# Replace "<your_UCL_id>" with your UCL user ID :
#$ -wd /home/ucasjaa/Scratch/output/whistler_I
# 8. Run our MPI job.  GERun is a wrapper that launches MPI jobs on our clusters.
#module load hdf/5-1.10.2-impi/intel-2018
module load hdf/5-1.10.2-impi/intel-2018
#module load hdf/5-1.8.15-p1-ompi/gnu-4.9.2
gerun /home/ucasjaa/PSC/psc-dev/build/src/psc_whistler
