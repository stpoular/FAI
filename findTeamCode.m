function teamNode = findTeamCode(teamNode, Th, T)

th11 = 0.75;

logicalONE = logical(1);
logicalZERO = logical(0);


y1 = 1 - teamNode.min1/teamNode.max1;
y2 = 1 - teamNode.min2/teamNode.max1;

dx = teamNode.tmin2 - teamNode.tmin1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = min([y1,y2])/max([y1,y2]);
x = ceil(x*10)/10;
rel = y1<y2;

if (x<Th)
	teamNode.A = logical(rel);
	teamNode.B = logical(1-rel);
else
	teamNode.A = logicalZERO;
	teamNode.B = logicalZERO;
	if(dx<T)
		teamNode.A = logicalONE;
		teamNode.B = logicalONE;
		
		if (x<th11)
			teamNode.A = logical(rel);
			teamNode.B = logical(1-rel);
		end
	end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

