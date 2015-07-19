function [x, y, z] = plot_3d_function(f, MinBounds, MaxBounds)
    step = 0.1;
    [x, y] = meshgrid(MinBounds(1) : step : MaxBounds(1), ...
        MinBounds(2) : step : MaxBounds(2));
    z = f(x, y);
    fp = figure(1);
    set(fp, 'name', '3D plot of the function');
    surfc(x, y, z);
end