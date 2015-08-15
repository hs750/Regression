% spd = readStockPriceData('sector_stock_price.csv');
% cpd = readStockPriceData('company_stock_price.csv');
% 
% plot(cpd(:, 1), cpd(:, 3), spd(:, 1), spd(:, 3));
% xTicks = get(gca, 'XTickLabel');
% xTicks = str2num(xTicks);
% xTickDates = datestr(xTicks);
% set(gca,'XTickLabel', dates);
% 
% xlabel('Date');
% ylabel('Stock Price');
% legend('Company Stock Prices','Sector Stock Prices');
% title('Graph of Company and Sector Stock Price Fluctuation')

MSEs = zeros(26, 1);
disp('starting 1');
MSEs(1) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_example);
save('mses.mat','MSEs');

disp('starting 2');
MSEs(2) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastYear);
save('mses.mat','MSEs');

disp('starting 3');
MSEs(3) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_indicies);
save('mses.mat','MSEs');

disp('starting 4');
MSEs(4) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYear);
save('mses.mat','MSEs');

disp('starting 5');
MSEs(5) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeek);
save('mses.mat','MSEs');

disp('starting 6');
MSEs(6) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_yesturday);
save('mses.mat','MSEs');

disp('starting 7');
MSEs(7) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSector);
save('mses.mat','MSEs');

disp('starting 8');
MSEs(8) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_past5DaysAndPast5DaysSector);
save('mses.mat','MSEs');

disp('starting 9');
MSEs(9) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_indicies2);
save('mses.mat','MSEs');

disp('starting 10');
MSEs(10) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_yesturdayAndChangeOver5Days);
save('mses.mat','MSEs');

disp('starting 11');
MSEs(11) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastQuarterYear);
save('mses.mat','MSEs');

disp('starting 12');
MSEs(12) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastMonth);
save('mses.mat','MSEs');

disp('starting 13');
MSEs(13) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastQuarterYearAndChangeOverLastWeek);
save('mses.mat','MSEs');

disp('starting 14');
MSEs(14) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWithSector);
save('mses.mat','MSEs');

disp('starting 15');
MSEs(15) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWith5DaySector);
save('mses.mat','MSEs');

disp('starting 16');
MSEs(16) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_allYesturedayInfo);
save('mses.mat','MSEs');

disp('starting 17');
MSEs(17) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearSector);
save('mses.mat','MSEs');

disp('starting 18');
MSEs(18) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWith5DayChange);
save('mses.mat','MSEs');

disp('starting 19');
MSEs(19) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWith10DayChange);
save('mses.mat','MSEs');

disp('starting 20');
MSEs(20) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSectorWithLogSqrt);
save('mses.mat','MSEs');

disp('starting 21');
MSEs(21) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSectorWithLogSqrtAnd5DayChange);
save('mses.mat','MSEs');

disp('starting 22');
MSEs(22) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSectorWithWeekLogSqrt);
save('mses.mat','MSEs');

disp('starting 23');
MSEs(23) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_2dayLogSqrtAndChange);
save('mses.mat','MSEs');

disp('starting 24');
MSEs(24) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_function);
save('mses.mat','MSEs');

disp('starting 25');
MSEs(25) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_function2Days);
save('mses.mat','MSEs');

disp('starting 26');
MSEs(26) = linearRegression('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearPriceAndAmount);
save('mses.mat','MSEs');
