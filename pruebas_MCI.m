%% PRUEBAS DE SIMULACIÓN DE LA TRAYECTORIA PARABOLICA A PARTIR DEL MCI
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% En el script que sigue se implementará una trayectoria a partir del
% jabociano del robot, es decir, del modelo de velocidades del mismo.
% Se buscará implementar una trayectoria parabolica
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;%clear all;
% %%%% DEFINICION DEL TIEMPO DE SIMUACION %%%%%
% Para la simulacion de la actuacion senoidal introducir un tiempo de simulacion grande 
% (aprox. 30 segundos, aunque depende de la frecuencia que se le meta)
t_sim=15;
% %%%%%%% Posicion inicial del robot %%%%%%%
pos_init=[0;0;0.2915];%El valor de phi ser� el valor del �ngulo sacado por la arcotangente de la 
                      %derivada de la par�bola en t=0
% %%%%%% Saturacion en velocidades angulares y lineales %%%%%%
% No se gira un volante a mas de 10-15 deg/sec, por tanto, ahí estará la saturación del movimiento
omega_sat=[-0.2618/10 0.2618/10];     % 15 grados/segundo
tetha_d_sat=[-0.75/2 0.75/2];       % Velocidad lineal de 30 cm/seg


% Descripcion de la entrada parabolica.
A=3;
D=10;

% Se lanza la simulacion
sim('sl_MCI_sincrono');

% Se grafica el resultado obtenido
figure();
subplot(2,1,1);
plot(t,tetha_d);grid; title('Velocidad Radial del Desplazamiento a lo largo de la trayectoria');
xlabel('Tiempo [s]'); ylabel('Velocidad Radial (rad/s)');
subplot(2,1,2);
plot(t,omega);grid; title('Velocidad Radial de la Direccion a lo largo de la trayectoria');
xlabel('Tiempo [s]'); ylabel('Velocidad Radial (rad/s)');

%Comprobamos Resultado
figure();
plot(posx_check,posy_check,'b',trayec_x,trayec_y,'r');grid; title(' Movimiento del robot en el plano XY');...
    xlabel('Coordenada X del movimiento (metros)'); ylabel('Coordenada Y del movimiento (metros)');...
    legend('Movimiento del robot','Location','BestOutside');
