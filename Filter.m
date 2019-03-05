classdef Filter < handle
    % ������������ �������� �������
    
    properties
        p1 = 0;
        p2 = 0;
        p3 = 0;
        p4 = 0;
    end
    
    methods
        function obj = Filter(p1, p2, p3, p4)
            obj.p1 = p1; % ����� ��������� �� 100 ��
            obj.p2 = p2; % ������� �������� ���������
            obj.p3 = p3; % ������� �������� ���������
            obj.p4 = p4; % ����� ��������� �� 100 ��
        end
        
        function filtering(obj, varargin)
            for i=0:lenght(varargin)
                freq = varargin{i};
                if freq < obj.p2
                    val = 100*(freq-obj.p1)/(obj.p2 - obj.p1);
                elseif freq >= obj.p2 && freq <= obj.p3
                    val = 0;
                else
                    val = -100*(freq-obj.p3)/(obj.p4 - obj.p3);
                end
                
                varargin{i}.filter(val);
            end
        end
        
    end
end

