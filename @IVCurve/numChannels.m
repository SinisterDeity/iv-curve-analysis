function channelsOut = numChannels(obj)
channelsOut = max(size(obj.voltages.up,1),size(obj.voltages.down,1));
end

