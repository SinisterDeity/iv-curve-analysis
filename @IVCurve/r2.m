function r2Out = r2(obj)
parfor k = 1:length(obj)
    hold = obj(k).numChannels;
    r2Out(k) = struct('up',zeros(hold,1),'down',zeros(hold,1));
    
    for i = 1:size(obj(k).voltages.up,1)
        [~,~,~,~,r2Out(k).up(i)] = nonlinICFit(obj(k).critVolt(i),obj(k).currents.up,obj(k).voltages.up(i,:),false);
    end
    for i = 1:size(obj(k).voltages.down,1)
        [~,~,~,~,r2Out(k).down(i)] = nonlinICFit(obj(k).critVolt(i),obj(k).currents.up,obj(k).voltages.down(i,:),false);
    end
end
end