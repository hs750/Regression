function combinedData = combinePriceData( companyData, sectorData )
%COMBINEPRICEDATA combine company data and sector data into one matrix

    combinedData = [companyData, sectorData(:, [2 3])];

end

