classdef IVCurve
    properties
        comment = "";
        timestamp = 0;
        ivDuration = 0;
        pointsAveraged = 0;
        field;
        temperature;
        angle;
        position;
        critVolt;
        currents = struct('up',[],'down',[]);
        voltages = struct('up',[],'down',[]);
    end
    methods (Access = public)
        function obj = IVCurve(comment,timestamp,ivDuration,pointsAveraged,field,temperature,angle,position,critVolt,ivChannels)
            if nargin > 0
                obj.comment = comment;
                obj.timestamp = timestamp;
                obj.ivDuration = ivDuration;
                obj.pointsAveraged = pointsAveraged;
                obj.field = field;
                obj.temperature = temperature;
                obj.angle = angle;
                obj.position = position;
                obj.critVolt = critVolt;
                obj.currents = ivChannels.currents;
                obj.voltages = ivChannels.voltages;
            end
        end
    end
end