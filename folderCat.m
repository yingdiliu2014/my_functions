function outputFolder = folderCat(folder, subfolder)

% folder should end in slash while subfolder should not start with slash.
% assuming that everything is in my normal work space (google drive)

% by Yingdi LIU, 2015/01/08, Fribourg


%% deal the subfolder first

if strfind(subfolder,'/') == 1 % mac
    if ispc == 1 % mac subfolder on pc 
        indx = strfind(subfolder,'/');
        subfolder(indx) = '\';
    end
elseif strfind(subfolder,'\') == 1 % pc
    if ispc == 0 % pc subfolder on mac 
        indx = strfind(subfolder,'\');
        subfolder(indx) = '/';
    end
end


%% concatenate

if ispc == 1
    myslash = '\';
else
    myslash = '/';
end
        
if ispc == detectFolderOS(folder) % path name accord with current sys 
    outputFolder = [folder, myslash, subfolder];
else 
    if ispc == 1 % mac path on pc sys 
        outputFolder = [pcFolder2macFolder(folder,1),myslash,subfolder];
    else % pc path on mac sys
        outputFolder = [pcFolder2macFolder(folder),myslash,subfolder];
    end
end
        
    
end
