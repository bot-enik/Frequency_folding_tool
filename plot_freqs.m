function plot_freqs(adc, text, list)
    
    vals = [];
    power = [];
    name = [];
    max_fr = 0;
    for i=1:length(list)

        name = [name, str2double(list{i}.fate(4))];
        vals = [vals, list{i}.fr_a];
        power = [power, list{i}.power];
        if list{i}.fr_a > max_fr
            max_fr = list{i}.fr_a;
        end
    end
    if adc
        stem(adc, 0, 'LineStyle','-.',...
                     'MarkerFaceColor','red',...
                     'MarkerEdgeColor','green');
    end
    
    for i=1:length(list)
        hold on;
        switch name(i)
            case 1
                colorType = 'r';
            case 2
                colorType = 'g';
            case 3
                colorType = 'b';
            case 4
                colorType = 'y';
            case 5
                colorType = 'm';
            otherwise
                colorType = 'o';
        end
        stem(vals(i), power(i), 'filled', colorType);
    end
    title(text);
   
end