function [newLoc] = check_bounds(loc, MinBounds, MaxBounds)
    newLoc = loc;
    for index = 1 : length(loc)
        if loc(index) < MinBounds(index), newLoc(index) = MinBounds(index); end
        if loc(index) > MaxBounds(index), newLoc(index) = MaxBounds(index); end
    end
end