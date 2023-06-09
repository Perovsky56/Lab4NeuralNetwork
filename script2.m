close all
clear
load dane_ucz.mat

Y = sim(net, P);

alfa = T(1,:);
beta = T(2,:);
alfas = Y(1,:);
betas = Y(2,:);

E = [alfa - alfas; beta - betas]
SSE = (1 / (size(T, 1) * size(T, 2))) * sumsqr(E)
disp(['Sumaryczny błąd średniokwadratowy (SSE): ' num2str(SSE)]);

figure
plot(alfa, 'ro-')
hold on
plot(alfas, '+-', 'Color', 'red')
plot(beta, 'bo-')
plot(betas, '+-', 'Color', 'blue')
xlabel('Indeks wartości w wektorze')
ylabel('Wartość kąta')
title('Porównanie wartości kątów α i ß')
legend({'Wartości kątów α (wzorzec)', 'Wartości kątów α (sieć)', 'Wartości kątów ß (wzorzec)', 'Wartości kątów ß (sieć)'}, 'Location','east')

figure
plot(E(1,:), 'r')
hold on
plot(E(2,:), 'b')
xlabel('Indeks wartości w wektorze')
ylabel('Błąd aproksymacji')
title('Wykres błędów aproksymacji wartości kątów α i ß')
legend({'Błąd aproksymacji α', 'Błąd aproksymacji ß'}, 'Location', 'north')

[xs, ys] = prostkin(alfas, betas, l1, l2);
figure
x = P(1,:);
y = P(2,:);
plot(x, y, 'r*-')
hold on
plot(xs, ys, 'b*-')
xlabel('Współrzędna x')
ylabel('Współrzędna y')
title('Porównanie trajektorii wzorcowej i wygenerowanej')
legend({'Trajektoria wzorcowa', 'Trajektoria wygenerowana przez sieć neuronową'}, 'Location', 'southeast')