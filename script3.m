close all
clear
load dane_ucz.mat

xab = [0:0.05:1];
yab = [0:-0.05:-1];
xbc = ones(1, 21);
ybc = [-1:0.05:0];

xt = [xab xbc];
yt = [yab ybc];

% rozszerzenie o punkt D
xcd = [1:-0.05:0]
ycd = [0:-0.05:-1];

xda = zeros(1, 21);
yda = [-1:0.05:0];

xt = [xab xbc xcd xda];
yt = [yab ybc ycd yda];


figure
plot(xt,yt,'ro-') 

PT = [xt; yt];
YT = sim(net, PT);

alfast = YT(1,:);
betast = YT(2,:);

[alfat, betat] = odwrkin(xt, yt, l1, l2);
figure
plot(alfat,'ro-')
hold on
plot(alfast,'b*-')
plot(betat,'go-')
plot(betast,'m*-')
xlabel('Indeks wartości w wektorze')
ylabel('Wartość kąta')
title('Porównanie wartości kątów α i ß dla trajektorii testowej')
legend({'Wartości kątów α (wzorzec)', 'Wartości kątów α (sieć)', 'Wartości kątów ß (wzorzec)', 'Wartości kątów ß (sieć)'}, 'Location', 'east')


[xts, yts] = prostkin(alfast, betast, l1, l2);
figure(1)
hold on
plot(xts, yts, 'bo-')
xlabel('Współrzędna x')
ylabel('Współrzędna y')
title('Porównanie trajektorii wzorcowej i wygenerowanej przez sieć')
legend({'Trajektoria wzorcowa', 'Trajektoria wygenerowana przez sieć neuronową'}, 'Location', 'north')
