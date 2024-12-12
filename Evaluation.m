function [fitness] = Evaluation(popu, benchmark, problemIndex, o, A, M, a, alpha, b)
global initial_flag
initial_flag = 0;
switch benchmark
    case 2005
%         CEC2005Dir = 'CEC/CEC_2005';
%         addpath(['../../', CEC2005Dir]);
        fitness = benchmark_func(popu, problemIndex);
        fitness = fitness';
    case 2011
        if problemIndex == 11; problemIndex = 111; end
        if problemIndex == 12; problemIndex = 112; end
        if problemIndex == 13; problemIndex = 113; end
        if problemIndex == 14; problemIndex = 114; end
        if problemIndex == 15; problemIndex = 115; end
        if problemIndex == 16; problemIndex = 116; end
        if problemIndex == 17; problemIndex = 117; end
        if problemIndex == 18; problemIndex = 118; end
        if problemIndex == 19; problemIndex = 119; end
        if problemIndex == 20; problemIndex = 1110; end
        if problemIndex == 21; problemIndex = 12; end
        if problemIndex == 22; problemIndex = 13; end
%         CEC2011Dir = 'CEC/CEC_2011/CEC 2011 Benchmarks';
%         addpath(['../', CEC2011Dir]);
%         addpath(['../', CEC2011Dir, '/Probs_1_to_8']);
%         addpath(['../', CEC2011Dir, '/Prob_9_Transmission_Pricing']);
%         addpath(['../', CEC2011Dir, '/Prob_10_Circ_Antenna']);
%         addpath(['../', CEC2011Dir, '/Probs_11_ELD_Package/DED Codes']);
%         addpath(['../', CEC2011Dir, '/Probs_11_ELD_Package/ELD Codes']);
%         addpath(['../', CEC2011Dir, '/Probs_11_ELD_Package/Hydrothermal Codes']);
%         addpath(['../', CEC2011Dir, '/Probs_12_to_13_Package']);
        FuncAddr = @CEC2011func;
        popuSize = size(popu,1);
        fitness = zeros(popuSize,1);
        for i = 1:popuSize
            fitness(i) = FuncAddr(popu(i,:), problemIndex);
            if isnan(fitness(i)) ==1
                fitness(i)=30e30;
            end
        end
        fitness = fitness';
    case 2013
        fhd = 'cec13_func';
        fitness = feval(fhd,popu',problemIndex);
    case 2014
        fhd = 'cec14_func';
        fitness = feval(fhd,popu',problemIndex);
    case 2017
        fhd = 'cec17_func';
        fitness = feval(fhd,popu',problemIndex);
end
end