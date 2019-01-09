
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
A=0.05;        % x=A*t
B=0.1;        % y=B*sin(wt)
w=0.2;

% Se lanza la simulacion
sim('sl_robot_sincrono_persecucion_pura');

figure(1); 
subplot(211);
% plot(x_tray,y_tray,'b','LineWidth',3);
% plot(posx,posy,'r','LineWidth',0.5);grid;
plot(x_tray,y_tray,'k',posx,posy,'r');grid;
 legend('Referencia Trayectoria','Trayectoria real','Location','BestOutside');grid;
subplot(212);
plot(x_tray-posx,y_tray-posy,'b','LineWidth',1);title('ERROR');grid;
% plot(t, x_tray-posx,t,y_tray-posy,'b');title('ERROR');grid;

%Graficas vbles de entrada al robot
figure(2);
subplot(211);
plot(t,v_ref,'r'); grid; title('Velocidad Lineal de Referencia')
subplot(212);
plot(t,omega,'b');grid; title('Velodidad Direccion de Referencia')
