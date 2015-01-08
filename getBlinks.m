function blinks = getBlinks( pupil, sr, ms2remove)

%%
% detect blinks and +- 200ms (parameter: ns2remove) samples around them. 
% apart from obvious blink data(pupil size=0) and neighboring samples, we
% also want to mark those samples where pupil size change very abruptly
% (20 unit/sample, see J.otero-millan 2014 JOV paper). 

%% blinks 
blinks = zeros(size(pupil,1),1);
blinks(pupil==0)=1;

% remove samples +-?ms around blinks (index them as blinks too)
cutBlink = round(sr/1000*ms2remove); % number of samples to remove 

% starting and ending sample of each blink
starting = find([blinks(1); diff(blinks)]==1);
ending = find([diff(blinks)==-1; blinks(end)]);
if length(starting) > length(ending)
    ending = [ending;size(blinks,1)];
end
blinkStartEnd = [starting ending];

for bb = 1: size(blinkStartEnd,1)
    
    % before blinks
    if blinkStartEnd(bb,1)<=cutBlink
        blinks(1:blinkStartEnd(bb,1))=1;
    else
        blinks(blinkStartEnd(bb,1)-cutBlink:blinkStartEnd(bb,1))=1;
    end
    
    % after blinks
    if blinkStartEnd(bb,2)+cutBlink > size(blinks,1)
        blinks(blinkStartEnd(bb,2):end)=1;
    else
        blinks(blinkStartEnd(bb,2):blinkStartEnd(bb,2)+cutBlink)=1;
    end
end

%% partial blinks (abrupt change in pupil size) 

% % individualized threshold for partial blinks 
% pupilchange = [0; diff(pupil)]; 
% pupilchangeRate = abs(pupilchange); 
% partialBlinkThres = determineUniversalThreshold(pupilchangeRate,0); 
% 
% partialBlink = find(diff(pupil)>partialBlinkThres)+1; 
% 
% for bb = 1: size(partialBlink,1)
%     
%     startIdx = partialBlink(bb) - cutBlink;
%     endIdx = partialBlink(bb) + cutBlink;
%     
%     if startIdx < 0
%         startIdx  = 1;
%     end
%     if endIdx > size(blinks)
%         endIdx = size(blinks);
%     end
%     
%     blinks(startIdx: endIdx) = 1;
% end

end

