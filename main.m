 
% Main function for using HGSA algorithm.
clear all;clc
warning off

N=100;

ElitistCheck=1; Rpower=1;%RµÄ´Î·½

min_flag=1; % 1: minimization, 0: maximization
global GetFunInfoAddr FuncAddr initial_flag fun func_num
CEC2011Dir = 'CEC 2011 Benchmarks';
        addpath(['./', CEC2011Dir]);
        addpath(['./', CEC2011Dir, '/Probs_1_to_8']);
        addpath(['./', CEC2011Dir, '/Prob_9_Transmission_Pricing']);
        addpath(['./', CEC2011Dir, '/Prob_10_Circ_Antenna']);
        addpath(['./', CEC2011Dir, '/Probs_11_ELD_Package/DED Codes']);
        addpath(['./', CEC2011Dir, '/Probs_11_ELD_Package/ELD Codes']);
        addpath(['./', CEC2011Dir, '/Probs_11_ELD_Package/Hydrothermal Codes']);
        addpath(['./', CEC2011Dir, '/Probs_12_to_13_Package']);
        GetFunInfoAddr = @CEC2011get_fun_info;
        FuncAddr = @CEC2011func;
Statistic = [];


for problem = 1:22
    initial_flag = 0;
    func_num = problem;
    FbestChart=[];
    fun = func_num;
        if fun == 11; fun = 111; end
        if fun == 12; fun = 112; end
        if fun == 13; fun = 113; end
        if fun == 14; fun = 114; end
        if fun == 15; fun = 115; end
        if fun == 16; fun = 116; end
        if fun == 17; fun = 117; end
        if fun == 18; fun = 118; end
        if fun == 19; fun = 119; end
        if fun == 20; fun = 1110; end
        if fun == 21; fun = 12; end
        if fun == 22; fun = 13; end
    for t=1:51
        [Fbest,BestChart,max_it]=HGSA(N,ElitistCheck,min_flag,Rpower,fun,t);
        FbestChart=[FbestChart,BestChart];       
    end
    
    
    Mean=mean(FbestChart(max_it,:),2);
    Std =std(FbestChart(max_it,:),0,2);
    Statistic = [Statistic;[FbestChart(max_it,:),Mean,Std]];
    FbestChart=[FbestChart,mean(FbestChart,2)];
    
    xlswrite(['./DLGSA_CEC2011.xlsx'],FbestChart,['CEC2011_F',num2str(problem)]);
    
end

    xlswrite(['./DLGSA_CEC2011.xlsx'],Statistic,'CEC2011_Statistic');


 
