clear;clc;close all
dataFname = 'Altimeter 1 Data - Subscale - Dec 13';
datalist = xlsread(dataFname); % gets data from the excel file of the alt data  

time = datalist(5:end,1);
altitude = datalist(5:end,2);
altitude = altitude * 0.3048; % m
altitude_filtered = zeros(length(altitude),1);
%% Filter altitude data
for i=1:length(altitude)
     % Average buffer
     altitude_filtered(i) = 
     if altitude(i) < 0
         altitude_filtered(i) = 
end
%plot(time,altitude,'k')
%hold on
mask=altitude<0;
mask2 = [mask(2:end);mask(1)];
altitude(mask)=altitude(mask2);
%altitudeFit = fit(time, altitude,'poly3' );
plot(time,altitude,'b')
%hold on
%plot(altitudeFit

v = diff(altitude)./diff(time);
v = [0;v];

    mask3=(abs(v)>500);
    %mask4 = [mask3(2:end);mask3(1)];
    v(mask3)=0;
    %altitudeFit = fit(time, v,'exp2' );
    %plot(altitudeFit);


data = [time v];

plot(data(:,1),data(:,2));
