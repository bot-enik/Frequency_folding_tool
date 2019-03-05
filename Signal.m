classdef Signal < handle
    % Signal - класс для описания сигналов: основного, зеркального,
    % гармоник и тд...
    
    properties
        fate  = 'test'; % Назначение (main - основная частота, harm - гармоника)
        fr_a  = 0;      % Частота после оцифровки
        freq  = 0;      % Частота
        band  = 0;      % Занимаемая полоса
        power = 0;      % Мощность
    end
    
    methods
        function obj = Signal(ft, fr, bn, pwr)
            % Конструктор
            obj.fate = ft;
            obj.freq = fr;
            obj.fr_a = fr;
            obj.band = bn;
            obj.power = pwr;
        end
        
        function Digit(obj, fs)
            % Оцифровываем частоту
            fk = fs/2;
            while obj.fr_a > fk
                obj.fr_a = obj.fr_a - fk;
            end
        end
        
        function Filter(obj, val)
            % Фильтрация компоненты
            obj.power = obj.power + val;
        end
        
        function newObj = CreateHarmonic(obj, order, power)
           newObj = Signal(obj.fate, obj.freq*order, 0, power); 
        end
        
    end
end

