%% ALGORITMO DE CONTROL A UN PUNTO. SERA UN CONTROL PROPORCIONAL
function [out]=control_pto(in)
% Definicion de entradas de la funcion    
    x_ref=in(1);
    y_ref=in(2);
    
    x=in(3);
    y=in(4);
    phi=in(5);
    
%Definicion parametros controlador    
Kv=0.5; 
Kh=1; % Debe ser siempre mayor que 0    

% Suponemos x_ref, y_ref y phi_ref conocidas.
% Se calculan los errores en distancia y angulo respectivamente
% NO SE SI ERR_DIST EN VDD ES LA REFERENCIA DE VELOCIDAD LINEAL Y ERR_ANG
% ES LA REFERENCIA DE VELOCIDAD ANGULAR


err_dist=Kv*sqrt((x_ref-x)^2 + (y_ref-y)^2 );

phi_ref=atan2(y_ref-y,x_ref-x);
err_ang=Kh*(phi_ref-phi);





out=[err_dist;err_ang];
end