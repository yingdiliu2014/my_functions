% (batch) rename files in a folder 
% yingdi LIU, Fribourg, 05/11/2014 

faces = dir('*.jpg');

for ii = 1:length(faces)
    
    oldname = faces(ii).name;
    newname = ['f',num2str(ii),'.jpg'];
    
    movefile(oldname,newname)
end


% (potentially) useful function 
[~, f] = fileparts(faces(1).name);