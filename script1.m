close all
clear

l1 = 1;
l2 = 1;
xsr = 0.5;
ysr = -0.5;

fi = 0:0.5:49.5;
r = 0.01 * fi;

[x, y] = pol2cart(fi, r);
x = x+xsr;
y = y+ysr;
figure(1)
plot(x, y, 'r*-');
xlabel('Współrzędna x')
ylabel('Współrzędna y')
title('Wzorzec spirali')

[alfa, beta] = odwrkin(x, y, l1, l1);

figure(2)
plot(alfa, 'r*-')
hold on
plot(beta, 'b*-')
xlabel('Indeks wartości w wektorze')
ylabel('Wartość kąta')
legend({'kąty α', 'kąty ß'}, 'Location', 'east')
title('Porównanie wartości kątów wzorcowych α i ß')

P = [x; y];
T = [alfa; beta];

net = newff(P, T, 10);
net.layers{1}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'purelin';
L1 = net.IW{1}
L2 = net.LW{2}
b1 = net.b{1}
b2 = net.b{2}

net.trainFcn = 'traingdx';
net.trainParam.goal = 0.0001;
net.trainParam.epochs = 500;
net.trainParam.max_fail = net.trainParam.epochs;

net = train(net, P, T);

save dane_ucz net l1 l2 P T