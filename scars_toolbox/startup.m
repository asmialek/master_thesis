h = 6378e3;
G = 6.6743015e-11;
Re = 6356e3;
Me = 5.972e24;

omega = 7.2921150e-5;

vy = sqrt(G*Me/h);
% v0 = [0 vy 0];


a = 8000e3;
e = 0.0;
incl = deg2rad(45);
RA = deg2rad(180);
w = deg2rad(0);
TA = deg2rad(0);
mu = 3.986004418e14;

dT = 1;