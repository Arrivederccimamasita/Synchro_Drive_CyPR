%% MODELO CINEMATICO DIRECTO ROBOT MOVIL SINCRONO
function gener_out=MCD_movil(in)
     R=0.4; %-> Radio de la rueda [m]

    tetha_d=in(1);  % Velocidad de desplazamiento
    omega=in(2);    % Velocidad de rotacion
    phi=in(3);      % Angulo del robot

    % Jacobiano de velocidades
    jac=[R*cos(phi) 0;
         R*sin(phi) 0;
            0       1];

    % Vector de variables actuadoras de entrada
    act=[tetha_d;
         omega];

     % Definicion de salidas
     x_d=jac(1,:)*act;
     y_d=jac(2,:)*act;
     phi_d=jac(3,:)*act;
    
     gener_out=[x_d;y_d;phi_d];
end
