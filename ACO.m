clear all
close all
clc

[ graph ]  = createGraph();


figure 
set(gcf, 'position', [ 13   435   923   420])
subplot(1,3,1)
drawGraph( graph); 

maxIter = 50;
antNo = 50;

tau0 = 10 * 1 / (  graph.n * mean( graph.edges(:)  )  );  

tau = tau0 * ones( graph.n , graph.n);
eta = 1./ graph.edges;

rho = 0.1;
alpha = 1; 
beta = 5;




bestFitness = inf;
bestTour = [];
for t = 1 : maxIter
   
    
    colony = [];
    colony = createColony( graph, colony , antNo, tau, eta, alpha,  beta);
    
    
  
    for i = 1 : antNo 
        colony.ant(i).fitness = fitnessFunction(colony.ant(i).tour , graph );
    end
    

    allAntsFitness = [ colony.ant(:).fitness ];
    [ minVal , minIndex ] = min( allAntsFitness );
    if minVal < bestFitness 
        bestFitness = colony.ant(minIndex).fitness;
        bestTour = colony.ant(minIndex).tour;
    end
    
    colony.queen.tour = bestTour;
    colony.queen.fitness = bestFitness;

    tau = updatePhromone( tau , colony );  
    
    tau  = ( 1 - rho ) .* tau;
       
    outmsg = [ 'Iteration #' , num2str(t) , ' Shortest length = ' , num2str(colony.queen.fitness)  ];
    disp(outmsg)
    subplot(1,3,1)
    title(['Iteration #' , num2str(t) ])
 
    subplot(1,3,2)
    cla
    drawBestTour( colony, graph );
    
    
    subplot(1,3,3)
    cla
    drawPhromone( tau , graph );
   
   drawnow
end









