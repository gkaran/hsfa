function [ffp] = initialize_fireflies_plot()
    ffp = figure(2);
    set(ffp, 'name', 'Fireflies positions');
    pos = get(ffp,'Position');
    pos(1) = pos(1) + pos(3) + 50;
    set(ffp, 'Position', pos);
end