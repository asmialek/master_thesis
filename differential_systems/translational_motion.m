%% Translational Motion
% Right hand side function for translational motion of a spacecraft,
% according to Bryson eq. 1.13

function dx = translational_motion(~, x, u, n, m)

    A = [  0   0   n  -n^2 0   0     ;
           0   0   0   0  -n^2 0     ;
          -n   0   0   0   0   2*n^2 ;
           1   0   0   0   0   n     ;
           0   1   0   0   0   0     ;
           0   0   1  -n   0   0    ];

    B = [  1/m 0   0   0   0   0     ;
           0   1/m 0   0   0   0     ;
           0   0   1/m 0   0   0     ;
           0   0   0   0   0   0     ;
           0   0   0   0   0   0     ;
           0   0   0   0   0   0    ];        

    dx = A*x + B*u;
end

%% Backup of names for state space
%     x_dot_names = {'\deltaa_x'
%                    '\deltaa_y'
%                    '\deltaa_z'
%                    '\deltav_x'
%                    '\deltav_y'
%                    '\deltav_z'};
%                
%     x_names = {'\deltav_x'
%                '\deltav_y'
%                '\deltav_z'
%                '\deltax'
%                '\deltay'
%                '\deltaz'};
%            
%     u_names = {'T_x'
%                'T_y'
%                'T_z'
%                'None'
%                'None'
%                'None'};
%            0   0   0   0   0   0    ];
% 
%     C_radial = eye(6);
%     D_radial = eye(6);
% 
%     sys_trans = ss(A, B, C_radial, D_radial);
%     sys_trans.OutputName = x_dot_names;
%     sys_trans.StateName  = x_names;
%     sys_trans.InputName  = u_names;