% Input design
B_max = 1/5;
Ts= 0.2;
usig = idinput(2555,'prbs',[0 B_max],[-1 1]);
uin = [(0:1:length(usig)-1)'*Ts (usig)];
% Input-output data profile
data=iddata(yk,uk,1);
plot(data)
% Partitioning data into train and test set
data_train=data(1:300);
data_test=data(301:end);

[ztrain,Tr]=detrend(data_train,0);
ztest=detrend(data_test,Tr);

sys = impulseest(ztrain);
figure
impulse(sys)
figure
step(sys)

model_oe = oe(ztrain,[2 2 5])
resid(model_oe,ztrain)
compare(model_oe,ztest)
present(model_oe)

