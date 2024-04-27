function [positions,ns] = nVPosition(obj,angle,field,temperature,plotDesired)

curveStore = obj.findMatch(angle,field,[],temperature);
positions = [curveStore.position];
ns = [curveStore.n];
if(plotDesired)
    figure('Name',strcat('n vs. Position: ',obj.name));
    hold on;
    xlabel('Position [m]');
    ylabel('n');
    title('n vs. Position');
    k = 1;
    legendHold = strings(2,1);
    for i = 1:length(ns)
        for j = 1:length([ns(i).up])
            plot(positions(i)/1000,ns(i).up(j),'Color',Colors(j),'Marker','.');
            if(i==1)
                legendHold(k) = strcat('CH',num2str(j),' Up');
                k = k + 1;
            end
        end
        for j = 1:length([ns(i).down])
            if(ns(i).down(j) ~= 0)
                plot(positions(i)/1000,ns(i).up(j),'Color',abs(Colors(j)-0.5),'Marker','.');
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