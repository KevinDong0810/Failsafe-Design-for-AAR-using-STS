function result = wrapper_4(filepath, sequence, name, state)
    % translate the binary sequence to the decimal and include all the
    % possibilites
    % file write state_iteration:  fid = fopen(tempfile,'w+');
    plant_num = size(state,1);
    sequence_num = size(sequence,1);
    
    result = cell(1 + sequence_num,plant_num);
    for i = 1:sequence_num
        sequence_single = sequence(i,:);
        index_bit = 0;
        file = strcat (filepath, 'wrapper_4_temp.txt');
        for j = 1:plant_num
            binary_code = sequence_single(index_bit+1:index_bit + state(j,2));
            res_temp = wrapper_4_adjunct(binary_code,file,state(j,1));
            res_temp = sort(res_temp);
            res_temp = num2str(res_temp);
            result{1,j} = name{j};
            result{i+1,j} = res_temp;
            index_bit = index_bit + state(j,2);
        end
    end
end

function res = wrapper_4_adjunct(binary_code, tempfile, Max_State)
    fid = fopen(tempfile,'w+');
    state_iteration(binary_code,fid);
    fclose(fid);

    file_length = row_length(tempfile);
    res = zeros(1,file_length);
    fid = fopen(tempfile,'r');
    count = 1;
    for i = 1:file_length
        Tline = fgetl(fid);
        line_temp = str2double(Tline);
        if line_temp < Max_State
            res(count) = line_temp;
            count = count+1;
        end
    end
    fclose(fid);
    res = res (1:count-1);
end

function state_iteration(binary_code, fid)
    uncertain_seq =  find(binary_code >1);
    uncertain_num = numel(uncertain_seq);
    if uncertain_num == 0
        state = my_bin2dec(binary_code);
        fprintf(fid, '%d\n',state);
    else 
        index = uncertain_seq(1);
        binary_code(index) = 0;
        state_iteration(binary_code,fid);
        binary_code(index) = 1;
        state_iteration(binary_code,fid);
    end
end

function res = my_bin2dec(binary_code)
    bit = length(binary_code);
    res = 0;
    for i = 1:bit
        res = res + binary_code(i)*2^(i-1);
    end
end