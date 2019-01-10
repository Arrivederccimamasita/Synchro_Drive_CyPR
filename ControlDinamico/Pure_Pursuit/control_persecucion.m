function [out]=control_persecucion(in)
% Definicion de entradas de la funcion    
    x_ref=in(1);
    y_ref=in(2);
  
    x=in(3);
    y=in(4);
    phi=in(5);
    t=in(6);
    
    R=0.4;
    
    kp=2.2;
    kbeta=-0.1;
    kalf=kbeta+5.6; 
    % Se evita la indeterminacion en omega
    if (t<1e-18) 
        L=0.000001;
    else
        % Se calcula los errores
        L=sqrt((x_ref-x)^2+(y_ref-y)^2); 
    end
    
   

    % Una vez calculados los errores, se hace control
    v_ref=kp*L; %Velocidad robot
    theta_d_ref=v_ref/R;
    
    alpha=atan2(y_ref-y,x_ref-x)-phi; %Error en angulo
    beta=-phi-alpha;
    
%      e_ang=atan2(y_ref-y,x_ref-x)-phi; %Error en angulo
%     r=L/(2*e_ang);
% r=-(L^2)/(2*(x_ref-x));
    %omega=(2*v_ref*sin(e_ang))/L; %Velocidad angular del robot para ir al punto
    %omega=(2*(x_ref-x))/(2*L);
    omega=kalf*alpha+kbeta*beta;
    
    out=[theta_d_ref;omega];
end