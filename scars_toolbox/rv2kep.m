% assuming XYZ

mu = 398600.4418;

r = norm(R);
v = norm(V);
v_r = dot(R,V)/r;
H = cross(R,V);
h = norm(H);

i = acos(H(3)/h); % inclination
N = cross([0 0 1], H);
n = norm(N);

if N(2) >= 0
    Omega = acos(N(1)/n); % right ascension of the ascending node
else
    Omega = 2*pi - acos(N(1)/n);
end

E = (1/mu)*