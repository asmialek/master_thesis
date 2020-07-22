utc_vector = (scars_out.tout*juliansec)+julian;
r = zeros(size(scars_out.tout, 1), 3);
for i = 1:size(scars_out.tout, 1)
    new_r = ecef2eci(datevec(utc_vector(i)), scars_out.r_ecef(i,:))';
    r(i,:) = new_r;
    disp(100*i/size(scars_out.tout, 1))
end

r_norm = vecnorm(r');
r_ecef_norm = vecnorm(scars_out.r_ecef');
cube_ecef_norm = vecnorm(cube.r_ecef');

figure()
subplot(221)
plot(scars_out.tout, r_norm)
subplot(222)
plot(scars_out.tout, r_ecef_norm)
subplot(223)
plot(scars_out.tout, cube_ecef_norm)