%% SCRIPT EMPLEADO PARA REALIZAR PRUEBAS DE LA SIMULACIÓN DEL MODELO INVERSO

% Tiempo de simulación
%Para la simulación de la actuación senoidal introducir un tiempo de
%simulación más grande (aprox. 30 segundos, aunque depende de la frecuencia que se le meta)
t_sim=30;

% Valor de la trayectoria de prueba



% Se lanza la simulacion
sim('modelo_cinematico_movil');

% Se grafica el resultadoo obtenido
figure();
subplot(2,1,1);
plot(t,tetha_d);grid; title('Velocidad Radial del Desplazamiento a lo largo de la trayectoria');
xlabel('Tiempo'); ylabel('Velocidad Radial (rad/s)');
subplot(2,1,2);
plot(t,omega);grid; title('Velocidad Radial de la Dirección a lo largo de la trayectoria');
xlabel('Tiempo'); ylabel('Velocidad Radial (rad/s)');   


