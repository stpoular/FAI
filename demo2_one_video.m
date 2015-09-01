% Demo file for the FAI detection algorithm presented in [1]. 
% It shows an example of using the algorithm for one video file.
% You may freely use this code for academic/research purposes, provided you cite [1].
%
% [1] S. Poularakis, A. Briassouli, and I. Kompatsiaris, "Full action instances for motion analysis," 
% in 10th Workshop on Image Analysis for Multimedia Interactive Services (WIAMIS), pp. 37–40, 2009.
%
% This code was written by Stergios Poularakis.
% Information Technologies Institute, The Centre for Research & Technology, Hellas, Greece
% Thessaloniki, 2015

close all;
clear all;
clc;

maxErrorFrames = 3;
noiseDev = 0;
DEBUG_MODE = false;

subjectIndx = 1;
classIndx = 2;

videoName = 'WeizmannVideos/daria_jump.avi';
fprintf('Processing video: %s....\n', videoName);

% Read video file and produce energy signal (the energy signal may vary, depending on the data nature, application, etc)
energySignal = produceEnergySignal(videoName, noiseDev);

% Detect all FAIs - This is the main function to change if you want to test your own FAI detection algorithm
foundFAIs = detectFAIs(energySignal, DEBUG_MODE);

% Evaluate results (optional step, depending on the application of the algorithm)
correctFAIs = returnCorrectFAIs(classIndx, subjectIndx);
[numCorrectlyFoundFAIs numCorrectFAIs] = evaluateVideoDetectionResult(correctFAIs, foundFAIs, maxErrorFrames);
accuracyFAI = 100*numCorrectlyFoundFAIs/numCorrectFAIs;
fprintf('Accuracy: %d/%d (%.2f%%)\n', numCorrectFAIs, numCorrectlyFoundFAIs, accuracyFAI);
