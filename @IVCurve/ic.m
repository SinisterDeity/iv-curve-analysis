function icOut = ic(obj)
parfor k = 1:length(obj)
    hold = obj(k).numChannels;
    icOut(k) = struct('up',zeros(hold,1),'down',zeros(hold,1));
    
    for i = 1:size(obj(k).voltages.up,1)
        icOut(k).up(i) = nonlinICFit(obj(k).critVolt(i),obj(k).currents.up,obj(k).voltages.up(i,:),false);
    end
    for i = 1:size(obj(k).voltages.down,1)
        icOut(k).down(i) = nonlinICFit(obj(k).critVolt(i),obj(k).currents.up,obj(k).voltages.down(i,:),false);
    end
end
end