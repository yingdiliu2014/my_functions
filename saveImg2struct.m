% save images to structure (or matrix)
% yingdi LIU, Fribourg, 13/11/2014 

%% 
clear all; 

imageFolder = 'C:\Users\Liuy\Google\Google Drive\ssovp\faces'; 
tosaveFolder = 'C:\Users\Liuy\Google\Google Drive\ssovp';
allImages = dir('*.jpg'); 

cd(imageFolder)
imageStruct = struct;


for ii = 1: size(allImages)
    
    image2load = allImages(ii).name;
    imdata = imread(image2load);
    
    % manipulation if necessary
    imdata = imresize(imdata, 1.5);
    
    % save in structure and in matrix 
    eval(['imageStruct.f', num2str(ii),'=imdata;'])
    imageMat(ii,:,:) = imdata;
    
end

cd(tosaveFolder)
save('imageStruct','imageStruct')
save('imageMat','imageMat')
