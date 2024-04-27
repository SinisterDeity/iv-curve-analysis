function plotFitted(obj)
for k = 1:length(obj)
    for i = 1:size(obj(k).voltages.up,1)
        nonlinICFit(obj(k).critVolt(i),obj(k).currents.up,obj(k).voltages.up(i,:),true);
    end
    for i = 1:size(obj(k).voltages.down,1)
        if(~isempty(obj(k).voltages.down))
            nonlinICFit(obj(k).critVolt(i),obj(k).currents.down,obj(k).voltages.down(i,:),true);
        end
    end
end
end