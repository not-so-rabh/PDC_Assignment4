function Gwhat = phasepred(mpar,wdata,Kp,taup,zeta)
% FUNCTION THAT RETURNS THE PREDICTION OF THE FREQUENCY RESPONSE
% BY THE MODEL
%

D = mpar(1);
j = sqrt(-1);
Gw = Kp./(1 -taup*(wdata.*wdata)+ j*zeta*wdata);
Gwhat = cos(unwrap(angle((Gw))) - D*wdata);