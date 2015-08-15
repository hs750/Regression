function features = features_example( stockPriceData, currentDayIndex )
%FEATURES_EXAMPLE This is the example feature set given in the assessmet
%brief. Create other feature selector functions based on the outline of
%this to use in regression. 
%   stockPriceData: is ALL the stock price data (test and past)
%   currentDayIndex: is the day that the features are being selected for.
%       This can be a list of days.
%
%    returns:  an matrix of features, rows are each feature, columns are the
%       features for each day.

    features = zeros(10, size(currentDayIndex, 2));
    
    for i = 1:5
        features(i,:) = stockPriceData(currentDayIndex - i, 3)';
        features(i+5,:) = stockPriceData(currentDayIndex - i, 5)';
    end

end

