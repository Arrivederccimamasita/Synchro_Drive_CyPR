function [out]=control_linea(in)
% Definicion de entradas de la funcion    
    a=in(1);
    b=in(2);
    c=in(3);
  
    x=in(4);
    y=in(5);
    phi=in(6);

% La velocidad lineal sera constante
theta_d_ref=0.5;
    
% Definicion parametros controlador. Asingacion del signo del parametro
%para evitar movimientos equivocados
if a<0 && b<0
    Kd=-2; 
elseif a>0 && b>0
    Kd=2;
elseif a<0 && b>0
    Kd=2; 
elseif a>0 && b<0
    Kd=-2;
elseif a==0 && b>0
    Kd=2;
elseif a==0 && b<0
    Kd=-2;
end
Kh=1; % Debe ser siempre mayor que 0    

% definicion de la distancia a la recta
d=(a*x + b*y + c*1)/(sqrt(a^2 + b^2));
phi_ref=atan(-a/b);
err_ang=phi_ref-phi; %Error entre el angulo actual de robot y el de referencia

% definicion de la velocidad angular
omega=-Kd*d+Kh*err_ang;

out=[theta_d_ref;omega];
end
