plot_lla = scars_out.SatStates.lla.Data;
t = scars_out.tout;

plot_error = 60*rad2deg(scars_out.error.Data);

figure()
plot(t, plot_error(:,1), t, plot_error(:,2), t, plot_error(:,3))
hold on
plot([220 220], [-1000, 1000], 'k--')
plot([230 230], [-1000, 1000], 'k--')
ylim([-400 400])
% xlim([200 250])
ylabel('Euler angles error [arcmin]')
xlabel('Time [s]')
legend('Roll angle', 'Pitch angle', 'Yaw angle', 'Exposition time');
set(gcf, 'Position', [100, 100, 900, 500])

figure()
plot(t, plot_error(:,1), t, plot_error(:,2), t, plot_error(:,3))
hold on
plot([220 220], [-1000, 1000], 'k--')
plot([-1000 1000], [10, 10], 'g--')
plot([230 230], [-1000, 1000], 'k--')
plot([-1000 1000], [-10, -10], 'g--')
ylim([-25 25])
xlim([200 250])
ylabel('Euler angles error [arcmin]')
xlabel('Time [s]')
legend('Roll angle', 'Pitch angle', 'Yaw angle', 'Exposition time', 'Accuracy requirement');
set(gcf, 'Position', [100, 100, 900, 500])

figure()
plot(t, plot_lla(:,1)-1, t, plot_lla(:,2))
ylabel('Geographical coordinates [deg]')
xlabel('Time [s]')
legend('Latitude', 'Longitude')
set(gcf, 'Position', [100, 100, 400, 400])

figure()
plot(t, scars_out.ref.Data(:,1), t, scars_out.ref.Data(:,2), t, scars_out.ref.Data(:,3))
legend('Roll angle', 'Pitch angle', 'Yaw angle')
ylabel('Required Euler angles of the body [deg]')
xlabel('Time [s]')
set(gcf, 'Position', [100, 100, 400, 400])