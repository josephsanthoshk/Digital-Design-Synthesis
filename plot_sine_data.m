function process_simulation_data(frequency)
    % Construct the filename based on frequency
    filename = sprintf('simulation_data_%s.txt', frequency);

    % Read the simulation data from the file
    data = load(filename);

    % Extract time, phase, and sine data
    time = data(:, 1);
    phase = data(:, 2);
    data_sin = data(:, 3);

    % Plot the data
    figure;
    plot(time, data_sin);
    xlabel('Time (ns)');
    ylabel('Amplitude');
    title(sprintf('Sine Wave Simulation for %s kHz', frequency));
end
