%%  Useage Example of the System
%   An example of utilizing the serial_frame function by generating a
%   lookup table with real data (data will be limited to 7 points)

%  Port Serial Data from First Available Port
%   Depends on Serial Get Frames to grab serial data
%   Generates a visualization of the frame through
%   Assumes the Following Electrode Configuration:
%
%   Each number is an electode channel
%
%               1     2
%                3   4
%                  5
%              6        7

%   Generate Look Up Table
lut = [ -2 3;   %first electrode
        2 3;
        -1 1;
        1 1;
        0 0;
        -4 -1;
        4 -1;   %last electrode
        ];
    
% get frame from first available port
frame = serial_get_frames();

% send to the frame visualizer
frame_visualizer(frame(1:7), lut);