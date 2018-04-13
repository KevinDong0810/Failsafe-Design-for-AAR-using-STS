function xml2sts(inputfilelist,outputfilelist)
    %This function transform the supremica xml file into STS style files,
    %which can be used to assemble the input file, say Root.sts, to the
    %STSLib. Note that the user should carefully check the result, since
    %there are differences between Supremica and STSLib in terms of
    %convention.
    %input: inputfilelist is a cell contains the input file name;
    %output: outputfilelist is a cell contains the output file name;
    Num_file = size(inputfilelist,1);
    outputholder = strcat('STSaux_', datestr(clock,'yyyymmddTHHMMSS'));
    mkdir(outputholder);
    for i = 1:Num_file 
        inputfile = strcat('./','xml2stsinputfile','/',inputfilelist{i,1});
        outputfile = strcat('./',outputholder, '/',outputfilelist{i,1});
        [ Event,State,Transitiontable] = xml(inputfile);
        xml_post_process(Event, State, Transitiontable, outputfile);
    end
end

