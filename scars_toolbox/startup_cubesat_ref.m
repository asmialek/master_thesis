h = 6378e3;
G = 6.6743015e-11;
Re = 6356e3;
Me = 5.972e24;

vy = sqrt(G*Me/h);
v0 = [0 vy 0];

e = 0.0010537;
RA = deg2rad(95.2562);
incl = deg2rad(51.7519);
w = deg2rad(93.4872);
TA = deg2rad(302.9234);
mu = 3.986004418e14;
a = 6786.223;

[r, v] = kep2rv(a, e, RA, incl, w, TA, mu)