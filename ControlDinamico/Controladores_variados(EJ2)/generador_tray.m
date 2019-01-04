function [out]=generador_tray(in)
    t=in(1);
    sel=in(2);
    % Se genera una trayectoria senoidal de poca amplitud y frec
    x_ref=t/100;  % Factor de escala
    
    % Implementacion de trayectoria a trozos
    if sel==0
        if  t<=30
            y_ref=x_ref/10;
        elseif (30<t)&&(t<=60)
            y_ref=0.018+x_ref/25;
        elseif (60<t)&&(t<=90)
            y_ref=0.042;
        else
            y_ref=0.0645-x_ref/40;
        end
    else
     y_ref=0.1*sin(2*pi*x_ref);
    end
    out=[x_ref;y_ref];
end