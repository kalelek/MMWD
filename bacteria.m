classdef bacteria < matlab.mixin.SetGet % because of it we can use get(obj_h,'binary')
   properties %(Access = private)
      binary %mbinary matrix
      types % n cars, value = type
      n %max number of cars
      m % number of tasks
      cost % value of objective function
   end
% can use properties, properties(Const) - read-only
   methods
       function obj=bacteria(varargin)
           %% Generates bacteria of size n1 x m1, binary matrix has random expected value of zeros (rand(1))
           % or creates object using data_matrix, functionality used by
           % crossover function
          if nargin==2
              obj.n=varargin{1};
              obj.m=varargin{2};
              obj.binary = bacteria.zero_with_prob(rand(1),obj.n,obj.m);
              %TODO car_types
              obj.types = ceil(11*rand(obj.n,1)-1);%example from 0 to 10, equal probabilities
              obj.cost=bacteria.objective_function(obj.binary,obj.types);
          elseif nargin == 1
              data_matrix = varargin{1};
              obj.n=size(data_matrix,1);
              obj.m=size(data_matrix,2)-1;
              obj.binary = data_matrix(:,2:end);
              %TODO car_types
              obj.types = data_matrix(:,1);%example from 0 to 10, equal probabilities
              obj.cost=bacteria.objective_function(data_matrix(:,2:end),data_matrix(:,1));
          else
              disp('What the fuck? You can send to constructor 2 int or one matrix.');
          end
       end 
       function dm = data_matrix(obj)
          %returns one matrix which visualises the object
          dm = [obj.types obj.binary]; 
       end
       function mutatate(obj)
           %% Mutates one element in data_matrix, which is equivalent to 
           % mutating one element in types or binary
           % works every time, so if we should use it with some set
           % probability. 
          n = ceil(obj.n*rand(1));
          m = floor((1+obj.m)*rand(1));
          if m==0
              %TODO draw according to car_types
              obj.types(n) = ceil(11*rand(1)-1);
          else
             obj.binary(n,m) = ~ obj.binary(n,m); 
          end
       end
       %% Get, Set functions
       function types = get.types(obj)
           types = obj.types;
       end
       function binary = get.binary(obj)
          binary = obj.binary; 
       end
       function n = get.n(obj)
          n = obj.n; 
       end
       function m = get.m(obj)
          m = obj.m; 
       end
       
   end
   methods (Static)
       function x = zero_with_prob(prob,n,m)
          % returns 0 with p=prob and 1 with p=1-prob
          x = rand(n,m);
          x_plus = 0.5 - prob;
          x = round(x+x_plus);
       end
       %% objective function
       function   value=objective_function(binary_matrix,car_types)
           global car_matrix;
           global task_matrix;
           value=0;
           row=size(binary_matrix,1); 
           col=size(binary_matrix,2); 
           max_row=max(binary_matrix,[],2);% max value in row
           for i=1:row %car cost
               if max_row(i)>0
                  car=car_types(i)
                  if car~=0
                      value=value+car_matrix(2,car); %add car cost
                  end
               end
           end
           for i=1:row
               for j=1:col
                  if binary_matrix(i,j)==1
                      car=car_types(i)
                      if car~=0
                         value=value+car_matrix(3,car)*task_matrix(1,j); %add cost of the road
                      end
                  end
               end
            end
       end
   end
   
end