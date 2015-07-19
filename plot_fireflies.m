function plot_fireflies(I, ffLoc, Minimize, x, y, z)
    contour(x, y, z, 15); 
    hold on;
    max_I = max(I);
    for i = 1 : length(I)
        tmp = I(i) / max_I;
        if Minimize == 1, tmp = 1- tmp; end
        color = [tmp, abs(1-tmp), 0];
        plot(ffLoc(i, 1), ffLoc(i, 2), ...
            '.', ...
            'markersize', 20, ...
            'markerfacecolor', color, ...
            'MarkerEdgeColor', color);
    end
end