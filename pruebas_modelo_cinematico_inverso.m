%% SCRIPT EMPLEADO PARA REALIZAR PRUEBAS DE LA SIMULACI�N DEL MODELO INVERSO

% %%%% DEFINICION DEL TIEMPO DE SIMUACION %%%%%
% Para la simulacion de la actuacion senoidal introducir un tiempo de simulacion grande 
% (aprox. 30 segundos, aunque depende de la frecuencia que se le meta)
t_sim=30;

% Valor de la trayectoria de prueba



% Se lanza la simulacion
sim('modelo_cinematico_movil');

% Se grafica el resultado obtenido
figure();
subplot(2,1,1);
plot(t,tetha_d);grid; title('Velocidad Radial del Desplazamiento a lo largo de la trayectoria');
xlabel('Tiempo [s]'); ylabel('Velocidad Radial (rad/s)');
subplot(2,1,2);
plot(t,omega);grid; title('Velocidad Radial de la Direccion a lo largo de la trayectoria');
xlabel('Tiempo [s]'); ylabel('Velocidad Radial (rad/s)');   
