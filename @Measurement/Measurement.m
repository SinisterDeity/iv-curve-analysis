classdef Measurement
    %{
    A class for the analysis of many IV curves
    %}
    properties
        Curves; %Array of IVCurve classes  
        name; %Sample Name
    end
    
    methods
        function obj = Measurement()
        end
    end
end

