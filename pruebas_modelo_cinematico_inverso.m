%% SCRIPT EMPLEADO PARA REALIZAR PRUEBAS DE LA SIMULACI�N DEL MODELO INVERSO

% Tiempo de simulaci�n
%Para la simulaci�n de la actuaci�n senoidal introducir un tiempo de
%simulaci�n m�s grande (aprox. 30 segundos, aunque depende de la frecuencia que se le meta)
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
plot(t,omega);grid; title('Velocidad Radial de la Direcci�n a lo largo de la trayectoria');
xlabel('Tiempo'); ylabel('Velocidad Radial (rad/s)');   


