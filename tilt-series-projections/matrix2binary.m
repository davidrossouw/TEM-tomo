function matrix2binary(array, filename)
%% from Lewys Jones' website: http://lewysjones.com
computer_type = computer ;
if strcmp(computer_type,'PCWIN') == 1
    fid = fopen(filename,'w');
    fwrite(fid, array , 'double', 'a');
    fclose(fid);
elseif strcmp(computer_type,'PCWIN64') == 1
    fid = fopen(filename,'w');
    fwrite(fid, array , 'double', 'a');
    fclose(fid);
end
