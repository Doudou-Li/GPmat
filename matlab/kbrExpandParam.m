function model = kbrExpandParam(model, params);

% KBREXPANDPARAM Update kernel based regression model with vector of parameters.
% MLTOOLS

startVal = 1;
endVal = model.numData*model.outputDim;
model.A = reshape(params(1:endVal), model.numData, model.outputDim);
model.bias = params(endVal+1:end);