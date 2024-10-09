#!/bin/bash

# Clean up previously set env, register this one
if [[ -z $FORCE_MLPROD_BASEDIR ]]; then
    where="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    export MLPROD_BASEDIR=${where}
else
    export MLPROD_BASEDIR=$FORCE_MLPROD_BASEDIR
fi

export MLPROD_CFGDIR=$MLPROD_BASEDIR/config

# Define path to SPINE
export SPINE_BASEDIR=/sdf/data/neutrino/software/spine

# Define path to OpT0Finder
export FMATCH_BASEDIR=/sdf/data/neutrino/software/OpT0Finder

# Define path to the singularity container
#export SINGULARITY_PATH=/sdf/group/neutrino/images/develop.sif # SLOW
#export SINGULARITY_PATH=/fs/ddn/sdf/group/neutrino/images/develop.sif # ACCESS ISSUE
#export SINGULARITY_PATH=/sdf/group/neutrino/images/larcv2_ub20.04-cuda11.6-pytorch1.13-larndsim.sif
export SINGULARITY_PATH=/sdf/group/neutrino/images/larcv2_ub22.04-cuda12.1-pytorch2.4.0-larndsim-2024-09-03.sif

echo
printf "\033[93mMLPROD\033[00m FYI shell env. may useful for external packages:\n"
printf "    \033[95mMLPROD_BASEDIR\033[00m   = $MLPROD_BASEDIR\n"
printf "    \033[95mMLPROD_CFGDIR\033[00m    = $MLPROD_CFGDIR\n"
printf "    \033[95mSPINE_BASEDIR\033[00m    = $SPINE_BASEDIR\n"
printf "    \033[95mFMATCH_BASEDIR\033[00m   = $FMATCH_BASEDIR\n"
printf "    \033[95mSINGULARITY_PATH\033[00m = $SINGULARITY_PATH\n"

echo
echo "Finished configuration."
echo
