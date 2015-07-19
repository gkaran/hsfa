function [best] = FA(n, maxGeneration)
    [~, ~, ~, ~, ~, alpha, gamma, beta0, delta] = get_variables();
    Minimize = should_minimize();
    [MinBounds, MaxBounds, f] = get_objective_function();
    
    [ffLoc, I] = initialize_fa_population(f, MinBounds, MaxBounds, n);
    [x, y, z] = plot_3d_function(f, MinBounds, MaxBounds);
    
    initialize_fireflies_plot();
    for step = 1 : maxGeneration
        plot_fireflies(I, ffLoc, Minimize, x, y, z);
        ffLocTmp = ffLoc;
        for i = 1 : n
            for j = 1 : n
                if (Minimize == 1 && I(j) < I(i)) ...
                        || (Minimize == 0 && I(j) > I(i))
                    ffLoc(i, :) = move_i_towards_j(ffLoc, ffLocTmp, i, j, ...
                        alpha, beta0, gamma, MinBounds, MaxBounds);
                end
            end
        end
        drawnow;
        hold off;
        [I, ffLoc] = update_ligh_intensity(f, ffLoc, Minimize);
        alpha = new_alpha(alpha,delta);
    end
    
     best = ffLoc;
     best(:,3) = I;
     printResults(best, n);
end