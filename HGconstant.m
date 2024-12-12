
function G=HGconstant(iteration,max_it)

G = 100*logsig((0.5*max_it - iteration)/100);