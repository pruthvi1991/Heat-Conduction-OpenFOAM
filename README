# Heat-Conduction-OpenFOAM
Using the scalarTransportFoam solver to solve simple conduction problems.

The velocity field is set to 0 everywhere so the advection term is rendered useless. The diffusion term works and does its magic.

Follow the commands to run the simulation.

gmsh -3 heatsink.geo
mv hatsink.msh pitzDaily_heatsink/
cd pitzDaily_heatsink/
gmshToFoam heatsink.msh

Now its time to change the patch names in constant/polymesh/boundary

Rename the patches to the appropriate names.

Execute the run.sh script