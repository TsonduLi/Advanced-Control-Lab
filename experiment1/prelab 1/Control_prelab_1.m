G1=tf([15^2],[1 30 15^2]);
G2=tf([15 0],[1 30 15^2]);
figure(1);step(G1);grid on;
figure(2);step(G2);grid on;

Km=39.6*0.001
Kb=6.46e-3*60/(2*pi)
Ra=6.8
La=620*10^-6
J=0.06
f=0.01
init_cond=1
%defining transfer functions
tf_P1=tf([1],[La Ra])
tf_P2=tf([Km],[1])
tf_P3=tf([1],[J f])
tf_P4=tf([Kb])
tf_P5=tf(1,[1 0])
tf_P_fb=feedback(tf_P1*tf_P2*tf_P3,tf_P4) 
tf_P=tf_P_fb*tf_P5
%now La=0 because we neglect it
La_new=0
tf_P1_new=tf([1],[La_new Ra])
tf_P_fb2=feedback(tf_P1_new*tf_P2*tf_P3,tf_P4)
tf_P_new=tf_P_fb2*tf_P5
%question 4
figure(3)
step(tf_P*G1,100)
grid on
figure(4)
step(tf_P*G2,100)
grid on
%question 5
Nr=1
tf_P_fb3=feedback(tf_P1_new*tf_P2*tf_P3,tf_P4*Nr)
tf_P_new2=tf_P_fb3*tf_P5
La_new=0
tf_P1_new=tf([1],[La_new Ra])
tf_P_fb4=feedback(tf_P1_new*tf_P2*tf_P3,tf_P4*Nr)
tf_P_new=tf_P_fb4*tf_P5