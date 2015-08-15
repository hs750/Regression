function MSE = reglinear( companyDataFileName, sectorDataFileName, featureSelection)
%LINEAR Summary of this function goes here
%   Detailed explanation goes here
    
    %% Read Data
    companyPriceData = readStockPriceData(companyDataFileName);
    sectorPriceData = readStockPriceData(sectorDataFileName);
    
    % [date, companyVolme, companyPrice, sectorVolume, sectorPrice]
    stockPriceData = combinePriceData(companyPriceData, sectorPriceData);
    
    dataItems = size(stockPriceData, 1);
    year2009startIndex = 254;
    trainDataIndecies = year2009startIndex:dataItems;
    
    
    
    
    %% Cross Validation Fold Splitting
    numberOfDataPoints = size(trainDataIndecies, 2);
    numberOfPointsPointInFold = ceil(numberOfDataPoints/5);
    folds = cell(5, 1);
    folds{1} = trainDataIndecies(:, 1:numberOfPointsPointInFold);
    folds{2} = trainDataIndecies(:, numberOfPointsPointInFold+1:numberOfPointsPointInFold*2);
    folds{3} = trainDataIndecies(:, numberOfPointsPointInFold*2+1:numberOfPointsPointInFold*3);
    folds{4} = trainDataIndecies(:, numberOfPointsPointInFold*3+1:numberOfPointsPointInFold*4);
    folds{5} = trainDataIndecies(:, numberOfPointsPointInFold*4+1:end);
    
    % Pick data from amoungst the folds to use as test data. Test data
    % items are removed from the validation and train data so that the test
    % data is hidden during training. The test data is taken fron various
    % points thought the data so that testing is not based on one local
    % area of time. Data selected such that validation folds become equel 
    % size.
    testSet = [
        folds{1}(:,end-5:end),...
        folds{2}(:,end-5:end),...
        folds{3}(:,end-5:end),...
        folds{4}(:,end-5:end),...
        folds{5}(:,end-2:end),...
    ];
    folds{1} = folds{1}(:, 1:end-6);
    folds{2} = folds{2}(:, 1:end-6);
    folds{3} = folds{3}(:, 1:end-6);
    folds{4} = folds{4}(:, 1:end-6);
    folds{5} = folds{5}(:, 1:end-3);
    
    
    numFeatures = size(featureSelection(stockPriceData, year2009startIndex), 1);
    MSEperFold = zeros(5, 1);
    thetaForFold = zeros(5, numFeatures);
    
    %% 5 Fold Cross Validation
    
    for fold = 1:5
        X = [
            folds{mod(fold, 5)+ 1}, ...
            folds{mod(fold + 1, 5) + 1}, ...
            folds{mod(fold + 2, 5)+ 1}, ...
            folds{mod(fold + 3, 5)+ 1}
            ];
        

        %% Feature Selection
        features = featureSelection(stockPriceData, X);


        theta = zeros(size(features, 1), 1);

        %% Minimisation
        disp(strcat('Beginining minimisation, fold: ', num2str(fold)));
        options = optimoptions(@fminunc, 'GradObj', 'On');
        
        lambdaIterations = 9;
        ThetaOut = zeros(numFeatures, lambdaIterations+1);
        TotalLossOut = zeros(lambdaIterations + 1, 1);
        LambdaOut = zeros(lambdaIterations + 1, 1);
        for I = 0:lambdaIterations
            lambda = (10 - I) * 0.1;
            [theta, TotalLoss] = fminunc(@ridge, theta, options);
            LambdaOut(I+1) = lambda;
            ThetaOut(:,I+1) = theta;
            TotalLossOut(I+1) = TotalLoss;
            disp(num2str(I));
        end
        
        %% Validation and best theta selection
        ThetaErrs = zeros(lambdaIterations+1, 1);
        for I = 1:lambdaIterations + 1
            theta = ThetaOut(:,I);
            
            validationFold = featureSelection(stockPriceData, folds{fold});
            y = stockPriceData(folds{fold}, 3);

            s = size(validationFold, 2);
            xOut = zeros(s, 1);
            for i = 1:s
                xOut(i) = dot(theta, validationFold(:, i));
            end

            err = y - xOut;
            err = err.^2;
            
            mse = mean(err);
            ThetaErrs(I) = mse;
        end
        
        minErr = min(ThetaErrs);
        minErrTheta = find(ThetaErrs == minErr);
        if size(minErrTheta, 1) > 1 
            minErrTheta = minErrTheta(end); %If two thetas give same mse pick the last (bias towards smaller theta value)
        end
        theta = ThetaOut(:,minErrTheta);
        MSEperFold(fold) = minErr;
        thetaForFold(fold, :) = theta';
    
 
    end
    
    %% Return the overall MSE using best Theta value
    X = featureSelection(stockPriceData, testSet);
    y = stockPriceData(testSet, 3);
    
    minMSE = min(MSEperFold);
    minMSEindex = MSEperFold == minMSE;
    bestTheta = thetaForFold(minMSEindex, :)';
    
    s = size(X, 2);
    xOut = zeros(s, 1);
    for i = 1:s
        xOut(i) = dot(bestTheta, X(:, i));
    end

    err = y - xOut;
    err = err.^2;
    
    MSE = mean(err);
    
    %% Function to use for minimisation
    function [meanSqError, Grad] = squaredLoss(Theta) 
        Y = stockPriceData(X, 3);
 
        xO = features'*Theta;
        
        Error = Y - xO; 
        SqError = Error.^2;
        
        meanSqError = mean(SqError);
        Grad = -(features * Error);
    end

    function [mseRidge, Grad] = ridge(Theta)
        Y = stockPriceData(X, 3);
        x = features';
        [SqLoss, grad] = squaredLoss(Theta);
        mseRidge = lambda * SqLoss + (1-lambda)*(Theta'*Theta);
        Grad = (-2)*lambda*(-grad)+2*(1-lambda)*Theta;
    end


end