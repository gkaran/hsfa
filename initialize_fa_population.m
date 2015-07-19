function [ffLoc, I] = initialize_fa_population(f, MinBounds, MaxBounds, n)
    ffLoc = [rand(n,1) * (MaxBounds(1) - MinBounds(1)) + MinBounds(1), ...
        rand(n,1) * (MaxBounds(2) - MinBounds(2)) + MinBounds(2)];
    I = f(ffLoc(:,1), ffLoc(:,2));
end