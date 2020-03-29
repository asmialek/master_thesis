close all
clear

s = tf([1 0], [1])
G = 1/s^2

C = 1;
figure()
step(feedback(G*C, 1))
figure()
step(feedback(G*C, 1), 10)
figure()
step(feedback(G*10*C, 1), 10)
figure()
step(feedback(G*100*C, 1), 10)
figure()
step(feedback(G*2*s+1, 1), 10)

rltool(G, 1+s)
