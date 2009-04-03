function kern = rbfinfwhiteKernParamInit(kern)

% RBFINFWHITEKERNPARAMINIT RBF-WHITE kernel (with integration limits between
% minus infinity and infinity) parameter initialisation. The RBF-WHITE is a
% convolutional kernel defined from the convolution of a white input noise
% process with a smoothing kernel given by an RBF.
%
% The parameters are sigma2, the process variance (kern.variance),
% and gamma, the inverse width (kern.inverseWidth). The inverse
% width controls how wide the basis functions are, the larger
% gamma, the smaller the basis functions are.
%
% FORMAT
% DESC initialises the RBF-WHITE kernel structure with some default
% parameters.
% ARG kern : the kernel structure which requires initialisation.
% RETURN kern : the kernel structure with the default parameters placed in.
%
% SEEALSO : kernCreate, kernParamInit
%
% COPYRIGHT : David Luengo, 2009

% KERN


if kern.inputDimension > 1
  error('RBF-WHITE kernel only valid for one-D input.')
end

kern.nParams = 2;
kern.inverseWidth = 1;
kern.variance = 1;

% Constrains parameters to be positive for optimisation.
kern.transforms.index = [1 2];
kern.transforms.type = optimiDefaultConstraint('positive');
kern.isStationary = true;
