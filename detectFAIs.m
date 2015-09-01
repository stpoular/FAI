function foundFAIs = detectFAIs(energySignal, DEBUG_MODE)
% DETECTFAIS Detects all FAI intervals in an energy signal
% Returns a 1xN vector, showing the starting/ending points of consecutive FAI intervals

Th = 0.6;
T = 6;

% find team Codes
teamCodes = findTeamCodes(energySignal, Th, T);

% combine neighboring teams
foundBells = combineTeamsToBells(teamCodes, Th, T);


foundFAIs = foundBells(1:2:end);

foundFAIs = [foundFAIs foundBells(end)];
foundFAIs = foundFAIs - 1;



if(DEBUG_MODE)
	[x minimaPositions] = findMinima(energySignal);
	minimaPositions = minimaPositions - 1;
	
	h = figure;
	hold on; plot([0:numel(energySignal)-1], energySignal);
	hold on;plot(minimaPositions, x, 'r*')
	hold on;plot(foundFAIs, energySignal(foundFAIs+1), 'ko');
	set(gcf,'color','w');
	legend('energySignal', 'local minima', 'FAIs')
	input('pause');
	close all;
end

end
