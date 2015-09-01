function foundBells = combineTeamsToBells(teamCodes, Th, T)
% COMBINETEAMSTOBELLS Combines teams and forms bell-shaped objects (2nd part of FAI detection)
%
%foundBells = combineTeamsToBells(teamCodes)
%

n = numel(teamCodes);

codes = [];
for i=1:n
    codes = [codes; teamCodes(i).A teamCodes(i).B];
end

foundBells = [];

tmpCode = [teamCodes(1).A teamCodes(1).B];
teamNode = teamCodes(1);

for i=2:n
    nxtCode = [teamCodes(i).A teamCodes(i).B];
    next = teamCodes(i);
    p = [tmpCode nxtCode];
    
    [a b c d] = logicalFunctionTeams(p);
    
    if(c==1)
        foundBells = [foundBells teamNode.tmin1 teamNode.tmin2];
        teamNode = next;
    else
        teamNode.A = a;
        teamNode.B = b;
        
        teamNode.min2 = next.min2;
        teamNode.max1 = max(teamNode.max1,next.max1);
        
        teamNode.tmin2 = next.tmin2;
        teamNode.tmax1 = (teamNode.tmin1+teamNode.tmin2)/2;
        if(d==1)
            oldteamNode = teamNode;
            teamNode = findTeamCode(teamNode, Th, T);
        end
    end
    tmpCode = [teamNode.A teamNode.B];
end

foundBells = [foundBells teamNode.tmin1 teamNode.tmin2];

end
