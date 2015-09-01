function e = myAVIread(videoName, noiseDev)
% MYAVIREAD Reads a video file
% Returns a 3D matrix containing the Y component of video
% noiseDev: standard deviation of zero mean additive Gaussian noise
%
% This function may cause memory problems for very large videos (>1000 frames).
%

mov = aviread(videoName);
[t n] = size(mov);
for i = 1:n
    z = double(rgb2gray(mov(i).cdata));
    e(:,:,i) = z + normrnd(0, noiseDev, size(z));
end

