%% MODELO CINMEATICO INVERSO ROBOT MOVIL SINCRONO
function gener_out=MCI_movil(in)
R=0.4; %-> Radio de la rueda [m]

x_d=in(1);      % Velocidad cartesiana X
y_d=in(2);      % Velocidad cartesiana Y
phi_d=in(3);    % Velocidad angular phi
phi=in(4);      % Angulo phi

% Jacobiano inverso de velocidades
jac_inv=[cos(phi)/R, sin(phi)/R, 0;
                  0,          0, 1];

%Vector de parametros generalizados
gen=[x_d y_d phi_d]';

% Definicion de salidas
tetha_d=jac_inv(1,:)*gen;
omega=jac_inv(2,:)*gen;

gener_out=[tetha_d;omega];
end
