function plotRaw(obj)

for k = 1:length(obj)
    figure('Name','Raw IV Curve');
    hold on;
    movegui('center');
    title('Raw IV Curve');
    xlabel('Current [A]');
    ylabel('Voltage [V]');
    legendHold = strings(1,length(obj(k).currents)*(~isempty(obj(k).currents(1).down)+1));
    j = 1;
    for i = 1:size(obj(k).voltages.up,1)
        plot(obj(k).currents.up,obj(k).voltages.up(i,:),Symbols(i),'Color',Colors(i));
        legendHold(j) = strcat("CH",num2str(i)," up");
        j = j + 1;
    end
    for i = 1:size(obj(k).voltages.down,1)
        if(~isempty(obj(k).currents.down))
        plot(obj(k).currents.down,obj(k).voltages.down(i,:),Symbols(i),'Color',Colors(i));
        legendHold(j) = strcat("CH",num2str(i)," up");
        j = j + 1;
        end
    end
    legend(legendHold,'Location','northwest');
    hold off;
end

end