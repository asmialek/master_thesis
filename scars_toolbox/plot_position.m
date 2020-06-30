% close all

%% loading
% TStart = 0; 
% TFinal = 100;
% dT = 5;   
% t = TStart:dT:TFinal;

[r, v] = kep2eci(a, e, RA, incl, w, TA, mu);
[r0,v0] = eci2ecef(utc,r,v);
r_lla = ecef2lla(r0');

%% simulation
% disp('cube')
% cube = sim('cubesat_propagation' ,[TStart TFinal]);
% v_b = cube.v_b(1,:);

disp('scars')
warning('off','all')
scars_out = sim('scars_model' ,[TStart TFinal]);
warning('on','all')
disp('done')

%% plotting

plot_position2