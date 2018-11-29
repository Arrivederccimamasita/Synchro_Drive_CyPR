%% MODELO CINEMATICO ROBOT MOVIL SINCRONO

function gener_out=MCD_movil(in)
    % L/B[m]=0.8 
     R=0.4; %-> Radio de la rueda [m]

    
    tetha_d=in(1);  % Velocidad lineal
    omega=in(2);    % Velocidad angular
    phi=in(3);      % Angulo del robot
    
    % Condiciones iniciales -> Todo a 0, es decir x=0,y=0,phi=0
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