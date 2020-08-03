utc_vector = (scars_out.tout*juliansec)+julian;

n = scars_out.tout(end)/T;
n = ceil(184/5);

r_avg = [];
plot_lla = scars_out.SatStates.lla.Data;
plot_omega = scars_out.SatStates.Omega_B.Data([1:end],:);

len = size(plot_omega, 1);
n = T/100;
j = 1;
r = [];
t = [0];
for i = 1:len
    r = [r; plot_omega(i,:)];
    j = j + 1;
    if scars_out.tout(i) - t(end) > n
       r_avg = [r_avg; mean(r)];
       scars_out.tout(i)
       t = [t; scars_out.tout(i)];
       j = 1;
       r = [];
    end
    disp(100*i/len)
end

figure()
% tnew = t/(24*60*60);
% plot([25 25], [5.68e2 5.92e2],'k--')
% hold on
% plot(tnew(2:end), r_avg/1000, 'b*-')
tnew = t/T;
plot(tnew(2:end), r_avg(:,1), tnew(2:end), r_avg(:,2), tnew(2:end), r_avg(:,3))
grid on
% ylabel('Average orbit altitude [km]')
% xlabel('Time [days]')
% legend("Orbit's altitude", "Date of sail's deployment");


