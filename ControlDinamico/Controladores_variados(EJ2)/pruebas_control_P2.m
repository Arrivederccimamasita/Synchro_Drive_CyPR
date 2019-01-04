%% CONTROL ROBOCHITO
sel=input('Que tipo de control desea probar:\n1.Control a un punto\n2.Control una linea\n3.Control por una trayectoria definida\n4.Control a una postura\n');

switch (sel)
    case 1
    % MOVER A UN PUNTO
    % Posiciones iniciales del integrador
     pos_init=[0;0;0];
    %Tiempo de simulacion
    tsim=100;

    % Añadir saturacion en velocidades angulares y lineales.
    % No se gira un volante a mas de 10-15 deg/sec, por tanto, ahí estará la saturación del movimiento
     omega_sat=[-0.2618 0.2618];%15 grados/segundo
     tetha_d_sat=[-0.75 0.75];%Velocidad lineal de 30 cm/seg

    % punto al que se debe mover
    selection='Asigne la variable X del punto objetivo: ';
    x_ref=input(selection);
    selection='Asigne la variable Y del punto objetivo: ';
    y_ref=input(selection);
%     x_ref=-3;
%     y_ref=5;

    % Se lanza la simulacion
    sim('sl_robot_sincrono_control_pto');

    % Se grafican resultados
    plot(posx,posy,x_ref,y_ref,'*','LineWidth',2);grid;
    % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    case 2
    % MOVER POR UNA RECTA
    % Posiciones iniciales del integrador
     pos_init=[0;0;0];
    %Tiempo de simulacion
    tsim=100;

    % Añadir saturacion en velocidades angulares y lineales.
    % No se gira un volante a mas de 10-15 deg/sec, por tanto, ahí estará la saturación del movimiento
     omega_sat=[-0.2618 0.2618];%15 grados/segundo
     tetha_d_sat=[-0.75 0.75];%Velocidad lineal de 30 cm/seg    
     
     % Definicion de parametros de la recta
     disp('Introduzca los parametros de la recta con ec -> ax + by + c = 0');
     a=input('Parametro A: ');
     b=input('Parametro B: ');
     c=input('Parametro C: ');
     %a=-1; b=1; c=-1; % -> y=x+1
     
     % Se lanza la simulacion
     sim('sl_robot_sincrono_control_linea');

     % Se define la recta para comparar
     y_recta=-(1/b)*(c+a*t);
     % Se grafican resultados
     figure();plot(t,y_recta,'r','LineWidth',3);hold on;plot(posx,posy,'b','LineWidth',1);grid;...
         legend('Trayectoria referencia','Trayectoria robot','Location','BestOutside');
    % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    case 3
     % MOVER POR UNA TRAYECTORIA A CIERTA DISTACIA
     % %%%
     % SE PODRIA ENTENDER COMO, DANDOLE UNA CIERTA CANDIDAS DE PUNTOS, QUE
     % SIGA LA TRAYECTORIA QUE SIGUE TODOS ELLOS. SIN EMBARGO, EN ESTE
     % CASO, HE CREADO UN GENERADOR DE TRAYECTORIAS SIMPLÓN DE TODO.
%      Kv=0.5;Ki=0.01;Kh=2;
%      R=0.4;
    selection='Seleccione el tipo de trayectoria a implementar:\n 0:Rectilinea. \n 1:Senoidal.\n';
    sel=input(selection);
    while (sel >1)
       disp('Error. Parametro no valido\n')
       selection='Seleccione el tipo de trayectoria a implementar:\n 0.Lineal/Curva. \n 1.Senoidal.\n';
       sel=input(selection);
    end
    % Posiciones iniciales del integrador
    if sel==0
     pos_init=[0;0;0.0997];
    else
     pos_init=[0;0;0.5608];
    end
    % Tiempo de simulacion
    tsim=120; 
    % Tiempo de muestreo
    Tm=0.01;

    % Añadir saturacion en velocidades angulares y lineales.
    % No se gira un volante a mas de 10-15 deg/sec, por tanto, ahí estará la saturación del movimiento
     omega_sat=[-0.2618 0.2618];%15 grados/segundo
     tetha_d_sat=[-0.75 0.75];%Velocidad lineal de 30 cm/seg        
     
     % Distancia a la que se quiere seguir la trayectoria
     d=0;
     
     % Se lanza la simulacion
     sim('sl_robot_sincrono_control_trayect');
     
     % Se grafican resultados
     figure();plot(x_tray,y_tray,'r','LineWidth',2);hold on;plot(posx,posy,'b','LineWidth',1);grid;
     
     % %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     
    case 4
    % MOVER POR A UNA POSTURA
    % NO SE MUY BIEN COMO VERIFICAR ESTO LA VERDAD, CREO QUE FUNCIONA
    % PORQUE VA AL PUNTO QUE SE LE PIDE.
    % Posiciones iniciales del integrador
     pos_init=[0;0;0];
    % Tiempo de simulacion
    tsim=100; 
    % Tiempo de muestreo
    Tm=0.01;

    % Añadir saturacion en velocidades angulares y lineales.
    % No se gira un volante a mas de 10-15 deg/sec, por tanto, ahí estará la saturación del movimiento
     omega_sat=[-0.2618 0.2618];%15 grados/segundo
     tetha_d_sat=[-0.75 0.75];%Velocidad lineal de 30 cm/seg  
     
     % Definicion del punto objetivo y su angulo
     px_ref=15; py_ref=5;
     ang_ref=pi;
     
     % Se lanza la simulacion
     sim('sl_robot_sincrono_control_postura');
     
     % HE INTENTADO PINTAR UN VECTOR PARA VER SI LLEGA CON ESA DIRECCION
     % PERO NO HA HABIDO SUERTE.
     p0=[px_ref py_ref];
     p1=[px_ref+cos(ang_ref) py_ref+sin(ang_ref)];
     
     % Se grafican resultados
     figure();hold on
     plot(posx,posy);grid;
 %    quiver(p0,p1);
     hold off;
     
     
end