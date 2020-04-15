function Gwhat = modpred(mpar,wdata)
% FUNCTION THAT RETURNS THE PREDICTION OF THE FREQUENCY RESPONSE
% BY THE MODEL
Kp = mpar(1); taup = mpar(2);zeta = mpar(3);
denG = sqrt(1 + (1*(wdata.*taup).^2).^2+((2*zeta*taup.*wdata).^2));
Gwhat = Kp./denG;