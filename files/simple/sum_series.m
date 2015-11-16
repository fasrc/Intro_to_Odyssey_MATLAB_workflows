function result = sum_series(start, finish)
    
% simple function to return the sum of a series of numbers
% from start to finish
    
result = 0;

for index = start:finish
    result = result + index;

end
