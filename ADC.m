classdef ADC
    % ADC - �����, ����������� ���
    properties
        fs = 0;
    end
    
    methods
        function obj = ADC(fr)
            obj.fs = fr;
        end
        
        function outputArg = Digitize(obj, list)
            % ��������� �� ���
            % ������������ ������ ������� �������
            for i = 1:length(list)
                list{i}.Digit(obj.fs);
            end   
        end
    end
end

