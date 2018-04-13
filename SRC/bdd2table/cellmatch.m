function [indice] = cellmatch(string,celldata)
    cell_length = size(celldata,2);
    indice = -1; %set the default value
    for i = 1:cell_length
        cellstring = celldata{1,i};
        if strcmp(string, cellstring)
            indice = i;
            break
        end
    end
end