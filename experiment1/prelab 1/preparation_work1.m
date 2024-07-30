G1=tf([15^2],[1 30 15^2]);
G2=tf([15 0],[1 30 15^2]);
figure(1);step(G1);grid on;
figure(2);step(G2);grid on;

%% 
syms La f J Ra Km Kb s
G_VI=1/(La*s+ Ra);
G_thetaI=Kb*s/(La*s+ Ra);
G_Ttheta=1/(J*s^2+ f*s);
P=collect(simplify(G_VI*G_Ttheta*Km/(1+G_Ttheta*G_thetaI*Km)),s);


P_num = (simplifyFraction(subs(G,{Km J Kb f Ra La},...
    {39.6e-3 0.06 6.46e-3*60/(2*pi)  0.01 6.8 620e-6;})));
[num_P,dom_P]=numden(P_num);
coe=coeffs(dom_P);
dom_P=simplify(dom_P/coe(3));
num_P=num_P/coe(3);
tf_dom_P = sym2poly(dom_P);
tf_num_P = sym2poly(num_P);
tf_P=tf([tf_num_P],[tf_dom_P]);
% % when La=0
P_num_new = (simplifyFraction(subs(G,{Km J Kb f Ra La},...
    {39.6e-3 0.06 6.46e-3*60/(2*pi)  0.01 6.8 0;})));
[num_P_new,dom_P_new]=numden(P_num_new);
coe_new=coeffs(dom_P_new);
dom_P_new=simplify(dom_P_new/coe_new(2));
num_P_new=num_P_new/coe_new(2);
tf_dom_P_new = sym2poly(dom_P_new);
tf_num_P_new = sym2poly(num_P_new);
tf_P_new=tf([tf_num_P_new],[tf_dom_P_new]);

%% q3
Km=39.6*0.001;
Kb=6.46e-3*60/(2*pi);
Ra=6.8;
La=620*10^-6
J=0.06;
f=0.01;
G_VI=1/(La*s+ Ra);
G_thetaI=Kb*s/(La*s+ Ra);
G_Ttheta=1/(J*s^2+ f*s);
P=collect(simplify(G_VI*G_Ttheta*Km/(1+G_Ttheta*G_thetaI*Km)),s);
simOut=sim("Q2_3_simulink.slx",'SimulationMode','normal');
figure(3);plot(simOut.simout1.time,simOut.simout1.Data);grid on;
figure(4);plot(simOut.simout2.time,simOut.simout2.Data);grid on;
%% %question 4
figure(5)
step(tf_P*G1,50);grid on
figure(6)
step(tf_P*G2,50);grid on
%% 

function [T_tf] = get_transferfunction(T)
    T=simplify(T);
    [num_T,dom_T]=numden(T);
    tf_num_T = sym2poly(num_T);
    tf_dom_T_ = sym2poly(dom_T);
    T_tf=tf(tf_num_T,tf_dom_T_);
end