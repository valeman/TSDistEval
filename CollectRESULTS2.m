function CollectRESULTS2(DataSetStartIndex, DataSetEndIndex)  

    Normalizations = [cellstr('ZScoreNorm'), 'MinMaxNorm', 'MeanNorm', 'UnitLengthNorm', 'MedianNorm', 'AdaptiveNorm' ...
        'Sigmoid', 'Tanh'];
    
    Methods = [cellstr('NCCc'), 'NCCb', 'NCCu', 'NCC'];

    % first 2 values are '.' and '..' - UCR Archive 2018 version has 128 datasets
    dir_struct = dir('./UCR2018/');
    Datasets = {dir_struct(3:130).name};
                     
    % Sort Datasets
    
    [Datasets, DSOrder] = sort(Datasets);
    
    for w = 1:length(Normalizations)
        Results = [];
        for k = 1:length(Methods)
            ResultsTmp = dlmread( strcat('./RESULTS/RESULTS_RunONNC_ACCURACY_', char(Methods(k)), '_', char(Normalizations(w)), '_', num2str(DataSetStartIndex), '_', num2str(DataSetEndIndex)) );
            Results = [Results,ResultsTmp];        
        end
        dlmwrite( strcat( './RESULTSFINAL_RunONNC_ACCURACY_', char(Normalizations(w)),'_', num2str(DataSetStartIndex), '_', num2str(DataSetEndIndex)), Results, 'delimiter', ',');
    
    end
    
end
