classdef Mixer < handle
    %UNTITLED6 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        freq = 0;
    end
    
    methods
        function obj = Mixer(f)
            obj.freq = f;
        end
        
        function Mix(obj, varargin)
            
        end
    end
end

