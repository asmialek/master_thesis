%% Rotational Motion 
% Right hand side function for translational motion of a spacecraft,
% according to Bryson transformed 1.42 - 1.47 

function dx = rotational_motion(~, x, u, n, I)

        p = x(1);
        q = x(2);
        r = x(3);
      phi = x(4);
    theta = x(5);
      psi = x(6);

    G = [ 1  0          -sin(theta)           ;
          0  cos(theta)  cos(theta)*sin(phi)  ;
          0 -sin(theta)  cos(theta)*cos(phi) ];

    F = [ sin(psi)*cos(theta)                               ;
          sin(psi)*sin(theta)*sin(phi) + cos(psi)*cos(phi)  ;
          sin(psi)*sin(theta)*cos(phi) - cos(psi)*sin(phi) ];

%     euler_derivatives = (G^-1)*([p q r]' + F.*n);

    p_dot = (-3*n^2*(I(1) - I(3))*phi + u(1) - n*(I(2) - I(3))*r)/I(1);
    q_dot = (-3*n^2*(I(1) - I(3))*theta + u(2))/I(2);
    r_dot = (u(3) + n*(I(2) - I(1)))/I(3);
    
%     dx = [p_dot; q_dot; r_dot; euler_derivatives];
    
    phi_dot = p + n*psi;
    theta_dot = q + n;
    psi_dot = r - n*phi;
    
    dx = [p_dot; q_dot; r_dot; phi_dot; theta_dot; psi_dot];
end

%% Backup of names for state space
%     x_dot_names_rot = {'\deltap^.'
%                        '\deltaq^.'
%                        '\deltar^.'
%                        '\delta\Phi^.'
%                        '\delta\Theta^.'
%                        '\delta\Psi^.'};
%     x_names_rot = {'\deltap'
%                    '\deltaq'
%                    '\deltar'
%                    '\delta\Phi'
%                    '\delta\Theta'
%                    '\delta\Psi'};
%     u_names_trans = {'Q_x'
%                      'Q_y'
%                      'Q_z'
%                      'None'
%                      'None'
%                      'None'};
%     sys_trans.OutputName = x_dot_names;
%     sys_trans.StateName  = x_names;
%     sys_trans.InputName  = u_names;