Gs = tf([1 0.5],[1000 1350 385 36 1],'InputDelay',3);
[Gmag,Gphase,wvec] = bode(Gs,[0,0.1,100]);
% For gain, time cnstant estimation fit magnitude plot
param = lsqcurvefit(@(param,wval) modpred(param,wval),[1 1 1],wvec,squeeze(Gmag));
Kp = param(1)
taup = param(2)
zeta = param(3)
% For delay estimatin fit phase plot
z = cos(squeeze(Gphase));
G_phase = lsqcurvefit(@(param,wval) phasepred(param,wval,Kp,taup,zeta),1,wvec,z);
D = real(G_phase);
s = tf('s');
G_SOPTD_ls = Kp*exp(-D*s)/(taup^2*s^2 + 2*zeta*taup*s + 1);
step(Gs,G_SOPTD_ls);

% G_SOPTD_ls % approximated SOPTD model