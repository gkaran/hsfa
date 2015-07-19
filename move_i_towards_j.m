function [newLoc] = move_i_towards_j(aloc, loc, i, j, a, b, g, ...
    MinBounds, MaxBounds)
    r = sqrt(sum((aloc(i,:) - loc(j,:)).^2));
    newLoc = aloc(i,:) + b .* exp(-g .* r .^ 2) .* ...
        (loc(j,:) - aloc(i,:)) + a .* (rand() - 0.5);
    newLoc = check_bounds(newLoc, MinBounds, MaxBounds);
end