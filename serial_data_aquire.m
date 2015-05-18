%%  Serial Port Reader
%   Uses the serial toolbox to grab data from the serial port
%   and simply plots the values

s1 = serial('COM4');    %define serial port
s1.BaudRate=9600;       %define baud rate
     
%open serial port
fopen(s1);

line = [];
    
while(1)
    data=fscanf(s1);    %read from port
    
    if(data == ';')
        disp(line);
        line = [];
    else
        line = [line data]; 
    end

end

% close the serial port!
fclose(s1);