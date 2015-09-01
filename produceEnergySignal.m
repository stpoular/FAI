function energySignal = produceEnergySignal(videoName, noiseDev)
% PRODUCEENERGYSIGNAL Reads a video and produces a signal characterizing the activity motion

mov = myAVIread(videoName, noiseDev);
[dx, dy, dt] = videoGradient(mov);
energySignal = computeEnergySignal(dt);

end