function [ v_angular, v_lineal ] = Control( Kd, Kh ,d ,theta, theta_ref,v_lin,Kv)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

v_angular=-Kd*d+Kh(theta - theta_ref);
v_lineal=Kv*v_lin;
end

