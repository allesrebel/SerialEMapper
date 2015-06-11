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
%               1      19
%               2      20
%               3      21
%               4      22
%               5      23
%               6      24
%               7  10  25
%               8  11  26
%               9  12  27
%                  13
%                  14
%                  15
%                  16
%                  17
%                  18



%   Generate Look Up Table
lut = [ -0.8 1.75;   %first strip
        -0.8 1.5;
        -0.8 1.25;
        -0.8 1;
        -0.8 .75;
        -0.8 .50;
        -0.8 .25;
        -0.8 0;
        
        0 0.5;      %second strip
        0 0.25;
        0 0;
        0 -0.25;
        0 -0.50;
        0 -0.75;
        0 -1;
        0 -1.25;
        0 -1.50;
        
        0.8 1.75;   %last strip
        0.8 1.5;
        0.8 1.25;
        0.8 1;
        0.8 .75;
        0.8 .50;
        0.8 .25;
        0.8 0; 
        ];
    
% get frame from first available port
frame = serial_get_frames();

% send to the frame visualizer
frame_visualizer(frame(1:7), lut);