%% PRUEBAS DE SIMULACIÓN DE LA TRAYECTORIA PARABOLICA A PARTIR DEL MCI
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% En el script que sigue se implementará una trayectoria a partir del
% jabociano del robot, es decir, del modelo de velocidades del mismo.
% Se buscará implementar una trayectoria parabolica
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %%%% DEFINICION DEL TIEMPO DE SIMUACION %%%%%
% Para la simulacion de la actuacion senoidal introducir un tiempo de simulacion grande 
% (aprox. 30 segundos, aunque depende de la frecuencia que se le meta)
t_sim=30;

% Descripcion de la entrada parabolica.
x_inc=1;
A=30;

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
comet(posx_check,posy_check);grid; title(' Movimiento del robot en el plano XY');...
    xlabel('Coordenada X del movimiento'); ylabel('Coordenada Y del movimiento');...
    legend('Movimiento del robot','Location','BestOutside');
