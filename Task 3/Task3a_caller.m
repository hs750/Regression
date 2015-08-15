regMSEs = zeros(26, 1);
disp('starting 1');
regMSEs(1) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_example);
save('regMSEs.mat','regMSEs');

disp('starting 2');
regMSEs(2) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastYear);
save('regMSEs.mat','regMSEs');

disp('starting 3');
regMSEs(3) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_indicies);
save('regMSEs.mat','regMSEs');

disp('starting 4');
regMSEs(4) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYear);
save('regMSEs.mat','regMSEs');

disp('starting 5');
regMSEs(5) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeek);
save('regMSEs.mat','regMSEs');

disp('starting 6');
regMSEs(6) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_yesturday);
save('regMSEs.mat','regMSEs');

disp('starting 7');
regMSEs(7) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSector);
save('regMSEs.mat','regMSEs');

disp('starting 8');
regMSEs(8) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_past5DaysAndPast5DaysSector);
save('regMSEs.mat','regMSEs');

disp('starting 9');
regMSEs(9) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_indicies2);
save('regMSEs.mat','regMSEs');

disp('starting 10');
regMSEs(10) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_yesturdayAndChangeOver5Days);
save('regMSEs.mat','regMSEs');

disp('starting 11');
regMSEs(11) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastQuarterYear);
save('regMSEs.mat','regMSEs');

disp('starting 12');
regMSEs(12) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastMonth);
save('regMSEs.mat','regMSEs');

disp('starting 13');
regMSEs(13) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastQuarterYearAndChangeOverLastWeek);
save('regMSEs.mat','regMSEs');

disp('starting 14');
regMSEs(14) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWithSector);
save('regMSEs.mat','regMSEs');

disp('starting 15');
regMSEs(15) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWith5DaySector);
save('regMSEs.mat','regMSEs');

disp('starting 16');
regMSEs(16) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_allYesturedayInfo);
save('regMSEs.mat','regMSEs');

disp('starting 17');
regMSEs(17) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearSector);
save('regMSEs.mat','regMSEs');

disp('starting 18');
regMSEs(18) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWith5DayChange);
save('regMSEs.mat','regMSEs');

disp('starting 19');
regMSEs(19) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearWith10DayChange);
save('regMSEs.mat','regMSEs');

disp('starting 20');
regMSEs(20) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSectorWithLogSqrt);
save('regMSEs.mat','regMSEs');

disp('starting 21');
regMSEs(21) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSectorWithLogSqrtAnd5DayChange);
save('regMSEs.mat','regMSEs');

disp('starting 22');
regMSEs(22) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastWeekAndPastWeekSectorWithWeekLogSqrt);
save('regMSEs.mat','regMSEs');

disp('starting 23');
regMSEs(23) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_2dayLogSqrtAndChange);
save('regMSEs.mat','regMSEs');

disp('starting 24');
regMSEs(24) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_function);
save('regMSEs.mat','regMSEs');

disp('starting 25');
regMSEs(25) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_function2Days);
save('regMSEs.mat','regMSEs');

disp('starting 26');
regMSEs(26) = reglinear('company_stock_price.csv', 'sector_stock_price.csv', @features_pastHalfYearPriceAndAmount);
save('regMSEs.mat','regMSEs');