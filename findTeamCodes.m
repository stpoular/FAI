function teamCodes = findTeamCodes(energySignal, Th, T)
% FINDTEAMCODES Finds team codes (1st part of FAI detection)
% teamCodes = findTeamCodes(energySignal)
%
% teamCodes = findTeamCodes(energySignal, Th, T)
%


th11 = 0.75;
logicalONE = logical(1);
logicalZERO = logical(0);

[xmax maxPositions] = findMaxima(energySignal);
[xmin minPositions] = findMinima(energySignal);

% If the first maximum appears before the first minimum
j = 1;
[m n] = size(xmax);
if maxPositions(1)<minPositions(1)
    teamNode.A = logicalONE;
    teamNode.B = logicalZERO;
    
    teamNode.min1 = 0.99*xmax(1);
    teamNode.max1 = xmax(1);
    teamNode.min2 = xmin(1);
    
    teamNode.tmin1 = 1;
    teamNode.tmax1 = maxPositions(1);
    teamNode.tmin2 = minPositions(1);
    
    teamNode.A = logicalONE;
    teamNode.B = logicalZERO;
    
    teamCodes(j) = teamNode;
    j = j + 1;
    xmax = xmax(2:n);
    maxPositions = maxPositions(2:n);
end


% If the last minimum appears before the last maximum
nmax = numel(maxPositions);
nmin = numel(minPositions);
if (maxPositions(nmax) > minPositions(nmin))
    maxPositions(nmax) = maxPositions(nmax) - 1;
    minPositions = [minPositions maxPositions(nmax) + 1];
    xmin = [xmin 0.99*xmax(nmax)];
end


n = numel(xmin);
for i = 1:n-1
    m1 = xmin(i);
    M = xmax(i);
    m2 = xmin(i+1);
    
    teamNode.min1 = m1;
    teamNode.max1 = M;
    teamNode.min2 = m2;
    
    teamNode.tmin1 = minPositions(i);
    teamNode.tmax1 = maxPositions(i);
    teamNode.tmin2 = minPositions(i+1);
	
	teamNode = findTeamCode(teamNode, Th, T);
	
    teamCodes(j) = teamNode;
    j = j + 1;
end


end