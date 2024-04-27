function fullOut = fullFit(obj)

parfor k = 1:length(obj)
    hold = obj(k).numChannels;
    icOut(k) = struct('up',zeros(hold,1),'down',zeros(hold,1));
    nOut(k) = struct('up',zeros(hold,1),'down',zeros(hold,1));
    rOut(k) = struct('up',zeros(hold,1),'down',zeros(hold,1));
    offOut(k) = struct('up',zeros(hold,1),'down',zeros(hold,1));
    r2Out(k) = struct('up',zeros(hold,1),'down',zeros(hold,1));
    for i = 1:size(obj(k).voltages.up,1)
        [icOut(k).up(i),nOut(k).up(i),rOut(k).up(i),offOut(k).up(i),r2Out(k).up(i)] = nonlinICFit(obj(k).critVolt(i),obj(k).currents.up,obj(k).voltages.up(i,:),false);
    end
    for i = 1:size(obj(k).voltages.down,1)
        [icOut(k).down(i),nOut(k).down(i),rOut(k).down(i),offOut(k).down(i),r2Out(k).down(i)] = nonlinICFit(obj(k).critVolt(i),obj(k).currents.up,obj(k).voltages.down(i,:),false);
    end
end
fullOut.ic = icOut;
fullOut.n = nOut;
fullOut.r = rOut;
fullOut.off = offOut;
fullOut.r2 = r2Out;

end