function matchingCurves = findMatch(obj,angle,field,position,temperature)

curveStore = obj.Curves;
if(~isempty(angle))
    curveStore = curveStore(ismember(round([curveStore.angle],1),round(angle,1)));
end
if(~isempty(field))
    curveStore = curveStore(ismember(round([curveStore.field],1),round(field,1)));
end
if(~isempty(position))
    curveStore = curveStore(ismember(round([curveStore.position],1),round(position,1)));
end
if(~isempty(temperature))
    curveStore = curveStore(ismember(round([curveStore.temperature],1),round(temperature,1)));
end
matchingCurves = curveStore;

end