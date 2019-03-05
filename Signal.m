classdef Signal < handle
    % Signal - ����� ��� �������� ��������: ���������, �����������,
    % �������� � ��...
    
    properties
        fate  = 'test'; % ���������� (main - �������� �������, harm - ���������)
        fr_a  = 0;      % ������� ����� ���������
        freq  = 0;      % �������
        band  = 0;      % ���������� ������
        power = 0;      % ��������
    end
    
    methods
        function obj = Signal(ft, fr, bn, pwr)
            % �����������
            obj.fate = ft;
            obj.freq = fr;
            obj.fr_a = fr;
            obj.band = bn;
            obj.power = pwr;
        end
        
        function Digit(obj, fs)
            % ������������ �������
            fk = fs/2;
            while obj.fr_a > fk
                obj.fr_a = obj.fr_a - fk;
            end
        end
        
        function Filter(obj, val)
            % ���������� ����������
            obj.power = obj.power + val;
        end
        
        function newObj = CreateHarmonic(obj, order, power)
           newObj = Signal(obj.fate, obj.freq*order, 0, power); 
        end
        
    end
end

