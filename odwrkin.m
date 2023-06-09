function [alfa, beta] = odwrkin(x, y, l1, l2)
    c2 = (x.^2 + y.^2 - l1^2 - l2^2) / (2 * l1 * l2);
    s2 = sqrt(1 - c2.^2);
    k1 = l1+(l2 * c2);
    k2 = l2*s2;
    alfa = atan2(y, x) - atan2(k2, k1);
    beta = atan2(s2, c2);
end