function bdd_iteration(sequence, indice, bdd_tree, fid)
    if indice == 0
        sequence(1) = 0;
        myprinter(sequence, fid);
    else
        if indice == 1
           sequence(1) = 1;
           myprinter(sequence, fid);
        else
            index = find(bdd_tree(:,1)==indice);
            variable = bdd_tree(index, 2);

            left_child = bdd_tree(index,3);
            left_sequence = sequence;
            left_sequence(variable) = 0;
            bdd_iteration(left_sequence, left_child, bdd_tree, fid);

            right_child = bdd_tree(index,4);
            right_sequence = sequence;
            right_sequence(variable) = 1;
            bdd_iteration(right_sequence, right_child, bdd_tree, fid);            
        end         
    end
end

function myprinter(sequence, fid)
    for i = 1:length(sequence)
        fprintf(fid, '%d ', sequence(i));
    end
    fprintf(fid, '\n');
end