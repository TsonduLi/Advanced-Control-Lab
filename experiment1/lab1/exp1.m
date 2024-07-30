load data_0.mat

t=d1_0.time
y=d1_0.signals.values
figure(1);plot(t,y);grid on;
xlabel('Time [sec]');ylabel('Rotation angle of the arm [degree]');
title('Changes of arm [degree] in response to the input signal');


t2=d2_0.time
y2=d2_0.signals.values
figure(2);plot(t2,y2);grid on;
xlabel('Time [sec]');ylabel('Input Signal [Voltage]');
title('Input siganl as function of time');
ylim([-1.2,1.2]);

t3=d3_0.time
y3=d3_0.signals.values
figure(3);plot(t3,y3);grid on;
xlabel('Time [sec]');ylabel('Signal after passing transfer function [Voltage]');
title('Input signal after passing the transfer function');


% y1 = d1_0.signals(1).values; % the first vector
% y2 = d1_0.signals(2).values; % the second vector
% figure(2);plot(t,y1,t,y2);grid on;
% 
% y1 = d1_0.signals.values(:,1); % the first vector
% y2 = d1_0.signals.values(:,2); % the second vector
% figure(3);plot(t,y1,t,y2);grid on;


