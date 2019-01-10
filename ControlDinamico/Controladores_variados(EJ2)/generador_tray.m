function [out]=generador_tray(in)
    t=in(1);
    sel=in(2);
    A=in(3:4);
    B=in(5:6);
    C=in(7:8);
    

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
         % Interpolacion de ptos con splines
         % Vector de puntos
         O=[0;0];
         P=[O A B C];
         % Trayectoria a seguir para pasar por los puntos
         ytray=@(tau) interp1(P(1,:),P(2,:),tau,'spline'); 
         
         y_ref=ytray(x_ref);
         
         if x_ref>C(1)
             x_ref=C(1);
             y_ref=C(2);
         else
             y_ref=ytray(x_ref);
         end

    end
    out=[x_ref;y_ref];
end
