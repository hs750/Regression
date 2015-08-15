regClassificationRates = zeros(26, 1);
disp('Starting 1');
regClassificationRates(1) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_example);
save('regCR.mat','regClassificationRates');

disp('Starting 2');
regClassificationRates(2) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastYear);
save('regCR.mat','regClassificationRates');

disp('Starting 3');
regClassificationRates(3) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_indicies);
save('regCR.mat','regClassificationRates');

disp('Starting 4');
regClassificationRates(4) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYear);
save('regCR.mat','regClassificationRates');

disp('Starting 5');
regClassificationRates(5) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeek);
save('regCR.mat','regClassificationRates');

disp('Starting 6');
regClassificationRates(6) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_yesturday);
save('regCR.mat','regClassificationRates');

disp('Starting 7');
regClassificationRates(7) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSector);
save('regCR.mat','regClassificationRates');

disp('Starting 8');
regClassificationRates(8) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_past5DaysAndPast5DaysSector);
save('regCR.mat','regClassificationRates');

disp('Starting 9');
regClassificationRates(9) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_indicies2);
save('regCR.mat','regClassificationRates');

disp('Starting 10');
regClassificationRates(10) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_yesturdayAndChangeOver5Days);
save('regCR.mat','regClassificationRates');

disp('Starting 11');
regClassificationRates(11) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastQuarterYear);
save('regCR.mat','regClassificationRates');

disp('Starting 12');
regClassificationRates(12) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastMonth);
save('regCR.mat','regClassificationRates');

disp('Starting 13');
regClassificationRates(13) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastQuarterYearAndChangeOverLastWeek);
save('regCR.mat','regClassificationRates');

disp('Starting 14');
regClassificationRates(14) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWithSector);
save('regCR.mat','regClassificationRates');

disp('Starting 15');
regClassificationRates(15) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWith5DaySector);
save('regCR.mat','regClassificationRates');

disp('Starting 16');
regClassificationRates(16) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_allYesturedayInfo);
save('regCR.mat','regClassificationRates');

disp('Starting 17');
regClassificationRates(17) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearSector);
save('regCR.mat','regClassificationRates');

disp('Starting 18');
regClassificationRates(18) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWith5DayChange);
save('regCR.mat','regClassificationRates');

disp('Starting 19');
regClassificationRates(19) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWith10DayChange);
save('regCR.mat','regClassificationRates');

disp('Starting 20');
regClassificationRates(20) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSectorWithLogSqrt);
save('regCR.mat','regClassificationRates');

disp('Starting 21');
regClassificationRates(21) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSectorWithLogSqrtAnd5DayChange);
save('regCR.mat','regClassificationRates');

disp('Starting 22');
regClassificationRates(22) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSectorWithWeekLogSqrt);
save('regCR.mat','regClassificationRates');

disp('Starting 23');
regClassificationRates(23) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_2dayLogSqrtAndChange);
save('regCR.mat','regClassificationRates');

disp('Starting 24');
regClassificationRates(24) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_function);
save('regCR.mat','regClassificationRates');

disp('Starting 25');
regClassificationRates(25) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_function2Days);
save('regCR.mat','regClassificationRates');

disp('Starting 26');
regClassificationRates(26) = reglogistic('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearPriceAndAmount);
save('regCR.mat','regClassificationRates');
