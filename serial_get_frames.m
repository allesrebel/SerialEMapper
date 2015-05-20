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

end
% %open serial port
% fopen(s);
% 
% while(1)
%     data=fscanf(s);    %read from port
%     
%     disp(data);
% end
% 
% % close the serial port!
% fclose(s);