h = 6378e3;
G = 6.6743015e-11;
Re = 6356e3;
Me = 5.972e24;

omega = 7.2921150e-5;
mu = 3.986004418e14;

n = 14.94845317;
a = (mu^(1/3))/((2*n*pi/86400)^(2/3))
% a = h+400e3;
e = 0.0011871;
incl = deg2rad(97.7672);
RA = deg2rad(56.1804);
w = deg2rad(236.0402);
MA = deg2rad(123.9692);
[my_ga, TA] = kepler1(MA, e);

total_sec = 10603.369152;
sec = total_sec - 3600*2 - 60*56;
initYear = 2000;
initDay = 0;
% utc = [2000 1 1 12 0 0];
utc = [2018 12 13 2 56 43];
julian = juliandate(utc);
juliansec = juliandate([2000 1 1 12 0 1]) - juliandate([2000 1 1 12 0 0]);
decstart = decyear(utc);
decsec = decyear(2000,1,1,12,0,1) - decyear(2000,1,1,12,0,0);
[r_eci, v_eci] = kep2eci(a, e, RA, incl, w, TA, mu);
% 2453404
% [r_ecef,v_ecef] = eci2ecef([2005 2 2 12 0 0],r_eci,v_eci); % this is from aerorpace tb
[r_ecef,v_ecef] = eci2ecef(utc,r_eci,v_eci); % this is from aerorpace tb
r_lla = ecef2lla(r_ecef') % this too