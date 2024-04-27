function cleanCurves = garbageCheck(obj)

curveStore = obj.Curves;
holder = [curveStore.fullFit];
checkUp = ([holder.ic.up]>5) & ([holder.n.up]>1) & ([abs([holder.r.up])] < 1e-6) & ([abs([holder.off.up])] < 1e-3) & ([holder.r2.up] > 0.1); %#ok<NBRAK>
holder = checkUp(1,:);
for i = 2:size(checkUp,1)
    holder = holder & checkUp(i,:); 
end
cleanCurves = curveStore(holder);

end