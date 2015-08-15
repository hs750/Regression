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

    features = [
        stockPriceData(currentDayIndex -1, 3)';
        stockPriceData(currentDayIndex -1, 3)'.^2;
        sqrt(stockPriceData(currentDayIndex -1, 3))';
        log(stockPriceData(currentDayIndex -1, 3))';
        log10(stockPriceData(currentDayIndex -1, 3))';
        stockPriceData(currentDayIndex -1, 3)'.^(-1);
        
        stockPriceData(currentDayIndex -2, 3)';
        stockPriceData(currentDayIndex -2, 3)'.^2;
        sqrt(stockPriceData(currentDayIndex -2, 3))';
        log(stockPriceData(currentDayIndex -2, 3))';
        log10(stockPriceData(currentDayIndex -2, 3))';
        stockPriceData(currentDayIndex -2, 3)'.^(-1);
    ];  
 

end

