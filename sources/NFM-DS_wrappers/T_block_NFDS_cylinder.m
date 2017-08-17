function T = T_block_NFDS_cylinder(wavelength,nC,nM,R,h,lmax)
%
% wavelength: vacuum wavelength
% nC: complex refractive index of cylinder
% nM: refractive index of medium
% R: radius of cylinder
% h: height of cylinder
% lmax: maximal multipole order
% 
% output
% T: matrix of dimension nind x nind, where nind is the total number of
% indexcombinations
%
% This routine assumes that the NFM-DS code is located in
% sources/NFM-DS_wrappers/NFM-DS
% In sources/NFM-DS_wrappers/NFM-DS/TMATSOURCES, an executable of the main
% program is assumed with the name 

nInt=2000;
useDS=true;
namestring='cylinder';
Nrank=lmax;

write_NFMDS_input_cylinder(wavelength,nM,nC,h,R,nInt,useDS,namestring,Nrank);
dlmwrite('sources/NFM-DS_wrappers/NFM-DS/TMATFILES/one.txt',1)
cd sources/NFM-DS_wrappers/NFM-DS/TMATFILES/
system('./TMATRIX<one.txt')
cd ../../../..
T = read_NFMDS_output('TmatForTSPLcylinder.dat',lmax);

% figure
% imagesc(abs(T))
% title(strcat('r',num2str(R),' h',num2str(h)));

