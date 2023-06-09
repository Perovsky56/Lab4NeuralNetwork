function[x, y] = prostkin(alfa, beta, l1, l2)
    x = l1 * cos(alfa) + l2 * cos(alfa + beta);
    y = l1 * sin(alfa) + l2 * sin(alfa + beta);
end