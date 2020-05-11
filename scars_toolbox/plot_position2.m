% close all

%% loading
% TStart = 0; 
% TFinal = 100;
% dT = 1;   
% t = TStart:dT:TFinal;
% 
% [r, v] = kep2eci(a, e, RA, incl, w, TA, mu);
% [r0,v0] = eci2ecef([2005 2 2 12 0 0],r,v);
% r_lla = ecef2lla(r0');
% 
% %% simulation
% disp('cube')
% cube = sim('cubesat_propagation' ,[TStart TFinal]);
% v_b = cube.v_b(1,:);
% 
% disp('scars')
% warning('off','all')
% scars_out = sim('scars_model' ,[TStart TFinal]);
% warning('on','all')
% disp('done')

%% plotting
% close all

figure()
[x, y, z] = sphere;
surf(x*Re,y*Re,z*Re)
axis equal
hold on
plot3(scars_out.r_ecef(1,1),scars_out.r_ecef(1,2),scars_out.r_ecef(1,3), 'rx', 'LineWidth',3)
plot3(scars_out.r_ecef(:,1),scars_out.r_ecef(:,2),scars_out.r_ecef(:,3),'r','LineWidth',3)
plot3(scars_out.r_ecef(end,1),scars_out.r_ecef(end,2),scars_out.r_ecef(end,3), 'ro', 'LineWidth',3)

plot3(cube.r_ecef(1,1),cube.r_ecef(1,2),cube.r_ecef(1,3), 'gx', 'LineWidth',3)
plot3(cube.r_ecef(:,1),cube.r_ecef(:,2),cube.r_ecef(:,3),'g','LineWidth',3)
plot3(cube.r_ecef(end,1),cube.r_ecef(end,2),cube.r_ecef(end,3), 'go', 'LineWidth',3)

figure()
subplot(121)
% plot(t,scars_out.v_ecef(:,1),t,scars_out.v_ecef(:,2),t,scars_out.v_ecef(:,3))
plot(scars_out.tout,scars_out.SatStates.V_ecef.Data(:,1),scars_out.tout,scars_out.SatStates.V_ecef.Data(:,2),scars_out.tout,scars_out.SatStates.V_ecef.Data(:,3))
hold on
plot(cube.tout,cube.v_ecef.Data(:,1),cube.tout,cube.v_ecef.Data(:,2),cube.tout,cube.v_ecef.Data(:,3))
legend('S_x','S_y','S_z','C_x','C_y','C_z');
subplot(122)
plot(scars_out.tout,scars_out.v_b(:,1),scars_out.tout,scars_out.v_b(:,2),scars_out.tout,scars_out.v_b(:,3))
legend('Vb_x','Vb_y','Vb_z');

figure()
subplot(121)
plot(scars_out.tout,rad2deg(scars_out.euler(:,1)),scars_out.tout,rad2deg(scars_out.euler(:,2)),scars_out.tout,rad2deg(scars_out.euler(:,3)))
legend('\phi','\theta','\psi');
ylabel('[deg]')
subplot(122)
plot(scars_out.tout,scars_out.omega_b(:,1),scars_out.tout,scars_out.omega_b(:,2),scars_out.tout,scars_out.omega_b(:,3))
legend('\omega_b_x','\omega_b_y','\omega_b_z');
ylabel('[rad/s]')

% plot(t,scars_out.v_ecef(:,1),t,scars_out.v_ecef(:,2),t,scars_out.v_ecef(:,3), ...
% t,cube.v_ecef(:,1),t,cube.v_ecef(:,2),t,cube.v_ecef(:,3))
% legend('S_x','S_y','S_z');