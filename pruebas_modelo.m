%% SCRIPT EMPLEADO PARA REALIZAR PRUEBAS DE LA SIMULACIÓN DEL MODELO

%% Pruebas Modelo Cin Directo

% Posiciones iniciales del integrador
pos_init=[0;0;0];
% Tiempo de simulacion
%Para la simulaci�n de la actuaci�n senoidal introducir un tiempo de
%simulaci�n grande (aprox. 30 segundos, aunque depende de la frecuencia que se le meta)
t_sim=30;

% Añadir saturacion en velocidades angulares y lineales.
% No se gira un volante a mas de 10-15 deg/sec, por tanto, ahí estará la saturación del movimiento
omega_sat=[-0.2618 0.2618];%15 grados/segundo
tetha_d_sat=[-0.75 0.75];%Velocidad lineal de 30 cm/seg

% % Valores de las entradas al robot para realizar experimentos
% tetha_d=0.5;
% omega=0.1;

%Valores de prueba para el apartado 2 (introducir senoide en la variable de direcci�n)
tetha_d=5; %Velocidad lineal del robot constante
freq=0.25; %Frecuencia de cambio de la senoide en la direccion
ampl_sin=2; %Amplitud de la senoide en la direccion
% Se lanza la simulacion
sim('modelo_cinematico_movil');

% Se grafica el resultado obtenido
figure(1);
 hold on;
comet(posx,posy);grid; title(' Movimiento del robot en el plano XY');...
    xlabel('Coordenada X del movimiento'); ylabel('Coordenada Y del movimiento');...
    legend('Movimiento del robot','Location','BestOutside');
plot(posx,posy,'LineWidth',2);
u=cos(ang_phi);
v=sin(ang_phi);
quiver(posx,posy,u,v,'c'); %Ploteo del vector de la velocidad Lineal.


%% Pruebas Modelo Cin Inverso

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Descripcion:
% Se tiene que conseguir las consignas de direccion tal que el robot siga
% una trayectoria parabolica del tipo y=-x*(x-A))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Posiciones iniciales del integrador.
pos_init=[0;0;0];

% Tiempo de simulacion.
t_sim=60;

%Saturaciones
omega_sat=[-0.2618 0.2618];%15 grados/segundo
tetha_d_sat=[-0.75 0.75];%Velocidad lineal de 30 cm/seg

%Descripcion de la entrada parabolica.
x_inc=1;
A=30;

%Simulacion Modelo Inverso
sim('modelo_cinematico_movil');

%Ploteamos Resultado
figure(1);
subplot(2,1,1)
plot(t,tetha_d);grid; title('Velocidad Radial del Desplazamiento a lo largo de la trayectoria');
xlabel('Tiempo'); ylabel('Velocidad Radial (rad/s)');
subplot(2,1,2);
plot(t,omega);grid; title('Velocidad Radial de la Direcci�n a lo largo de la trayectoria');
xlabel('Tiempo'); ylabel('Velocidad Radial (rad/s)');   

%Comprobamos Resultado
figure(2)
comet(posx_check,posy_check);grid; title(' Movimiento del robot en el plano XY');...
    xlabel('Coordenada X del movimiento'); ylabel('Coordenada Y del movimiento');...
    legend('Movimiento del robot','Location','BestOutside');

