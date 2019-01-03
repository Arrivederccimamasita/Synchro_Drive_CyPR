function [out]=control_tray(in)
% Definicion de entradas de la funcion    
    x_tray=in(1);
    y_tray=in(2);
    dist=in(3);
  
    x=in(4);
    y=in(5);
    phi=in(6);

    % Definicion del tiempo muestreo
    Tm=0.01;
    % Definicion de las contantes del controlador -> HAY QUE ARREGLARLAS
    Kv=0.5; Ki=0.01;
    Kh=2;
    
    
    % calculo del error
    err=sqrt((x_tray-x)^2 + (y_tray-y)^2) - dist;

    
    % Definicion de la velocidad lineal de referencia
    v_ref=Kv*err + Ki*Tm*err;
    theta_d_ref=v_ref/0.4;
    % Definicion de la velocidad angular de ref
    phi_ref=atan2(y_tray-y,x_tray-x);
    omega=Kh*(phi_ref-phi);

out=[theta_d_ref;omega];
end