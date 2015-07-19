function [I, ffLoc] = update_ligh_intensity(f, ffLoc, Minimize)
    I = f(ffLoc(:,1), ffLoc(:,2));
    if Minimize == 1
        [I, index] = sort(I);
    elseif Minimize == 0
        [I, index] = sort(I, 'descend');
    end
    ffLoc = ffLoc(index, :);
end