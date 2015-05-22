function [frames] = serial_get_frames(port, samples)
%  Serial Get Frame
%   Uses the serial toolbox to grab data from the serial port
%   and collects the information into a proper frame

switch nargin
    case 0
        %   Select default number of Samples
        samples = 1;
        %   Select first available serial port
        disp('Selecting First Available Serial Port:');
        hardware = instrhwinfo('serial');
        port = char(hardware.AvailableSerialPorts(1));
    case 1
        if isnumeric(port)
            %   the only arguement is Number of Samples
            samples = port;
            %   Auto find the port
            disp('Selecting First Available Serial Port:');
            hardware = instrhwinfo('serial');
            port = char(hardware.AvailableSerialPorts(1));
        else
            %   the only argument is port
            samples = 1;
            disp('Selecting User Defined Serial Port:');
        end
    case 2
        disp('Selecting User Defined Serial Port:');
    otherwise
        disp('Error too many arguments');
end
%   Display Port
disp(port);
%   Number of frames to be sampled
disp('Number of frames to be sampled is:');
disp(samples);

s = serial(port);      %define serial port
s.BaudRate=9600;       %define baud rate

%open serial port
fopen(s);

done = false;

while(~done)
    data=fscanf(s);    %read from port
    [ch, val] = parseData(data);
    
    if ch == 0
        frames = [frames val];
        do(ch ~= 0)
           data=fscanf(s);    %read from port
           [ch, val] = parseData(data);
           frames = [frames val];
        while(ch ~= 0)
    end
end
% 
% close the serial port!
fclose(s);

frames = data;
end

function [chNum, ADCval] = parseData(data)
    temp = strsplit(data);
    chNum = str2num(temp{2});
    ADCval = str2num(temp{5});
end