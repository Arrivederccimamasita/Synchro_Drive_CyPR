%% SCRIPT EMPLEADO PARA REALIZAR PRUEBAS DE LA SIMULACIÓN DEL MCD
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% En el script que sigue se implementará una trayectoria que siga las
% siguientes premisas:
% velocidad lineal -> tetha_d (será contante)
% velocidad angular -> omega (constante o A*sin(w*t))
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

selection='Seleccione el tipo de trayectoria a implementar:\n 0.Lineal/Curva. \n 1.Senoidal.\n';
sel=input(selection);
if (sel >1) 
    input('Error. Parametro no válido') 
end

% %%%%%%% Posicion inicial del robot %%%%%%%
pos_init=[0;0;0];

% %%%%%%% Tiempo de simulacion %%%%%%%
% Para simular el seno empelar un tiempo grande
% (aprox. 30 segundos, aunque depende de la frecuencia que se le meta)
t_sim=30;

% %%%%%% Saturacion en velocidades angulares y lineales %%%%%%
% No se gira un volante a mas de 10-15 deg/sec, por tanto, ahí estará la saturación del movimiento
omega_sat=[-0.2618 0.2618];     % 15 grados/segundo
tetha_d_sat=[-0.75 0.75];       % Velocidad lineal de 30 cm/seg

% %%%%%%% SELECTION DEL TIPO DE TRAYECTORIA DESEADA %%%%%%%%%%
switch(sel)
    % SI SE DESEA QUE EL ROBOT SIGA UNA TRAYECTORIA LINEAL
    case 0
        tetha_d=0.5;
        omega=0.01;
        % Para evitar errores, se inicializan a cero el resto de variables
        freq=0; ampl_sin=0;
      
    % SI SE DESEA QUE EL ROBOT SIGA UNA TRAYECTORIA SENOIDAL
    case 1
        % Parámetros senoide
        tetha_d=5;
        freq=0.25;
        ampl_sin=2; %Amplitud de la senoide en la direccion
        % Para evitar errores, se inicializan a cero el resto de variables
        omega=0;
end

% Se lanza la simulacion
sim('sl_MCD_sincrono');

% Se grafica el resultado obtenido
figure();hold on;...
    comet(posx,posy);grid; title(' Movimiento del robot en el plano XY');...
    xlabel('Coordenada X del movimiento'); ylabel('Coordenada Y del movimiento');...
    legend('Movimiento del robot','Location','BestOutside');
% Graficamos el vector velocidad en cada pto de la trayectoria
plot(posx,posy,'LineWidth',2);
u=cos(ang_phi);
v=sin(ang_phi);
quiver(posx,posy,u,v,'c'); %Ploteo del vector de la velocidad Lineal.
hold off;
        