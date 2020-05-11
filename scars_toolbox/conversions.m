x_ecef = scars_out.SatStates.X_ecef.Data(1,:)
ECEF2NED = scars_out.SatStates.ECEF2NED.Data(:,:,1);
NED2Body = scars_out.SatStates.NED2Body.Data(:,:,1);
ECI2Body = scars_out.SatStates.ECI2Body.Data(:,:,1);

% x_eci = ECEF2NED*NED2Body*inv(ECI2Body)*x_ecef
x_ned = quatrotate(dcm2quat(ECEF2NED),x_ecef)
x_body1 = quatrotate(dcm2quat(NED2Body),x_ned)
x_eci1 = quatrotate(dcm2quat(ECI2Body),x_body1)

x_eci2 = ecef2eci([2005 2 2 12 0 0], x_ecef)'
x_body2 = quatrotate(dcm2quat(inv(ECI2Body)),x_eci2)