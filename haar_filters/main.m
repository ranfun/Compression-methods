clc;
close all;
clear all;
x=linspace(-3,3,1024);
y=x.^2.*(1-x).^2.*cos(2*pi*x);
subplot(4,1,1);
plot(x,y);
title("Original Signal");
[a,d]=haart(y); %this calculates the Haar transform down to log2(1024) = 10 times
[a1,d1]=haart(y,1);
approx_energy1=sum(a1.^2);
detail_energy1=sumsqr(d1);
[a2,d2]=haart(y,2);
approx_energy2=sum(a2.^2);
detail_energy2=sumsqr(d2);
[a3,d3]=haart(y,3);
approx_energy3=sum(a3.^2);
detail_energy3=sumsqr(d3);
y1=ihaart(a,d,1); %to plot l1-decomposed signal against x
y2=ihaart(a,d,2); %to plot l2-decomposed signal against x
y3=ihaart(a,d,3); %to plot l3-decomposed signal against x
subplot(4,1,2);
plot(x,y1)
title("After L1 Decomposition")
subplot(4,1,3);
plot(x,y2)
title("After L2 Decomposition")
subplot(4,1,4);
plot(x,y3)
title("After L3 Decomposition")
Energy = sum(y.^2);

fprintf('The energy of the original signal = %f \n',Energy)
fprintf('The approximate energy components of the signal after L1 Decomposition = %f\n',approx_energy1)
fprintf('The detailed energy components of the signal after L1 Decomposition = %f\n',detail_energy1)
fprintf('The approximate energy components of the signal after L2 Decomposition = %f\n',approx_energy2)
fprintf('The detailed energy components of the signal after L2 Decomposition = %f\n',detail_energy2)
fprintf('The approximate energy components of the signal after L3 Decomposition = %f\n',approx_energy3)
fprintf('The detailed energy components of the signal after L3 Decomposition = %f\n',detail_energy3)