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