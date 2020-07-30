plot_lla = scars_out.SatStates.lla.Data;
t = scars_out.tout;

plot_error = 60*rad2deg(scars_out.error.Data);

figure()
% subplot(311)
% plot(t, plot_error(:,1))
% subplot(312)
% plot(t, plot_error(:,2))
% subplot(313)
% plot(t, plot_error(:,3))
plot(t, plot_error(:,1), t, plot_error(:,2), t, plot_error(:,3))
ylim([-600 600])
% xlim([250 400])
ylabel('Euler Angles [arcmin]')
xlabel('Time [s]')