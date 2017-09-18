function [fitresult, gof] = errorfunctionfitting(x, e)
%CREATEFIT(X,E)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x
%      Y Output: e
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 17-Sep-2017 20:45:21 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x, e );

% Set up fittype and options.
ft = fittype( 'rat01' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [0.431413827463545 0.910647594429523];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'e vs. x', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel( 'x' );
ylabel( 'e' );
grid on


