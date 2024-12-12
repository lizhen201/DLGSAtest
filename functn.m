function y = functn(x)
global fun FuncAddr
    y=FuncAddr(x,fun); 
    % FOR SOME PROBLEMS y MAY BE NAN HENCE LARGE VALUE IS SET 
    % THIS IS DONE FOLLOWING Elsayed SM Sarker RA Essam DL "GA with a New Multi-Parent Crossover for
    % Solving IEEE-CEC2011 Competition Problems" 2011;
    if isnan(y) ==1
        y=30e30;
    end
return