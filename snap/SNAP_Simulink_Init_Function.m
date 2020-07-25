% This script runs just before the Simulink model begins to propagate the
% attitude to define constants. Internal models can be turned off here.
%% -----------------------------------------------------------------------------
%   Copyright (c) 2010-2018 Samir A. Rawashdeh
%   Electrical and Computer Engineering
%   University of Michigan - Dearborn
%  
%   All rights reserved. 
%   
%   Redistribution and use in source and binary forms, with or without 
%   modification, are permitted provided that the following conditions are 
%   met:
%   
%       * Redistributions of source code must retain the above copyright 
%         notice, this list of conditions and the following disclaimer.
%       * Redistributions in binary form must reproduce the above copyright 
%         notice, this list of conditions and the following disclaimer in 
%         the documentation and/or other materials provided with the distribution
%         
%   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
%   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
%   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
%   ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
%   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
%   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
%   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
%   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
%   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
%   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
%   POSSIBILITY OF SUCH DAMAGE.
%  
% ----------------------------------------------------------------------------

%% Load parameters from GUI
load sim_parameters
SNAP_sim_params = rmfield(SNAP_sim_params, 'name');

%% Enables
EN_2BodyModel = 1
EN_GG = 1
EN_Hyst = 1
EN_Mag = 1
EN_Aero = SNAP_sim_params.aero_enabled  %value taken from checkbox in GUI

% display summary to terminal
{'Two-body Model', EN_2BodyModel;
    'Gravity Gradient', EN_GG;
    'Magnetic Hysteresis', EN_Hyst;
    'Magnetic Dipole', EN_Mag;
    'Aerodynamics', EN_Aero}
disp('The above variables indicate which models are enabled and will affect the simulation')


%% Simulation length
SNAP_sim_length = SNAP_sim_params.sim_length;

%% Julian Date
SNAP_JD = SNAP_sim_params.JD;
SNAP_starting_ECI2ECEF_dcm =dcmeci2ecef('IAU-2000/2006',SNAP_sim_params.DateVector)

% Possible override:
%SNAP.JD = mjuliandate(2024,10,10,12,21,0); %Calculate Julian date for October 10, 2024, at 12:21:00 p.m.

%% Orbit Parameters, initial position and velocity
initial_velocity = SNAP_sim_params.initial_velocity ;
initial_position = SNAP_sim_params.initial_position ;

% Possible override (calculation based on altitude and inclination only)
%orbit_alt = 500.e3;
%inclination = 90* pi/180;
%initial_position = [0 (orbit_alt+SNAP_CONST_r_earth) 0];
%initial_velocity = [cos(inclination) 0 sin(inclination)] * 7683;

%% Mass, inertia, magnet strength, hysteresis material volume

SNAP_sat_mass = SNAP_sim_params.m_satellite;
SNAP_sat_inertia = SNAP_sim_params.inertia_satellite;
SNAP_magnets = SNAP_sim_params.magnets;
SNAP_V_hyst = SNAP_sim_params.V_hyst;

SNAP_Hc = SNAP_sim_params.Hc;
SNAP_Br = SNAP_sim_params.Br;
SNAP_Bs = SNAP_sim_params.Bs;

%% Initial rotation rate
SNAP_init_rates = SNAP_sim_params.init_rates;

%% Constants
SNAP_CONST_m_earth = 5.9736e24;
SNAP_CONST_G_earth = 6.6742e-11;
SNAP_CONST_r_earth = 6.36101e6;
SNAP_CONST_mu0 = 4*pi*1e-7;

%Earth Mag Model
SNAP_CONST_earth_mag_dipole = [sin(168.6*pi/180)* cos(109.3*pi/180), sin(168.6*pi/180)* sin(109.3*pi/180), cos(168.6*pi/180)] ; %unit vector, in ECEF
SNAP_CONST_a3H0 = 7.943e15; % Wb.m


%% Aerodynamic model parameters
if EN_Aero == 1
    load(SNAP_sim_params.aero_file);
    
else  % dummy values so that aero block in simulink model does not complain about missing variables
    SNAP_aeromodel.T = zeros (37,32);
    SNAP_aeromodel.pitch = 1:37;
    SNAP_aeromodel.roll = 1:32;
    SNAP_aeromodel.av_density_vs_alt = zeros(1,11);
    SNAP_aeromodel.alt_range = 1:11;
        
end


SNAPaero.T = SNAP_aeromodel.T;
SNAPaero.pitch = SNAP_aeromodel.pitch;
SNAPaero.roll = SNAP_aeromodel.roll;
SNAPaero.av_density_vs_alt = SNAP_aeromodel.av_density_vs_alt;
SNAPaero.alt_range = SNAP_aeromodel.alt_range;



