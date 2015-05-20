function [frame] = serial_get_frame()
%  Serial Port Reader
%   Uses the serial toolbox to grab data from the serial port
%   and simply plots the values

s1 = serial('COM1');    %define serial port
s1.BaudRate=9600;       %define baud rate
     
%open serial port
fopen(s1);

line = [];
    
while(1)
    data=fscanf(s1);    %read from port
    
    disp(data);
end

% close the serial port!
fclose(s1);
end