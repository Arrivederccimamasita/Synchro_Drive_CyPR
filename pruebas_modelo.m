%% SCRIPT EMPLEADO PARA REALIZAR PRUEBAS DE LA SIMULACIÓN DEL MODELO

% Posiciones iniciales del integrador
pos_init=[0;0;0];
% Tiempo de simulacion
t_sim=3;

% Añadir saturacion en velocidades angulares y lineales.
% No se gira un volante a mas de 10-15 deg/sec, por tanto, ahí estará la saturación del movimiento

% Valores de las entradas al robot para realizar experimentos
tetha_d=5;
omega=pi/4;

% Se lanza la simulacion
sim('modelo_cinematico_movil');

% Se grafica el resultadoo obtenido
figure();plot(posx,posy);grid; title(' Movimiento del robot en el plano XY');...
    xlabel('Coordenada X del movimiento'); ylabel('Coordenada Y del movimiento');...
    legend('Movimiento del robot','Location','BestOutside');
