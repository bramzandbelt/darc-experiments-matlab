function plotMagnitudeEffect(mcmcsamples, pointEstimateType)
%
% log(k) = m * log(|B|) + c
% k = exp( m * log(|B|) + c )

% -----------------------------------------------------------
%fh = @(x,params) exp( params(:,1) * log(|x|) + params(:,2));
% a FAST vectorised version of above ------------------------
fh = @(x,params) exp( bsxfun(@plus, ...
	bsxfun(@times,params(:,1),log(abs(x))),...
	params(:,2)));
% -----------------------------------------------------------

samples(:,1) = mcmcsamples.m(:);
samples(:,2) = mcmcsamples.c(:);

mcmc.PosteriorPrediction1D(fh,...
    'xInterp',logspace(0,4,50),...
    'samples',samples,...
    'ciType','examples',...
    'variableNames', {'reward, $\pounds$', '$k$ (days$^{-1}$)'},...
	'pointEstimateType',pointEstimateType);

% Extra formatting
set(gca,'XScale','log')
set(gca,'YScale','log')
set(gca,'XTick',logspace(1,6,6))
%set(gca,'YTick',logspace(-4,0,5))
%forceNonExponentialTick
return
