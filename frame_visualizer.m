function frame_visualizer( frame, lut )
%FRAME_VISUALIZER Generates a image of the frame given.
%   Utilizies the location data of each electrode location from the lut to
%   generate a image of the electrode data given in the frame.
%   Frame should be a row vector with each column being a electrode val
%   lut should be a lut with row vectors. Each vector is a elect postition
%   This particular visualizer uses a mesh to generate a field

%   Constants
resolution = 100;

if ~(size(frame,2) == size(lut,1))
    disp('LUT size not equal to frame size!');
end

%   Useful Constants
xVals = lut(:,1);
yVals = lut(:,2);

%   Generate a Uniform Space to work with
xlin = linspace(min(xVals),max(xVals),resolution);
ylin = linspace(min(yVals),max(yVals),resolution);

%   Generate a uniform grid
[X, Y] = meshgrid(xlin, ylin);

%   Generate a linearly interpolated function
f = scatteredInterpolant(xVals,yVals,frame');
Z = f(X,Y); % Grab some Z vals

%   Make a Figure
figure
mesh(X,Y,Z);
axis tight;
hold on;

end

