x_ecef = scars_out.SatStates.X_ecef.Data(1,:)'
ECEF2NED = scars_out.SatStates.ECEF2NED.Data(:,:,1);
NED2Body = scars_out.SatStates.NED2Body.Data(:,:,1);
ECI2Body = scars_out.SatStates.ECI2Body.Data(:,:,1);

x_eci = ECEF2NED*NED2Body*x_ecef
% 