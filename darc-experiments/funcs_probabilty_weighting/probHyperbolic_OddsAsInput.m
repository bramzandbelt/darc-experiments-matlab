function dF = probHyperbolic_OddsAsInput(prospect, params)
% A wrapper for probHyperbolic, but which allows inputs in the form of
% oddsagainst, rather than probability against.

offer_new.prob  = oddsagainst2prob(prospect.oddsagainst);

% function we are wrapping
dF = probHyperbolic(offer_new, params);

end
