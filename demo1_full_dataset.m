% Demo file for the FAI detection algorithm presented in [1]. 
% It recreates the main detection experiment of [1].
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

datasetPath = 'WeizmannVideos/';
maxErrorFrames = 3;
noiseDev = 0;

DEBUG_MODE = false;

[class_names, subjectNames] = returnWeizmannDatasetInfo();

accuracyFAI = runExperimentNoiseDev(datasetPath, maxErrorFrames, noiseDev, class_names, subjectNames, DEBUG_MODE)
