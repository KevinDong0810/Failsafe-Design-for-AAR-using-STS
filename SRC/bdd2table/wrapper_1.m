function [map] = wrapper_1(name, state)
    % generate the map from the variable string to the variable number
    % beginnin at 2
    % No file IO exist
    shape = size(state);
    Bit_sum = sum(state(:,end));
    map = cell(2,Bit_sum);
    count = 1;
    for i = 1:shape(1)
        bit_number = state(i,2);
        for j = 1:bit_number
           map{1,count} = strcat(name{i},'_',num2str(j-1));
           map{2,count} = count + 1;
           count = count + 1;
        end
    end
    
end