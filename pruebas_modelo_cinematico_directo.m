%% SCRIPT EMPLEADO PARA REALIZAR PRUEBAS DE LA SIMULACIÓN DEL MODELO

% Posiciones iniciales del integrador
pos_init=[0;0;0];
% Tiempo de simulacion
%Para la simulaci�n de la actuaci�n senoidal introducir un tiempo de
%simulaci�n m�s grande (aprox. 30 segundos, aunque depende de la frecuencia que se le meta)
t_sim=30;

% Añadir saturacion en velocidades angulares y lineales.
% No se gira un volante a mas de 10-15 deg/sec, por tanto, ahí estará la saturación del movimiento
omega_sat=[-0.2618 0.2618];%15 grados/segundo
tetha_d_sat=[-0.75 0.75];%Velocidad lineal de 30 cm/seg

% % Valores de las entradas al robot para realizar experimentos
% tetha_d=0.5;
% omega=0.1;

%Valores de prueba para el apartado 2 (introducir senoide en la velocidad de direcci�n)
tetha_d=5;
freq=0.25;

% Se lanza la simulacion
sim('modelo_cinematico_movil');

% Se grafica el resultadoo obtenido
figure();comet(posx,posy);grid; title(' Movimiento del robot en el plano XY');...
    xlabel('Coordenada X del movimiento'); ylabel('Coordenada Y del movimiento');...
    legend('Movimiento del robot','Location','BestOutside');



