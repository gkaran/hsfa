function [MinBounds, MaxBounds, f, D] = get_objective_function
	% D is the problem dimension - Currently only 2D problems are supported
    D = 2; % Problem dimension
    [MinBounds, MaxBounds, strFunction] = get_ackleys();
    f = vectorize(inline(strFunction));
end

function [MinBounds, MaxBounds, strFunction] = get_ackleys
	str1 = '-20 * exp(-0.2*sqrt(0.5*(x^2 + y^2)))';
    str2 = '- exp(0.5*(cos(2*pi*x) + cos(2*pi*y))) + 20 + exp(1)';
    strFunction = strcat(str1,str2);
    MinBounds   = [-5 -5];
    MaxBounds   = [5 5];
end

function [MinBounds, MaxBounds, strFunction] = get_beales
	str1 = '(1.5 - x + x * y)^2 + (2.25 - x + x * y^2)^2';
	str2 = '+ (2.625  - x + x * y^3)^2';
	strFunction = strcat(str1,str2);
    MinBounds   = [-4.5 -4.5];
    MaxBounds   = [4.5 4.5];
end

function [MinBounds, MaxBounds, strFunction] = get_goldstein_price
	str1 = '(1 + (x + y + 1)^2 * (19 - 14*x + 3*x^2 - 14*y + 6*x*y + 3*y^2))';
	str2 = '* (30 + (2*x - 3*y)^2 * (18 - 32*x  + 12*x^2 + 48*y - 36*x*y + 27*y^2))';
	strFunction = strcat(str1,str2);
	MinBounds   = [-2 -2];
    MaxBounds   = [2 2];
end

function [MinBounds, MaxBounds, strFunction] = get_booths
	str1 = '(x + 2*y - 7)^2 + (2*x + y - 5)^2';
	str2 = '';
	strFunction = strcat(str1,str2);
	MinBounds   = [-10 -10];
    MaxBounds   = [10 10];
end

function [MinBounds, MaxBounds, strFunction] = get_bukin_no6
	str1 = '100 * sqrt(abs(y - 0.01 * x^2)) + 0.01 * abs(x + 10)';
	str2 = '';
	strFunction = strcat(str1,str2);
	MinBounds   = [-15 -3];
    MaxBounds   = [-5 3];
end

function [MinBounds, MaxBounds, strFunction] = get_matyas
	str1 = '0.26 * (x^2 + y^2) - 0.48*x*y';
	str2 = '';
	strFunction = strcat(str1,str2);
	MinBounds   = [-10 -10];
    MaxBounds   = [10 10];
end