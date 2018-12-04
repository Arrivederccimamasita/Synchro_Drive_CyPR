%% MODELO CINMEATICO INVERSO ROBOT MÓVIL SÍNCRONO
function gener_out=MCI_movil(in)
% L/B[m]=0.8
R=0.4; %-> Radio de la rueda [m]


x_d=in(1);  % Velocidad cartesiana X
y_d=in(2);    % Velocidad cartesiana Y
phi_d=in(3);      % Velocidad angular phi
phi=in(4);      % Ángulo phi

% Jacobiano inverso de velocidades
jac_inv=[(R*cos(phi))/(R^2*cos(phi)^2+R^2*sin(phi)^2), (R*sin(phi))/(R^2*cos(phi)^2+R^2*sin(phi)^2), 0;
    0,                                            0, 1];

%Vector de parámetros generalizados
gen=[x_d y_d phi_d]';


% Definicion de salidas
tetha_d=jac_inv(1,:)*gen;
omega=jac_inv(2,:)*gen;

gener_out=[tetha_d;omega];
end
