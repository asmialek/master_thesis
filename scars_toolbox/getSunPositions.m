function pos = getSunPositions(initial_time, simulation_time, dT)
    pos = [];
    juliansec = juliandate([2000 1 1 12 0 1]) - juliandate([2000 1 1 12 0 0]);
    for time = 0:dT:simulation_time
        pos = [pos; [planetEphemeris(initial_time+time*juliansec, 'Earth', 'Sun')]];
    end
end
