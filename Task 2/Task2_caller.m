ClassificationRates = zeros(26, 1);
disp('Starting 1');
ClassificationRates(1) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_example);

disp('Starting 2');
ClassificationRates(2) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastYear);

disp('Starting 3');
ClassificationRates(3) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_indicies);

disp('Starting 4');
ClassificationRates(4) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYear);

disp('Starting 5');
ClassificationRates(5) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeek);

disp('Starting 6');
ClassificationRates(6) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_yesturday);

disp('Starting 7');
ClassificationRates(7) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSector);

disp('Starting 8');
ClassificationRates(8) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_past5DaysAndPast5DaysSector);

disp('Starting 9');
ClassificationRates(9) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_indicies2);

disp('Starting 10');
ClassificationRates(10) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_yesturdayAndChangeOver5Days);

disp('Starting 11');
ClassificationRates(11) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastQuarterYear);
save('classAcc.mat','ClassificationRates');

disp('Starting 12');
ClassificationRates(12) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastMonth);
save('classAcc.mat','ClassificationRates');

disp('Starting 13');
ClassificationRates(13) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastQuarterYearAndChangeOverLastWeek);
save('classAcc.mat','ClassificationRates');

disp('Starting 14');
ClassificationRates(14) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWithSector);
save('classAcc.mat','ClassificationRates');

disp('Starting 15');
ClassificationRates(15) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWith5DaySector);
save('classAcc.mat','ClassificationRates');

disp('Starting 16');
ClassificationRates(16) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_allYesturedayInfo);
save('classAcc.mat','ClassificationRates');

disp('Starting 17');
ClassificationRates(17) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearSector);
save('classAcc.mat','ClassificationRates');

disp('Starting 18');
ClassificationRates(18) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWith5DayChange);
save('classAcc.mat','ClassificationRates');

disp('Starting 19');
ClassificationRates(19) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWith10DayChange);
save('classAcc.mat','ClassificationRates');

disp('Starting 20');
ClassificationRates(20) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSectorWithLogSqrt);
save('classAcc.mat','ClassificationRates');

disp('Starting 21');
ClassificationRates(21) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSectorWithLogSqrtAnd5DayChange);
save('classAcc.mat','ClassificationRates');

disp('Starting 22');
ClassificationRates(22) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSectorWithWeekLogSqrt);
save('classAcc.mat','ClassificationRates');

disp('Starting 23');
ClassificationRates(23) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_2dayLogSqrtAndChange);
save('classAcc.mat','ClassificationRates');

disp('Starting 24');
ClassificationRates(24) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_function);
save('classAcc.mat','ClassificationRates');

disp('Starting 25');
ClassificationRates(25) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_function2Days);
save('classAcc.mat','ClassificationRates');

disp('Starting 26');
ClassificationRates(26) = logistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearPriceAndAmount);
save('classAcc.mat','ClassificationRates');