x = [0 0 1 1 1 0 0];
y = [0 1 2 3 2 1 0];
z = conv(x,y);
figure;
n = -6:6;

subplot(3,1,1);
stem(-3:3,x);
xlabel('n');
ylabel('x[n]');

subplot(3,1,2);
stem(-3:3,y);
xlabel('n');
ylabel('h[n]');

subplot(3,1,3);
stem(n,z);
xlabel('n');
ylabel('y[n] = x[n]*h[n]');

