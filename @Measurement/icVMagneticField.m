function [fields,ics] = icVMagneticField(obj,angle,position,temperature,plotDesired)

curveStore = obj.findMatch(angle,[],position,temperature);
fields = [curveStore.field];
ics = [curveStore.ic];
if(plotDesired)
    figure('Name',strcat('I_c vs. Magnetic Field: ',obj.name));
    hold on;
    xlabel('Magnetic Field [T]');
    ylabel('I_c [A]');
    title('I_c vs. Magnetic Field');
    k = 1;
    legendHold = strings(2,1);
    for i = 1:length(ics)
        for j = 1:length([ics(i).up])
            plot(fields(i),ics(i).up(j),'Color',Colors(j),'Marker',Symbols(j));
            if(i==1)
                legendHold(k) = strcat('CH',num2str(j),' Up');
                k = k + 1;
            end
        end
        for j = 1:length([ics(i).down])
            if(ics(i).down(j) ~= 0)
                plot(fields(i),ics(i).up(j),'Color',abs(Colors(j)-0.5),'Marker',Symbols(j));
                if(i==1)
                    legendHold(k) = strcat('CH',num2str(j),' Down');
                    k = k + 1;
                end
            end
        end
    end
    legend(legendHold);
end

end