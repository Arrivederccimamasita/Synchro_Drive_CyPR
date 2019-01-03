
% Posiciones iniciales del integrador
pos_init=[0;0;0.2995];
%Tiempo de simulacion
tsim=40;
% Definicion del tiempo de muestreo
Tm=0.01;

% Añadir saturacion en velocidades angulares y lineales.
% No se gira un volante a mas de 10-15 deg/sec, por tanto, ahí estará la saturación del movimiento
omega_sat=[-0.2618 0.2618];%15 grados/segundo
tetha_d_sat=[-0.75 0.75];%Velocidad lineal de 30 cm/seg

% Parametros del seno a seguir
A=0.05;        % x=A*t
B=0.03;        % y=B*sin(wt)
w=0.5;

% Se lanza la simulacion
sim('sl_robot_sincrono_persecucion_pura');

plot(x_tray,y_tray,'r','LineWidth',2);hold on;plot(posx,posy,'b','LineWidth',1);grid;