function [dlnZ_dmu, dlnZ_dvs] = probitNoiseGradVals(noise, mu, varsigma, y)

% PROBITNOISEGRADVALS Gradient wrt mu and varsigma of log-likelihood for probit noise model.

% NOISE

% NOISE


D = size(mu, 2);
c = y./sqrt(noise.sigma2+varsigma);
u = zeros(size(c));
for i = 1:D
  u(:, i) = c(:, i).*(mu(:, i) + noise.bias(i));
end
dlnZ_dmu = c.*gradLogCumGaussian(u);
dlnZ_dvs = -.5*c.*u.*dlnZ_dmu;
