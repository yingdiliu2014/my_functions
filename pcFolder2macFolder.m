function outputFolder = pcFolder2macFolder(inputFolder,optional)

% transform a path name to the equivalent on another operational sys.
% if optional is 1, then the other way around (mac folder 2 pc folder)

% by Yingdi LIU, 2015/01/08, Fribourg

%% Assumptions

% 1. assuming that the folder of interest is or is a subfolder of the google
% drive.

% 2. The drive folder (on mac) is in the '/Users/yingdiliu'
mac_prefix = '/Users/yingdiliu/'; 
pc_prefix = 'C:\Users\Liuy\Google\Google ';


%% the code 

if nargin == 1 % only one argument (the folder) --> pc to mac 
    
    DriveStartIdx = strfind(inputFolder, 'Drive');
    temp = inputFolder(DriveStartIdx:end); 
    slashesIdx = strfind(temp,'\');
    temp(slashesIdx) = '/';
    outputFolder = [mac_prefix temp];
    
elseif nargin == 2 && optional==1 % two input arguments (implying the inverse)
    
    % mac to pc 
    DriveStartIdx = strfind(inputFolder, 'Drive');
    temp = inputFolder(DriveStartIdx:end); 
    slashesIdx = strfind(temp,'/');
    temp(slashesIdx) = '\';
    outputFolder = [pc_prefix temp];
    
end


end