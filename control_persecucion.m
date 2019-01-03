function [out]=control_persecucion(in)
% Definicion de entradas de la funcion    
    x_ref=in(1);
    y_ref=in(2);
  
    x=in(3);
    y=in(4);
    phi=in(5);
    t=in(6);
    
    R=0.4;
    % Se evita la indeterminacion en omega
    if (t<1e-18) 
        L=0.000001;
    else
        % Se calcula los errores
        L=sqrt((x_ref-x)^2+(y_ref-y)^2); 
    end
    
    e_ang=atan2(y_ref-y,x_ref-x)-phi; %Error en angulo

    % Una vez calculados los errores, se hace control
    v_ref=0.05; %Velocidad robot
    theta_d_ref=v_ref/R;
    r=L/(2*sin(e_ang));
    %omega=(2*v_ref*sin(e_ang))/L; %Velocidad angular del robot para ir al punto
    %omega=(2*(x_ref-x))/(2*L);
    omega=v_ref/r;
    
    out=[theta_d_ref;omega];
end