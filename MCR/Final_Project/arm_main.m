% clc;clear all;close all;
load('inputs.mat');
L1=L1;
L2=L2;
L3=L3;
th_1=deg2rad(TH1);
th_2=deg2rad(TH2);
th_3=deg2rad(TH3);
save('inputs.mat', 'th_1','-append');
save('inputs.mat', 'th_2','-append');
save('inputs.mat', 'th_3','-append');
L(1)=Link([0 L1 0 pi/2]);
L(2)=Link([0 0 L2 0]);
L(3)=Link([0 0 L3 0]);
Rob=SerialLink(L);
Rob.name='MAE 547 PJ2';

clear f_kinematics
f_kinematics=Rob.fkine([th_1 th_2 th_3]);
save('inputs.mat', 'f_kinematics','-append');
save('inputs.mat', 'Rob','-append');
hold on
Rob.plot([th_1 th_2 th_3])
view(-145,20)
hold on
pause(1)
for th3=0:0.1:th_3
    Rob.plot([th_1 th_2 th3]);
    pause(0.25);
end

% VELOCITIES 
theta1_dot = 1; %rad/s
theta2_dot = 1; %rad/s
theta3_dot = 1; %rad/s
q_dot = [theta1_dot theta2_dot theta3_dot]';
J = Rob.jacob0([th_1 th_2 th_3]);
velocity = J*q_dot;
save('inputs.mat', 'velocity','-append');
run("golf.m")
n=length(Y);
range1= sqrt((Y(n,1)-f_kinematics.t(1))^2+(Y(n,2)-f_kinematics.t(2))^2);
assignin('base','range1',range1)