function [ graph ]  = createGraph()
%19
x = [ 930,1215,1316,-1010,1015,573,438,-256,-408,623,308,-152,-673,712,-1099,555,-630,917,222];
y = [ -505,825,910,1102,-1400,703,241,-110,312,-598,-107,252,1120,1345,1229,302,641,-542,-318];


  
  
graph.n = length(x); 

for i = 1 : graph.n
    graph.node(i).x = x(i);
    graph.node(i).y = y(i);
end

graph.edges = zeros(  graph.n , graph.n );

for i = 1 : graph.n
    for j = 1: graph.n
        x1 = graph.node(i).x ;
        x2 = graph.node(j).x;
        y1 = graph.node(i).y;
        y2 = graph.node(j).y;
        
        graph.edges(i,j) = sqrt(  (x1 - x2) ^2 + (y1 - y2)^2  ); 
        
    end
end


end