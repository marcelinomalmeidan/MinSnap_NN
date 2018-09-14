%% nnet_dts: Given an input of range angle data
% of size N x 2*(M-1) where N is the number of inputs,
% and M is the number of waypoints.
% this function gives dts of size N x (M-1) of delta t's
% for all rows of inputs of xin
function [dts] = nnet_dts(xin)
	% Load Neural Network weights
    n_cols = size(xin,2);
    n_waypoints = n_cols/2 + 1;
    if((n_waypoints < 3) || (n_waypoints > 27))
        display('No trained neural net for the given number of waypoints');
        dts = 0;
    else
        file = strcat(num2str(n_waypoints), 'trained_weights.mat');
        load(file);
        % Calculate network output
%         size(xin);
%         size(h1);
%         size(b1);
        l1 = xin*h1+b1;
        l1 = max(l1,zeros(size(l1)));
        l2 = l1*h2+b2;
        l2 = max(l2,zeros(size(l2)));
        l3 = l2*h3+b3;
        l3 = max(l3,zeros(size(l3)));
        l4 = l3*h4+b4;
        l4 = max(l4,zeros(size(l4)));
        output_layer = l4*hout + bout;
        % Softmax output
        dts = exp(output_layer)./sum(exp(output_layer),2);
    end
    