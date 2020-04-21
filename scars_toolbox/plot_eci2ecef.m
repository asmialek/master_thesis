
[r, v] = kep2eci(a, e, RA, incl, w, TA, mu);


% comparison=2453372
load('initCond2.mat')
TStart = 0;
TFinal = 5;
scars_out = sim('scars_model' ,[TStart TFinal]);
% r_eci = [r; scars_out.r_efi(1,:); initCond.r_eci]
% v_eci = [v; scars_out.v_efi(1,:); initCond.v_eci]
disp(' ')

dcm = dcmeci2ecef('IAU-2000/2006',[2005 2 2 12 0 0])
dcm_sim = scars_out.dcm(:,:,1)

r2 = dcm*r';
v2 = dcm*v';
r_ecef = [r2';scars_out.r_ecef(1,:);initCond.r_ecef]
v_ecef = [v2';scars_out.v_ecef(1,:);initCond.v_ecef]

%%
[x, y, z] = sphere;
surf(x*Re,y*Re,z*Re)
axis equal
hold on
plot3(                                         r2(1),r2(2),r2(3), 'rx','LineWidth',3)
plot3(scars_out.r_ecef(1,1),scars_out.r_ecef(1,2),scars_out.r_ecef(1,3),'ro','LineWidth',3)
plot3(initCond.r_ecef(1),initCond.r_ecef(2),initCond.r_ecef(3), 'yo','LineWidth',3)
% plot3(scars_out.pos1(:,1),scars_out.pos1(:,2),scars_out.pos1(:,3),'go','LineWidth',3)

% plot3(scars_out.pos1(end,1),scars_out.pos1(end,2),scars_out.pos1(end,3), 'o')