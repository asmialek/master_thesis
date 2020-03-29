% h - angular momentum (km^2/s)
% e - eccentricity (unitless)
% RA - right ascension of the ascending node (rad)
% incl - inclination (rad)
% w - argument of periapis (rad)
% TA - true anomaly (rad)
% mu - standard gravitational parameter (m^3/s^2)

function [r, v] = kep2rv(a, e, RA, incl, w, TA, mu)

h = sqrt(a*mu*(1-e^2));

rp = (h^2/mu) * (1/(1 + e.*cos(TA))) * (cos(TA).*[1;0;0] + sin(TA).*[0;1;0]);
vp = (mu/h) * (-sin(TA).*[1;0;0] + (e + cos(TA)).*[0;1;0]);

R3_W = [ cos(RA) sin(RA) 0;
         -sin(RA) cos(RA) 0;
         0          0       1];
     
R1_i = [1 0 0;
        0 cos(incl) sin(incl);
        0 -sin(incl) cos(incl)];
    
R3_w = [ cos(w) sin(w) 0;
         -sin(w) cos(w) 0;
         0 0 1];
     
Q_pX = (R3_w*R1_i*R3_W)';

r = Q_pX*rp;
v = Q_pX*vp;

r = r';
v = v';

end