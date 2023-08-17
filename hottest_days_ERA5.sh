#!/bin/bash

set -ex

#-------------------
# Take ERA5 tas daily data for 2022, 2023
# Regrid ERA5 data to ECE3 atm grid 
# Find temperature of the hottest day. 
# -------------------
#

ERA_dir=/net/pc230042/nobackup/users/sager/nobackup_2_old/ERA5/
outdir=/net/pc200021/nobackup_1/users/muntjewe/LENTIS/lproc/ERA/
gridfile=/net/pc200021/nobackup_1/users/muntjewe/LENTIS/documents/ECE3_atm_gridfile.txt

temp=/net/pc200021/nobackup/users/muntjewe/

for year in 1951 1952; do
   cdo mergetime ${ERA_dir}/${year}/day/era5_${year}??_tmax.nc ${outdir}/era5_tmax_${year}.nc
   cdo remapbil,${gridfile} ${outdir}/era5_tmax_${year}.nc ${outdir}/era5_tmax_ECE3grid_${year}.nc
done


