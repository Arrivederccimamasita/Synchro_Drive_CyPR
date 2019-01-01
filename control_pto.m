%% ALGORITMO DE CONTROL A UN PUNTO. SERA UN CONTROL PROPORCIONAL
function [out]=control_pto(in)
% Definicion de entradas de la funcion    
    x_ref=in(1);
    y_ref=in(2);
  
    x=in(3);
    y=in(4);
    phi=in(5);
    
%Definicion parametros controlador 
% Me los he inventado. Seria interesante sacarle alguna coherencia
Kv=0.5; 
Kh=1; % Debe ser siempre mayor que 0    

% Suponemos x_ref, y_ref y phi_ref conocidas.
v_ref=Kv*sqrt((x_ref-x)^2 + (y_ref-y)^2 );

phi_ref=atan2(y_ref-y,x_ref-x);
omega=Kh*(phi_ref-phi);

out=[v_ref;omega];
end