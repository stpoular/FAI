function [dx, dy, dt] = videoGradient(mov)
% VIDEOGRADIENT Returns the gradients of 3D matrix mov

mov = double(mov);

dx = diff(mov,1,1);
dy = diff(mov,1,2);
dt = diff(mov,1,3);

