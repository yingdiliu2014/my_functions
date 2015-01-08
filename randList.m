function newList = randList(list, n, minstep)

% To generate a random list (length = n) from a given list (1:m), making
% sure that no consecutive values for the generated newList are too close
% to each other (the step in between need to >= minstep)

% Originally written for the experiment SSOVP, where face sizes need to
% vary substantially (perceptually distinguishable) from one cycle to the
% next.
% By Yingdi LIU, Fribourg, 03/11/2014. 

newList = zeros(1,n); 
tmp = randperm(length(list));
old = tmp(1); 
newList(1) = old; 

for ii = 2:n
    
    % exclude all the minstep values around the previous selected value. 
    toExcludetmp = old-(minstep-1):old+(minstep-1);
    % filter values that are under 1 or bigger than the length of list. 
    toExclude = intersect(toExcludetmp,1:length(list));
    
    % what remains is what can be selected for the next value. 
    eligible = setdiff(1:length(list),toExclude); 
    
    % randomly select one from the eligible values. 
    tmp = randperm(length(eligible));
    new = eligible(tmp(1));
    
    newList(ii) = list(new); 
    old = new;
end

end