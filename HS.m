function [best] = HS
    [HMS, MAXIT, HMCR, PAR, bw, ~, ~, ~, ~] = get_variables();
    Minimize = should_minimize();
    [MinBounds, MaxBounds, f, D] = get_objective_function();

    plot_3d_function(f, MinBounds, MaxBounds);

    [HM, HF, HMN] = initialize(MinBounds, MaxBounds, HMS, D, f);
    [WorstFit, WorstLoc] = findWorstLoc(Minimize, HF);

    for iteration = 1:MAXIT
        if rand() < HMCR
            for i = 1 : D
                HMN(i) = randi([1, HMS], 1);
                if rand() < PAR
                    HMN(i) = HMN(i) + bw .* (2 .* rand - 1);
                end
            end
        else
            HMN = MinBounds + (MaxBounds - MinBounds) .* rand(1, D);
        end
        XW = f(HMN(1), HMN(2));
        if XW < WorstFit
            HM(WorstLoc,:) = HMN;
            HF(WorstLoc) = XW;
            [WorstFit, WorstLoc] = findWorstLoc(Minimize, HF);
        end
    end
    printResults(sort_results(HM, HF, Minimize), HMS);
end

function [HM, HF, HMN] = initialize(MinBounds, MaxBounds, HMS, D, f)
    HM = zeros(HMS, D);
    for i = 1:HMS
        HM(i, :) = MinBounds + (MaxBounds - MinBounds) .* rand(1, D);
    end
    HF = f(HM(:, 1), HM(:, 2));
    HMN = zeros(2,1);
end

function [WorstFit, WorstLoc] = findWorstLoc(Minimize, HF)
    if Minimize == 1
        [WorstFit, WorstLoc] = max(HF);
    else
        [WorstFit, WorstLoc] = min(HF);
    end
end

function [best] = sort_results(HM, HF, Minimize)
    x = HM;
    y = HF;
    
    if Minimize == 1
        [y, index] = sort(y);
    elseif Minimize == 0
        [y, index] = sort(y, 'descend');
    end
    x = x(index, :);
    
    best = x;
    best(:, 3) = y;
end