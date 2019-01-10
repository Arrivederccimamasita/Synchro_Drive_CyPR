function [out]=control_postura(in)
% Definicion de entradas de la funcion    
    px_ref=in(1);
    py_ref=in(2);
    ang_ref=in(3);
    
    x=in(4);
    y=in(5);
    phi=in(6);
    
%Primero se calcula los errores y variables
err_d=sqrt((px_ref-x)^2+(py_ref-y)^2); % rho

alpha=(atan2((py_ref-y),(px_ref-x)))-phi; %Calculo de alpha, el error de angulo 
 
beta=-phi-alpha+ang_ref; %Para calcular el error en postura final

% Se definen los parametros de los controladores 
% DEBEN CUMPLIR -> Kv>0 ; Kb<0 y (Ka-Kv)>0
<<<<<<< HEAD
Kv=0.5;             % ganancias velocidad lineal
=======
Kv=1;             % ganancias velocidad desplazamiento
>>>>>>> 384505733e04dd595ca36abf9578402117457c39
Ka=2; Kb=-1;    % ganancias velocidad angular
R=0.4;
% Definicion de las acciones de control
theta_d_ref=Kv*err_d/R;
omega=Ka*alpha+Kb*beta; %Velocidad angular del robot para ir al punto

<<<<<<< HEAD
out=[theta_d_ref;omega];
end
=======
out=[v_ref;omega];
end
>>>>>>> 384505733e04dd595ca36abf9578402117457c39
