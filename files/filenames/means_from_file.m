function means = means_from_file(filename)
    
% simple function to return the means
% from for a given file
    
M = csvread(filename);
means = mean(M);

end
