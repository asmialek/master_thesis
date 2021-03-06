%% Setup
close all
clear
clc

% Satellite Setup
g = 6.67408e-11; % m^3 kg^-1 s^-2
R_e = 6371e3;    % m
r = 1000e3;      % m  
R = R_e + r;     % m 
m = 100;         % kg
n = sqrt(g/R);

I = [1 1 1];

% Simulation Parameters Setup
tspan = [0 10];

%% Translational Motion
x_0 = [0 0 0 0 0 0]';
u = [1 0 0 0 0 0]';

x_trans_names = {'\deltau' '\deltav' '\deltaw' ...
                 '\deltax'   '\deltay'   '\deltaz'    };
[t,y] = ode45(@(t,y) translational_motion(t, y, u, n, m), tspan, x_0);
plot_six_grid(t, y, x_trans_names, '\bf{Translational Motion}')

%% Rotational Motion
x_0 = [0 0 0 0 0 0]';
u = [1 1 1 0 0 0]';

x_rot_names = {'p'    'q'      'r'    ...
               '\Phi' '\Theta' '\Psi'  };
[t,y] = ode45(@(t,y) rotational_motion(t, y, u, n, I), tspan, x_0);
plot_six_grid(t, y, x_rot_names, '\bf{Rotational Motion}')

%% Tests
% dx = translational_motion(0, x_0, u, n, m)