Gs = zpk(-0.5,[-1/20 -1/10 -1/5 -1],2/(20*10*5*1),'InputDelay',3);
[ystep,tk] = step(Gs,(0:0.1:100));
% plot(tk,ystep);
D = 3;
mpar = lsqcurvefit(@(mpar,tdata) modpred(mpar,tdata,D),[1 1],tk(11:end),ystep(11:end));
Gm = tf(mpar(1),[mpar(2) 1],'inputdelay',D);
step(Gs,Gm)
