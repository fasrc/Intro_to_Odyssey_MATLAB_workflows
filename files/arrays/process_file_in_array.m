function y = process_file_in_array(filename, line)
    
% simple function to return the length
% from for a given file, and a given row (vector)
    
M = csvread(filename);
y = length(M(line,:));

end
