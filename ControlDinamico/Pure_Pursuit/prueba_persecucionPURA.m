
% Posiciones iniciales del integrador
pos_init=[0;0;0.2995];
%Tiempo de simulacion
tsim=100;
% Definicion del tiempo de muestreo
Tm=0.01;

% Añadir saturacion en velocidades angulares y lineales.
% No se gira un volante a mas de 10-15 deg/sec, por tanto, ahí estará la saturación del movimiento
omega_sat=[-0.2618 0.2618];%15 grados/segundo
tetha_d_sat=[-0.75 0.75];%Velocidad lineal de 30 cm/seg

% Parametros del seno a seguir
% A=0.2;        % x=A*t
% B=1.2;        % y=B*sin(wt)
% w=0.2;

A=0.2;        % x=A*t
B=1.2;        % y=B*sin(wt)
w=0.13;

% Se lanza la simulacion
sim('sl_robot_sincrono_persecucion_pura');

figure(1); 
subplot(211);
% plot(x_tray,y_tray,'b','LineWidth',3);
% plot(posx,posy,'r','LineWidth',0.5);grid;
plot(x_tray,y_tray,'k',posx,posy,'r'); xlabel('Pos X (m)');ylabel('Pos Y (m)');grid;

% plot3
legend('Referencia Trayectoria','Trayectoria real','Location','BestOutside');
subplot(212);
plot(t,x_tray-posx,t,y_tray-posy,'b','LineWidth',1);xlabel('Tiempo [s]');legend('Error Pos X','Error Pos Y','Location','BestOutside');grid;
% plot(t, x_tray-posx,t,y_tray-posy,'b');title('ERROR');grid;

%Graficas vbles de entrada al robot
figure(2);
subplot(211);
plot(t,theta_d,'r'); grid; title('Velocidad Desplazamiento de Referencia')
subplot(212);
plot(t,omega,'b');grid; title('Velodidad Direcci�n de Referencia')
