function [out]=trayectoria_persecucion(in)
    A=in(1);
    B=in(2);
    w=in(3);
    t=in(4);
    
    % Se genera una trayectoria senoidal para la persecucion pura
    x_ref=(A*t);  
    y_ref=B*sin(w*t);
    
    out=[x_ref;y_ref];
end