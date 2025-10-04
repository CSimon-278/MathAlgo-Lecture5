clear;
clc;
close all;

b1 = [1 1 1 1 1];
a1 = 1;

b2 = [1 1 1 1 1 1 1 1 1];
a2 = 1;

b1n = b1/sum(b1);
b2n = b2/sum(b2);

[h1,w1] = freqz(b1,a1,1024);
[h2,w2] = freqz(b2,a2,1024);

figure;
subplot(2,2,1);
plot(w1/pi,abs(h1));
title("5-point Moving Average");

subplot(2,2,3);
plot(w2/pi,abs(h2));
title("9-point Moving Average");

[z1,p1,k1] = tf2zpk(b1n, a1);
[z2,p2,k2] = tf2zpk(b2n, a2);

figure;
subplot(2,2,2);
zplane(z1,p1);
title("Zeros/Poles: 5-point MA");

subplot(2,2,4);
zplane(z2,p2);
title("Zeros/Poles: 9-point MA");
