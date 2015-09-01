function accuracyFAI = runExperimentNoiseDev(datasetPath, maxErrorFrames, noiseDev, classNames, subjectNames, DEBUG_MODE)
% RUNEXPERIMENTNOISEDEV Runs a complete experiment on all the Weizmann dataset videos for a given noise standard deviation
%
% accuracyFAI = runExperimentNoiseDev(datasetPath, maxErrorFrames, noiseDev, classNames, subjectNames, DEBUG_MODE)
%

numOfClasses = numel(classNames);
numOfSubjects = numel(subjectNames);

ps = [];

for classIndx = 1:numOfClasses
    className = classNames{classIndx};
	
    sosta_cat = zeros(1, numOfSubjects);
    diastimata_cat = zeros(1, numOfSubjects);
    
    for subjectIndx = 1:numOfSubjects
		subjectName = subjectNames{subjectIndx};
	
		videoName = returnVideoName(datasetPath, className, subjectNames, subjectIndx);
		if(numel(videoName) == 0)
			continue;
		end
		
		fprintf('Processing video: %s....\n', videoName);
		
		% Read video file and produce energy signal (the energy signal may vary, depending on the data nature, application, etc)
		energySignal = produceEnergySignal(videoName, noiseDev);
		
		% Detect all FAIs - This is the main function to change if you want to test your own FAI detection algorithm
		foundFAIs = detectFAIs(energySignal, DEBUG_MODE);
        
		% Evaluate results
		correctFAIs = returnCorrectFAIs(classIndx, subjectIndx);
		[numCorrectlyFoundFAIs numCorrectFAIs] = evaluateVideoDetectionResult(correctFAIs, foundFAIs, maxErrorFrames);
		
		ps = [ps; numCorrectlyFoundFAIs numCorrectFAIs];
    end
end

ps = sum(ps,1);
accuracyFAI = 100*ps(1)/ps(2);

