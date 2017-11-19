function sequence = wrapper_3(targetfile, bdd_tree, n)
    % using the Binary Decision Diagram Tree to generate the control
    % sequence, bit = 3 means that it could either be 0 or 1
    % file write exist fid = fopen(targetfile,'w+');
    fid = fopen(targetfile,'w+');
    sequence = 3*ones(1,n+1);
    init_indice = bdd_tree(1);
    bdd_iteration(sequence, init_indice, bdd_tree, fid);
    fclose(fid);
    
    sequence = wrapper_3_adjunct(targetfile,n);
end

function sequence = wrapper_3_adjunct(outputfile, state_total)
    file_length = row_length(outputfile);
    fid = fopen(outputfile, 'r');
    if fid == -1
        error('No such file');
    end
    sequence = zeros(file_length, state_total);
    count_sequence = 1;
    for i = 1 : file_length
        Tline = fgetl(fid);
        Split = regexp(Tline, '\s+', 'split');
        if Split{1} == '0'
            continue;
        else
            sequence_temp = zeros(1, state_total);
            for j = 1:state_total
                sequence_temp(j) = str2double(Split{j+1});
            end
            sequence(count_sequence,:) = sequence_temp;
            count_sequence = count_sequence + 1;
        end
    end
    sequence = sequence(1:count_sequence-1,:);
    fclose(fid);
end