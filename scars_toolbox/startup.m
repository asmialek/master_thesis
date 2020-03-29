h = 6378e3;
G = 6.6743015e-11;
Re = 6356e3;
Me = 5.972e24;

vy = sqrt(G*Me/h);
v0 = [0 vy 0];


a = 7000e3;
e = 0.01;
incl = deg2rad(45);
RA = deg2rad(10);
w = deg2rad(10);
TA = deg2rad(10);
mu = 3.986004418e14;

[r, v] = kep2rv(a, e, RA, incl, w, TA, mu);
r_eci = [r;initCond.r_eci]
v_eci = [v;initCond.v_eci]