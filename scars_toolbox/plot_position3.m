utc_vector = (scars_out.tout*juliansec)+julian;

n = scars_out.tout(end)/T;
n = ceil(184/5);

r_avg = [];
plot_lla = scars_out.SatStates.lla.Data;

len = size(scars_out.tout, 1);
n = 3*T;
j = 1;
r = [];
t = [0];
for i = 1:len
    r = [r; plot_lla(i,3)];
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
tnew = t/(24*60*60)
% plot([25 25], [5.85e5 6e5],'--')
hold on
plot(tnew(2:end), r_avg, '*-')
