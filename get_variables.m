function [HMS, MAXIT, HMCR, PAR, BW, ALPHA, GAMMA, BETA0, DELTA] = get_variables
    %% HS VARIABLES
    HMS   =   300    ; % Harmony memory size
    MAXIT = 10000    ; % Maximum iterations
    HMCR  =     0.95 ; % Memory considetation
    PAR   =     0.3  ; % Pitch adjustment rate
    BW    =     0.2  ; % The pitch adjustment bandwidth
    
    %% FA VARIABLES
    ALPHA =     0.2  ; % Randomness 0--1 (highly random)
    GAMMA =     1.0  ; % Absorption coefficient
    BETA0 =     1    ; % maximum attractiveness
    DELTA =     0.97 ; % Randomness reduction (similar to an annealing schedule)
end