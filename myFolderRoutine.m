function myFolderRoutine(go2folder)

% add the current directory (and its subfolders) to Matlab path, taking
% into account the current operational system. 
% if go2folder is provided, locate cd to this folder.  

% wrote this piece of code as a function so that only one line of code is
% needed for my other scripts (no need to copy and poaste all the time). 

% yingdi LIU, 2014.12.20, Fribourg 

%%

pc_folder = cd;
mac_folder = pcFolder2macFolder(pc_folder); 

if ispc == 1 % windows
    folder = pc_folder;
else % mac 
    folder = mac_folder;
end

addpath(genpath(folder))

if nargin == 1
    if ispc == 1
        go2folder = go2folder;
    else
        go2folder = pcFolder2macFolder(pcFolder2macFolder);
    end
    cd(go2folder)
end

end