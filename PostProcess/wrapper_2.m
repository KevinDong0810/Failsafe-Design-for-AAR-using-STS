function [map_indice,bdd_tree] = wrapper_2(sourcefile, map)
    % translate the control function output from Ma's software to numeric
    % BDD array
    % file read exist  fid = fopen(sourcefile,'r')
    fid = fopen(sourcefile,'r');
    if fid == -1
        error('No such file exists \n');
    end
    file_length = row_length(sourcefile);
    iter = (file_length - 5)/3;
    map_indice = zeros(iter,2);
    bdd_tree = zeros(iter,4);
    count_indice = 1;
    fgetl(fid);
    fgetl(fid);
    fgetl(fid);% skip initial three lines
    for i = 1:iter
        Tline = fgetl(fid);
        [indice_origin, indice_bdd] = indice_process(Tline, map);
    
        map_indice(count_indice,1) = indice_origin;
        map_indice(count_indice,2) = indice_bdd;
        
        Tline = fgetl(fid);
        left_child = child_process(Tline);
        Tline = fgetl(fid);
        right_child = child_process(Tline);
        bdd_tree(count_indice,:) = [indice_origin, indice_bdd, left_child, right_child]; % left = 0, right = 1;
        count_indice = count_indice + 1;
     end
    fclose(fid);
    
end

function [indice_origin, indice_bdd] = indice_process(Tline, map)
    Split_1 = regexp(Tline, '\s+', 'split');
    indice_origin = str2double(Split_1{1}); % get the indice of variable in the origin output file
    Split_2 = regexp(Split_1{2}, '\"','split');
    variable_name = Split_2{2};
    indice_temp = cellmatch(variable_name, map(1,:));
    if indice_temp == -1
        disp(variable_name);
    end
    indice_bdd  = map{2,indice_temp};  
end

function [child] = child_process(Tline)
    Split = regexp(Tline, '\s+', 'split');
    child = str2double(Split{3});
end

function file_length = row_length(filename)
    % count the line using ther perl
    if exist('countlines.pl','file')~=2
        fid=fopen('countlines.pl','w');
        fprintf(fid,'%s\n%s','while (<>) {};','print $.,"\n";');
        fclose(fid);
     end
        % Ö´ÐÐperl½Å±¾
        file_length=str2double( perl('countlines.pl', filename) );
end