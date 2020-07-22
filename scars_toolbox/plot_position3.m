utc_vector = (scars_out.tout*juliansec)+julian;

n = scars_out.tout(end)/T;
n = ceil(184/5);

r_avg = [];

len = size(scars_out.tout, 1);
n = T;
j = 1;
r = [];
t = [0];
for i = 1:len
%     r(j, :) = ecef2eci(datevec(utc_vector(i)), scars_out.r_ecef(i,:))';
    r = [r; scars_out.lla(i,3)];
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

% for i = n:n:size(scars_out.tout, 1)
%     new_r = ecef2eci(datevec(utc_vector(i)), scars_out.r_ecef(i,:))';
%     r(i/n,:) = new_r;
%     disp(100*i/size(scars_out.tout, 1))
% end
% 
% r_norm = vecnorm(r_avg');
% r_ecef_norm = vecnorm(scars_out.r_ecef(1:n:end,:)');
% cube_ecef_norm = vecnorm(cube.r_ecef');
% 
figure()
plot(t(2:end), r_avg)
% plot(scars_out.tout(1:n:end), r_norm(1:size(scars_out.tout(1:n:end))))
% subplot(222)
% plot(scars_out.tout(1:n:end), r_ecef_norm)
% subplot(223)
% plot(cube.tout, cube_ecef_norm)