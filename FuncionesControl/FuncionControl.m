function [ control ] = FuncionControl( y1,y2, xsens, ref)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    y1=y1-ref;
    y2=y2-ref;
    
    %% 
    %Se define la recta de referencia en base a los sensores
    m=(y1-y2)/(xsens); // y_{p}
    b=y1;
    recta=[-m,0,b];
    %Calculo del angulo del Robot con respecto a la recta
    theta=atan( -m/b);
    
    
%     x=(0:20); y=recta(1)*x+recta(3);
%     figure(1);
%     plot(x,y); grid;
%     
    %Definimos la posicion del Robot
    robot=[(xsens/2),0,1];
    
    %Calculo del robot a la recta trazando una PERPENDICULAR
    d=dot(recta,robot);
    
    if(abs(m)>0.8) %Saturamos en caso de pendiente muy pequeña
        d=d./abs(m);
    end
    
    %Ya tenemos--> referencia de vel angular=-K_{d}*d+K_{h}*(theta)
    
    
    % Distancia media LINEAL  
    y_ref=(y1+y2)/2;
     d_lin=y_ref +min(y1,y2);
    
     
    
    
    control=[recta,theta,d,d_lin];
    return 
    

end

