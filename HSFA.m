function [best] = HSFA(n, keep, maxGeneration)
    [~, ~, HMCR, PAR, bw, alpha, gamma, beta0, delta] = get_variables();
    Minimize = should_minimize();
    [MinBounds, MaxBounds, f, D] = get_objective_function();
    
    [ffLoc, I] = initialize_fa_population(f, MinBounds, MaxBounds, n);
    [x, y, z] = plot_3d_function(f, MinBounds, MaxBounds);
    
    initialize_fireflies_plot();
    for step = 1 : maxGeneration
        [ffLoc, I] = sort_fireflies(ffLoc, I, Minimize);
        plot_fireflies(I, ffLoc, Minimize, x, y, z);
        ffLocTmp = ffLoc;
        for i = 1 : keep
            for j = 1 : n
                if (Minimize == 1 && I(j) < I(i)) ...
                        || (Minimize == 0 && I(j) > I(i))
                    ffLoc(j, :) = move_i_towards_j(ffLoc, ffLocTmp, j, ...
                        i, alpha, beta0, gamma, MinBounds, MaxBounds);
                else
                    ffLoc(j, :) = mutate(ffLoc, HMCR, PAR, bw, D, n, ...
                        MinBounds, MaxBounds);
                end
                I(j) = f(ffLoc(j,1), ffLoc(j,2));
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

function [ffLoc, I] = sort_fireflies(ffLoc, I, Minimize)
    if Minimize == 1
        [I, index] = sort(I);
    elseif Minimize == 0
        [I, index] = sort(I, 'descend');
    end
    ffLoc = ffLoc(index, :);
end

function [loc] = mutate(ffLoc, HMCR, PAR, bw, D, n, MinBounds, MaxBounds)
    loc = rand(1, D);
    for k = 1 : D
        if rand < HMCR
            r = randi([1, n]);
            loc(1, k) = ffLoc(r, k);
            if rand() < PAR
                loc(1, k) = loc(1, k) + bw .* (2 .* rand - 1);
            end
        else
            loc(1, k) = MinBounds(k) + rand * (MaxBounds(k) - MinBounds(k));
        end
    end
    loc = check_bounds(loc, MinBounds, MaxBounds);
end