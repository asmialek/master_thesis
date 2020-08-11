sys = linsys3;

% A = sys.A([4:12], [4:12])
B = sys.B(:, 1)
% C = eye(9)
% D = 0

xpdot = ss(sys.A,B,sys.C,0)

% step(xpdot)

