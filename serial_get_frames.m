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

s_port = serial(port);      %define serial port
s_port.BaudRate=9600;       %define baud rate

%open serial port
fopen(s_port);

%   Grab a the frames required
frames = [];
for i = 1:samples
   frames = [ frames; captureFrame(s_port) ];
end

% close the serial port!
fclose(s_port);
end

function frame = captureFrame(s_port)
frame = [];
done = false;

while(~done)
    data=fscanf(s_port);    %read from port
    [ch, val] = parseData(data);
    do_flag = true;
    if ch == 0
        frame = [frame val];
        while(ch ~= 0 || do_flag)
           data=fscanf(s_port);    %read from port
           [ch, val] = parseData(data);
           frame = [frame val];
           do_flag = false;
        end
        done = true;
    end
end

end

function [chNum, ADCval] = parseData(data)
    temp = strsplit(data);
    chNum = str2num(temp{2});
    ADCval = str2num(temp{5});
end