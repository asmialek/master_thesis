%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SCARS Toolbox Initialization Script %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Earth's contants
G = 6.6743015e-11;
Re = 6356e3;
Me = 5.972e24;
omega = 7.2921150e-5;

% Keplerian Elements - user's input
welcome = sprintf("%s", ...
                  "Please input the values correspoding to the", ...
                  " Keplerian Elements of the desired orbit.");
disp(' ');
disp(welcome);
disp(' ');
a = input("Semimajor axis [km]: ");
e = input("Eccentricity [-]: ");
incl = input("Inclination [deg]: ");
RA = input("Right ascension of the ascending node [deg]: ");
w = input("Argument of periapsis [deg]: ");


initYear = 2000;
initDay = 0;
utc = [2000 1 1 12 0 0];
julian = juliandate(utc);
juliansec = juliandate([2000 1 1 12 0 1]) - juliandate([2000 1 1 12 0 0]);
decstart = decyear(utc);
decsec = decyear(2000,1,1,12,0,1) - decyear(2000,1,1,12,0,0);
[r_eci, v_eci] = kep2eci(a, e, RA, incl, w, TA, mu);
% 2453404
% [r_ecef,v_ecef] = eci2ecef([2005 2 2 12 0 0],r_eci,v_eci); % this is from aerorpace tb
[r_ecef,v_ecef] = eci2ecef(utc,r_eci,v_eci); % this is from aerorpace tb
r_lla = ecef2lla(r_ecef'); % this too

% refEuler = [0 0.5 1];
% refVel = [v_b(1) v_b(2)+500 v_b(3)];
refEuler = [0 0 1];
% refEuler = [0 0 0];
forcesBody = [0 0 0];
momentsBody = [0 0 0];
initEuler = [0 0 0]; % [deg]sun_position(:,1)
initMoments = [0 0 0];
initEulerRates = [0.0 0.0 0.0];

dT = 0.1;
cube = sim('cubesat_propagation' ,[0 1]);
v_b = cube.v_b(1,:); % you have to find how it is calculated
dT = dT2;
dT_table = dT2;
refVel = [v_b(1) v_b(2) v_b(3)];

% steps
startTime = 0;
lengthTime = 0;
stepTime = 50;
dtStep = 10;

% open_system('scars_model')
disp('Sun position')
sun_position = getSunPositions(julian, TFinal, dT);

%%
disp('Simulations')

rw_script
thrusters_script
magnetorquers_script
pwsat2
vrml_setup
% plot_position
% conversions