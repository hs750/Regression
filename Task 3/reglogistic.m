function Accuracy = logistic( companyDataFileName, sectorDataFileName, featureSelection)
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
    numClasses = 5;
    
    %% Claculate Classes
    % [date, companyVolme, companyPrice, sectorVolume, sectorPrice, class]
    % Classes: -Note: Classes are 1-5 as this aids the array indexing
    % 1 = nochange
    % 2 = up
    % 3 = down
    % 4 = sharp_up
    % 5 = sharp_down
    stockPriceData = [stockPriceData, zeros(dataItems, 1)];
    for i = trainDataIndecies
        yesturdayPrice = stockPriceData(i-1, 3);
        todayPrice = stockPriceData(i, 3);
        
        priceChange = todayPrice / yesturdayPrice;
        
        if priceChange <= 1.02 && priceChange >= 0.98
            stockPriceData(i, 6) = 1;
        elseif priceChange > 1.02 && priceChange <= 1.05
            stockPriceData(i, 6) = 2;
        elseif priceChange < 0.98 && priceChange >= 0.95
            stockPriceData(i, 6) = 3;
        elseif priceChange > 1.05
            stockPriceData(i, 6) = 4;
        elseif priceChange < 0.95
            stockPriceData(i, 6) = 5;
        else
            stockPriceData(i, 6) = -1; % Should never happen
            Disp('Classing Error');
        end
        
        
    end
    
    
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
    ClassRatePerFold = zeros(5, 1);
    thetaForFold = cell(5, 1);
    
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


        theta = zeros(size(features, 1), numClasses);


        %% Minimisation / Maximisation
        disp(strcat('Beginining minimisation, fold: ', num2str(fold)));
        options = optimoptions(@fminunc, 'GradObj','on');
        
        lambdaIterations = 10;
        ThetaOut = cell(lambdaIterations+1, 1);
        TotalLikeOut = zeros(lambdaIterations + 1, 1);
        LambdaOut = zeros(lambdaIterations + 1, 1);
        for I = 0:lambdaIterations
            lambda = (10 - I) * 0.1;
            [theta, TotalLikelihood] = fminunc(@ridgeLogisticLoss, theta, options);
            LambdaOut(I+1) = lambda;
            ThetaOut{I+1} = theta;
            TotalLikeOut(I+1) = -TotalLikelihood;
            disp(num2str(I));
        end
        
        %maxLikelihood = max(TotalLikeOut);
        %maxLikeTheta = TotalLikeOut == maxLikelihood;
        %theta = ThetaOut{maxLikeTheta};

        %% Validation against each theta value 
        ClassAcc = zeros(lambdaIterations + 1, 1);
        for I = 1:(lambdaIterations+1)
            theta = ThetaOut{I};
            validationFold = featureSelection(stockPriceData, folds{fold});
            y = stockPriceData(folds{fold}, 6);
            s = size(validationFold, 2);

            probC = zeros(s, numClasses);
            denom = sum(exp(validationFold' * theta)')';
            for c = 1:numClasses
                probC(:, c) = exp(validationFold' * theta(:, c)) ./ denom;
            end

            xOut = zeros(s, 1);
            for i = 1:s
                probCI = probC(i,:);
                maxProb = max(probCI);
                maxIndex = find(probCI == maxProb);
                if size(maxIndex, 2) > 1
                    disp('Validation: Multiple Classes with same probability');
                    maxIndex = maxIndex(1); %If two or more have same probability take the first class.
                end
                xOut(i) = maxIndex;
            end

            correctClassify = y == xOut;
            ClassAcc(I) = sum(correctClassify) / s;
        
        end
        
        maxAcc = max(ClassAcc);
        maxAccs = find(ClassAcc == maxAcc);
        if size(maxAccs, 1) > 1 
            maxAccs = maxAccs(1); %If two thetas give same accuracy pick the first (bias towards smaller theta value)
        end
        ClassRatePerFold(fold) = ClassAcc(maxAccs);
        
        
        thetaForFold{fold} = ThetaOut{maxAccs}';
    
 
    end
    %% Return the overall MSE using best Theta value
    X = featureSelection(stockPriceData, testSet)';
    y = stockPriceData(testSet, 6);
    
    maxClass = max(ClassRatePerFold);
    maxClassIndex = find(ClassRatePerFold == maxClass);
    if size(maxClassIndex, 1) > 1
        maxClassIndex = maxClassIndex(1); %If there are multiple best thetas
    end
    bestTheta = thetaForFold{maxClassIndex}';
    
    s = size(X, 1);
    
    probC = zeros(s, numClasses);
    denom = sum(exp(X * bestTheta)')';
    for c = 1:numClasses
        probC(:, c) = exp(X * bestTheta(:, c)) ./ denom;
    end
    
    xOut = zeros(s, 1);
    for i = 1:s
        probCI = probC(i,:);
        maxProb = max(probCI);
        maxIndex = find(probCI == maxProb);
        if size(maxIndex, 2) > 1
            disp('Testing: Multiple Classes with same probability');
            maxIndex = maxIndex(1); %If two or more have same probability take the first class.
        end
        xOut(i) = maxIndex;
    end

    correctClassify = y == xOut;

    Accuracy = (sum(correctClassify) / s) * 100; % Accuacy as percent 0-100
    
    %% Function to use for minimisation / maximisation
    function [LogLikelihood, GradOut] = ridgeLogisticLoss(Theta) 
        Y = [stockPriceData(X, 6)];
        x = features';
        
        [N,M] = size(x);

        LogClassProb = x*Theta; 
        ClassProbSum = sum(exp(LogClassProb)')';

        Grad = zeros(M,numClasses);

        LogLikelihood = 0.0;
        for i=1:N
            Indicator = zeros(1,numClasses);
            Indicator(1,Y(i))=1;
            Grad = Grad + x(i,:)'*(Indicator - (exp(LogClassProb(i,:))./ClassProbSum(i)));
            LogLikelihood = LogLikelihood + LogClassProb(i,Y(i)) - log(ClassProbSum(i));
        end
        
        % Maximise and apply lambda
        GradOut = (-1)*(Grad - 2*lambda*Theta); 
        LogLikelihood = -(LogLikelihood - lambda*(norm(Theta)^2));
    end
end