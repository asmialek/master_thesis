L_mt = 2.666;
R_mt = 3.621;

mag_sat = 5;

l_c_mt = 0.25; % length of the magnetic core
w_c_mt = 7.965e-3; % width of the core
d_w_mt = 4.04e-4; % diameter of the wire
gamma_mt = 2; % empirical constant

mt_pre = gamma_mt*pi*l_c_mt*w_c_mt/(4*d_w_mt);
mt_top = (((l_c_mt/w_c_mt)^2)-1)^(3/2);
mt_bottom = (l_c_mt/w_c_mt)*acosh(l_c_mt/w_c_mt)-sqrt((l_c_mt/w_c_mt)-1);

mt_gain = mt_pre*((mt_top/mt_bottom)-1);

A = [0 2 -1; -2 0 3; 1  -3 0];
B = [3 2 2]';

C = A*B;

mt_gain