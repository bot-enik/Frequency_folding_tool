classdef ADC
    % ADC - класс, описывающий АЦП
    properties
        fs = 0;
    end
    
    methods
        function obj = ADC(fr)
            obj.fs = fr;
        end
        
        function outputArg = Digitize(obj, list)
            % Оцифровка на АЦП
            % Оцифровываем каждую входную частоту
            for i = 1:length(list)
                list{i}.Digit(obj.fs);
            end   
        end
    end
end

