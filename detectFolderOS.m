function os = detectFolderOS(folder)

% from the name of a directory, detect whether it's a directory on pc
% system or mac system. 
% os = 1 if it's a pc (ifpc == 1)
% os = 0 if it's mac (ifpc == 0)

% by Yingdi LIU, 2015/01/08, Fribourg

%%
if folder(1) == '/'
    os = 0;
elseif strcmp(folder(1:3),'C:\')
    os = 1;
end
    

end