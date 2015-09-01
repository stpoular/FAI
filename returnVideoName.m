function videoName = returnVideoName(datasetPath, className, subjectNames, subjectIndx)

postFix = '';

if(subjectIndx>=9)
	if(strcmp(className, 'walk') || strcmp(className, 'run') || strcmp(className, 'skip'))
		numOfSubjects = numel(subjectNames);
		postFix = num2str(subjectIndx - numOfSubjects + 2);
	else
		if(subjectIndx==10)
			videoName = '';
			return;
		end
	end
end

videoName = strcat(datasetPath, subjectNames{subjectIndx}, '_', className, postFix, '.avi');

return;
