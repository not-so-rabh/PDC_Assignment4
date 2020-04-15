G = tf([1 0.5],[1000 1350 385 36 1],'InputDelay',3);
[y t]= step(G);
Kp = y(end);
[m,t1_index] = min(abs(y-(0.353*Kp)));
[m,t2_index] = min(abs(y-(0.853*Kp)));
t1 = t(t1_index);
t2 = t(t2_index);t
D = 1.3*t1-0.29*t2
% Tau
T = 0.67*(t2-t1)
G_FOPTD = tf([Kp],[T,1],'InputDelay',D)
G_FOPTD_half_rule = tf([0.5],[25 1],'inputdelay',11)
G_SOPTD_half_rule = tf([0.5],[250 32.5 1],'inputdelay',3.5)

