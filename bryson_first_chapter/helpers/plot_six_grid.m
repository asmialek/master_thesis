function plot_six_grid(x, y, labels, title)
    figure()
    for i = 1:6
        subplot(2,3,i);
        plot(x, y(:,i))
        ylabel(labels(i))
        xlabel('Time (seconds)')
    end
    sgtitle(title)
end