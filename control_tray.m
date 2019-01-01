function [out]=control_tray(in)
% Definicion de entradas de la funcion    
    x_tray=in(1);
    y_tray=in(2);
    dist=in(3);
  
    x=in(4);
    y=in(5);
    phi=in(6);
    t=in(7);

    % Variable estatica para la integral del error
    persistent int_e;
    % Definicion del tiempo muestreo
    Tm=0.01;
    % Definicion de las contantes del controlador -> HAY QUE ARREGLARLAS
    Kv=0.5; Ki=0.5;
    Kh=5;
    
    % inicializacion de variable
    if (t<1e-18) int_e=0; end;
    
    % calculo del error
    err=sqrt((x_tray-x)^2 + (y_tray-y)^2) - dist;
    %calculo de la integral del error
    int_e=err + int_e;
    
    % Definicion de la velocidad lineal de referencia
    v_ref=Kv*err + Ki*int_e;
    
    % Definicion de la velocidad angular de ref
    phi_ref=atan2(y_tray-y,x_tray-x);
    omega=Kh*(phi_ref-phi);

out=[v_ref;omega];
end