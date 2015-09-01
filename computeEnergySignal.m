function energySignal = computeEnergySignal(p)
% COMPUTENERGYSIGNAL Returns the energy signal of 3D matrix p

s = sum(sum(p.^2));

energySignal = s(:)';

    