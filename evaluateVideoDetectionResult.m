function [numCorrectlyFoundFAIs numCorrectFAIs] = evaluateVideoDetectionResult(correctFAIs, foundFAIs, maxErrorFrames)
% Returns the number of correct FAI intervals
% correctFAIs: ground truth FAI intervals
% foundFAIs: FAI intervals returned by the FAI detection algorithm
% maxErrorFrames: is the maximum allowed error for each FAI side

% M is the number of frames after of which we reach a conclusion (correct/wrong) for a specific FAI interval
M = 5 * maxErrorFrames;

m = numel(correctFAIs);
n = numel(foundFAIs);

w = zeros(1, m-1);
start_j = 1;

for i=1:m-1
    az = [correctFAIs(i) correctFAIs(i+1)];
    j = start_j;
    flag = false;
    winner = 0;
    while(flag==false && j<n)
        bz = [foundFAIs(j) foundFAIs(j+1)];
        p = az - bz;
        if( (abs(p(1))<(maxErrorFrames+1)) && (abs(p(2))<(maxErrorFrames+1)) )
            winner = j;
            j = j + 1;
        elseif (p(1)<0 && p(2)<0 && abs(p(1))+abs(p(2))>M)
            flag = true;
        else
            j = j + 1;
        end
    end
    w(i) = winner;
    if(winner>0)
        start_j = winner + 1;
    else
        start_j = start_j + 1;
    end
end

numCorrectlyFoundFAIs = sum(w>0);
numCorrectFAIs = m - 1;

