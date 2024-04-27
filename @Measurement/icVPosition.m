function [positions,ics] = icVPosition(obj,angle,field,temperature,plotDesired)

curveStore = obj.findMatch(angle,field,[],temperature);
positions = [curveStore.position];
ics = [curveStore.ic];
if(plotDesired)
    figure('Name',strcat('I_c vs. Position: ',obj.name));
    hold on;
    xlabel('Position [m]');
    ylabel('I_c [A]');
    title('I_c vs. Position');
    k = 1;
    legendHold = strings(2,1);
    for i = 1:length(ics)
        for j = 1:length([ics(i).up])
            plot(positions(i)/1000,ics(i).up(j),'Color',Colors(j),'Marker','.');
            if(i==1)
                legendHold(k) = strcat('CH',num2str(j),' Up');
                k = k + 1;
            end
        end
        for j = 1:length([ics(i).down])
            if(ics(i).down(j) ~= 0)
                plot(positions(i)/1000,ics(i).up(j),'Color',abs(Colors(j)-0.5),'Marker','.');
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