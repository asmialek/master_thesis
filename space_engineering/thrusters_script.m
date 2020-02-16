% clear

I = 1;
Kp = 0.5;
Kd = 2;
% Kp = 0;
% Kd = 0;.1
mag_sat = 0.005;

TStart = 0;
TFinal = 100;

a1 = 3;
a0 = 0.5;

thrust = 0.5;

% %%
% 
% sim('thrusters_model' ,[TStart TFinal]);
% 
% %%
% 
% figure(1)
% subplot(2,3,1)
% plot(tout, q_out)
% xlabel('q')
% subplot(2,3,2)
% plot(tout, theta_out)
% xlabel('theta')
% subplot(2,3,3)
% plot(tout, mag_out)
% xlabel('mag')
% subplot(2,3,4)
% plot(tout, mag_sat_out)
% xlabel('mag\_sat')
% subplot(2,3,5)
% plot(tout, thrust_out)
% xlabel('thrust\_out')
% subplot(2,3,6)
% plot(tout, pd)
% xlabel('pd')
% sgtitle("Kp = " + Kp + "   Kd = " + Kd)