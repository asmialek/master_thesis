close all

%% loading
TStart = 0;
TFinal = 2000;
dT = 0.2;
t = TStart:dT:TFinal;

%% simulation
disp('scars')
warning('off','all')
scars_out = sim('scars_model' ,[TStart TFinal]);
warning('on','all')
disp('cube')
cube = sim('cubesat_propagation' ,[TStart TFinal]);
disp('done')

%% plotting
close all

figure(1)
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

figure(2)
subplot(1,2,1)
plot(t,scars_out.v_ecef(:,1),t,scars_out.v_ecef(:,2),t,scars_out.v_ecef(:,3))
subplot(1,2,2)
plot(t,cube.v_ecef(:,1),t,cube.v_ecef(:,2),t,cube.v_ecef(:,3))