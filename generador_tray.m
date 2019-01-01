function [out]=generador_tray(in)
    t=in(1);
    
    % Se genera una trayectoria senoidal de poca amplitud y frec
    x_ref=t/5;  % Factor de escala
    %y_ref=2*sin(x_ref);
    y_ref=3;
    
    out=[x_ref;y_ref];
end