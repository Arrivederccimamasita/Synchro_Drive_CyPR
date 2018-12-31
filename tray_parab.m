%% FUNCION PARA IMPLEMENTAR UNA PARABOLA
function [out]=tray_parab(in)
   % Defincion de entradas
    A=in(1);    %pto de corte final con la X
    D=in(2);    % "altura" parabola
    x=in(3);    %tiempo
    
    %Se escala la variable X
    x=x/5;
    % Definicion de la variable y
    y=-(1/D)*(x*(x-A));
    
    % definicion de las variables de salida
    phi_ref=atan2(y,x);

    out=[x;y;phi_ref];
end