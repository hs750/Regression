function stockPriceData = readStockPriceData( InputFileName )
    %% Read raw data from file
    fileFormat = '%s%f%f%[^\n\r]';
    file = fopen(InputFileName,'r');
    rawData = textscan(file, fileFormat, 'Delimiter', ',', 'HeaderLines' ,1);
    fclose(file);

    %% Extract Data
    %Date values from file
    dates = rawData{:,1};
    %Convert from string to date number
    dates = datenum(dates, 'dd/mm/yyyy'); 

    %Volume data from file
    volumes = rawData{:, 2};

    %Price data from file
    prices = rawData{:,3};

    %Complete data matrix
    stockPriceData = [dates, volumes, prices];
end