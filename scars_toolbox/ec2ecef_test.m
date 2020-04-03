[r, v] = kep2rv(a, e, RA, incl, w, TA, mu);
addpath('resources/outside_func')

dcm = dcmeci2ecef('IAU-2000/2006',[2005 2 2 12 0 0]);
% dcm_sim = scars_out.dcm(:,:,1);

[r_ecef2,v_ecef2] = eci2ecef([2005 2 2 12 0 0],r,v);
% [r_ecef3,v_ecef3] = eci2ecef([2005 2 2 12 0 0],scars_out.r0_efi(1,:),scars_out.v0_efi(1,:));

load('initCond2.mat');

omega = deg2rad(360.9856)/24/60/60;
omega = 7.2921150e-5;
v_rel = omega*a;

r2 = dcm*r';
v2 = dcm*v';
alpha = atan(r2(1)/r2(2));
tri = [-v_rel*sin(alpha) v_rel*cos(alpha)]
v22 = [v2(1)+v_rel*cos(alpha),v2(2)-v_rel*sin(alpha),v2(3)]';

romesq = [rms(r)/rms(v); rms(r2)/rms(v2); rms(r2)/rms(v22)]';

% r_ecef = [r2';scars_out.r0_ecef(1,:);initCond.r_ecef;r_ecef2';r_ecef3'];
% v_ecef = [v2';scars_out.v0_ecef(1,:);initCond.v_ecef;v_ecef2';v_ecef3']
v_ecef = [v2';v22';v_ecef2';cube.v_ecef(1,:)]


%% external libs
% JD = 2453404;

% time = JD2GAST(2453404);
% time = JD2GMST(2453404);

% [r_ecef4,v_ecef4] = ECItoECEF(2453405,scars_out.r0_efi(1,:)',scars_out.v0_efi(1,:)');
% [r_ecef4,v_ecef4] = ECItoECEF(2453405,r',v',[0 0 0]);
% 
% [initCond.r_ecef; r_ecef4'];
% [initCond.v_ecef; v_ecef4']

% [r_ecef2,v_ecef2] = eci2ecef([2005 2 2 12 0 0],r,v);
% [r_ecef2';scars_out.r0_ecef(1,:)]
% [v_ecef2';scars_out.v0_ecef(1,:)]