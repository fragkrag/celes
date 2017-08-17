clear all;
close all;
clc;

nmax = 3;
N = 6;

Wx = ones(N,nmax);
Wx(1,:)=linspace(1,3,3);
Wx(2,:)=-linspace(1,3,3);
Wx(3,:)=linspace(1,3,3);
Wx(4,:)=-linspace(1,3,3);
Wx(5,:)=linspace(1,3,3);
Wx(6,:)=-linspace(1,3,3);
mie = ones(4,nmax,nmax);
mie(2,:,:) = 2*ones(nmax);
mie(3,:,:) = 3*ones(nmax);
mie(4,:,:) = 4*ones(nmax);
radius_map = [1,2,3,1,1,4];

mie_r = mie(radius_map,:,:);
a = squeeze(mie_r(1,:,:))

for i = 1:6
    TWx(i,:) = squeeze(mie_r(i,:,:))'*Wx(i,:);
end