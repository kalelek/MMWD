classdef bacteria < matlab.mixin.SetGet % because of it we can use get(obj_h,'binary')
   properties %(Access = private)
      binary %mbinary matrix
      types % n cars, value = type
      n %max number of cars
      m % number of tasks
   end
% can use properties, properties(Const) - read-only
   methods
       function obj=bacteria(n1,m1)
           %% Generates bacteria of size n1 x m1, binary matrix has random expected value of zeros (rand(1)) 
          obj.n=n1;
          obj.m=m1;
          obj.binary = bacteria.zero_with_prob(rand(1),n1,m1);
          %TODO car_types
          obj.types = ceil(11*rand(obj.n,1)-1);%example from 0 to 10, equal probabilities
       end 
       function dm = data_matrix(obj)
          %returns one matrix which visualises the object
          dm = [obj.types obj.binary]; 
       end
       %% Get, Set functions
       function types = get.types(obj)
           types = obj.types;
       end
       function binary = get.binary(obj)
          binary = obj.binary; 
       end
      
   end
   methods (Static)
       function x = zero_with_prob(prob,n,m)
          % returns 0 with p=prob and 1 with p=1-prob
          x = rand(n,m);
          x_plus = 0.5 - prob;
          x = round(x+x_plus);
       end
       
   end
end