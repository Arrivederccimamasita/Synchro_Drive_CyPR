%% CONTROL ROBOCHITO

% MOVER A UN PUNTO
% Posiciones iniciales del integrador
 pos_init=[0;0;0];
%Tiempo de simulacion
t_sim=30;

% Añadir saturacion en velocidades angulares y lineales.
% No se gira un volante a mas de 10-15 deg/sec, por tanto, ahí estará la saturación del movimiento
 omega_sat=[-0.2618 0.2618];%15 grados/segundo
 tetha_d_sat=[-0.75 0.75];%Velocidad lineal de 30 cm/seg
 