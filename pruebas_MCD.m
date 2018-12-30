%% SCRIPT EMPLEADO PARA REALIZAR PRUEBAS DE LA SIMULACIÓN DEL MCD
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% En el script que sigue se implementará una trayectoria que siga las
% siguientes premisas:
% velocidad lineal -> tetha_d (será contante)
% velocidad angular -> omega (constante o A*sin(w*t))
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

selection='Seleccione el tipo de trayectoria a implementar:\n 0.Lineal/Curva. \n 1.Senoidal.\n';
sel=input(selection);
while (sel >1) 
    disp('Error. Parametro no válido\n') 
    selection='Seleccione el tipo de trayectoria a implementar:\n 0.Lineal/Curva. \n 1.Senoidal.\n';
    sel=input(selection);
end

% %%%%%%% Posicion inicial del robot %%%%%%%
pos_init=[0;0;0];

% %%%%%%% Tiempo de simulacion %%%%%%%
% Para simular el seno empelar un tiempo grande
% (aprox. 30 segundos, aunque depende de la frecuencia que se le meta)
t_sim=30;

% %%%%%% Saturacion en velocidades angulares y lineales %%%%%%
% No se gira un volante a mas de 10-15 deg/sec, por tanto, ahÃ­ estarÃ¡ la saturaciÃ³n del movimiento
omega_sat=[-0.2618 0.2618];     % 15 grados/segundo
tetha_d_sat=[-0.75 0.75];       % Velocidad lineal de 30 cm/seg

% %%%%%%% SELECCION DEL TIPO DE TRAYECTORIA DESEADA %%%%%%%%%%
switch(sel)
    % SI SE DESEA QUE EL ROBOT SIGA UNA TRAYECTORIA LINEAL
    case 0
        selection='Asigne velocidad de giro del robot\n';
        omega=input(selection);
        if omega>omega_sat(2)
            omega=omega_sat(2);
            disp('Valor por encima de la saturación superior. Se asignará el valor máximo posible')
        elseif omega<omega_sat(1)
            omega=omega_sat(1);
            disp('Valor por debajo de la saturación inferior. Se asignará el valor mínimo posible')
        end
        
        selection='Asigne velocidad de rotación de las ruedas\n';
        tetha_d=input(selection);
        if tetha_d>tetha_d_sat(2)
            tetha_d=tetha_d_sat(2);
            disp('Valor por encima de la saturación superior. Se asignará el valor máximo posible')
        elseif tetha_d<tetha_d_sat(1)
            tetha_d=tetha_d_sat(1);
            disp('Valor por debajo de la saturación inferior. Se asignará el valor mínimo posible')
        end
        % Para evitar errores, se inicializan a cero el resto de variables
        freq=0; ampl_sin=0;
      
    % SI SE DESEA QUE EL ROBOT SIGA UNA TRAYECTORIA SENOIDAL
    case 1
        % ParÃ¡metros senoides
        selection='Asigne frecuencia de la senoide\n';
        freq=input(selection); %Frecuencia de la senoide en la direccion
        selection='Asigne amplitud de la senoide\n';
        ampl_sin=input(selection); %Amplitud de la senoide en la direccion
        
        selection='Asigne velocidad de rotación de las ruedas\n';
        tetha_d=input(selection);
        if tetha_d>tetha_d_sat(2)
            tetha_d=tetha_d_sat(2);
            disp('Valor por encima de la saturación superior. Se asignará el valor máximo posible')
        elseif tetha_d<tetha_d_sat(1)
            tetha_d=tetha_d_sat(1);
            disp('Valor por debajo de la saturación inferior. Se asignará el valor mínimo posible')
        end
        % Para evitar errores, se inicializan a cero el resto de variables
        omega=0;
end


% Se lanza la simulacion
sim('sl_MCD_sincrono');

% Se grafica el resultado obtenido
figure();hold on;...
    comet(posx,posy);grid; title(' Movimiento del robot en el plano XY');...
    xlabel('Coordenada X del movimiento (metros)'); ylabel('Coordenada Y del movimiento (metros)');...
    legend('Movimiento del robot','Location','BestOutside');
% Graficamos el vector velocidad en cada pto de la trayectoria
plot(posx,posy,'LineWidth',2);
u=cos(ang_phi);
v=sin(ang_phi);
quiver(posx,posy,u,v,'c'); %Ploteo del vector de la velocidad Lineal.
hold off;
        