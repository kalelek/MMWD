classdef bacteria < matlab.mixin.SetGet % because of it we can use get(obj_h,'binary')
   properties %(Access = private)
      binary %mbinary matrix
      types % n cars, value = type
      n %max number of cars
      m % number of tasks
      cost % value of objective function
   end
% can use properties, properties(Const) - read-only
    properties (Constant)
        
    end
   methods
       function obj=bacteria(varargin)
           %% Generates bacteria of size n1 x m1, binary matrix has random expected value of zeros (rand(1))
           % or creates object using data_matrix, functionality used by
           % crossover function
          if nargin==2
              obj.n=varargin{1};
              obj.m=varargin{2};
              obj.binary = bacteria.zero_with_prob(rand(1),obj.n,obj.m);
              % TODO car_types
              obj.types = ceil(11*rand(obj.n,1)-1);%example from 0 to 10, equal probabilities
              % TODO substitute test
              %obj.cost = bacteria.objective_function(obj);
              obj.cost = bacteria.objective_test(obj);
          elseif nargin == 1
              data_matrix = varargin{1};
              obj.n=size(data_matrix,1);
              obj.m=size(data_matrix,2)-1;
              obj.binary = data_matrix(:,2:end);
              % TODO car_types
              obj.types = data_matrix(:,1);%example from 0 to 10, equal probabilities
              % TODO substitute test
              %obj.cost = bacteria.objective_function(obj);
              obj.cost = bacteria.objective_test(obj);
          else
              disp('What the fuck? You can send to constructor 2 int or one matrix.');
          end
       end 
       function dm = data_matrix(obj)
          %returns one matrix which visualises the object
          dm = [obj.types obj.binary]; 
       end
       function mutate(obj)
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
          % TODO substitute objective_test
          %obj.cost = bacteria.objective_function(obj);
          obj.cost = bacteria.objective_test(obj);
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
       function cost = get.cost(obj)
           cost = obj.cost;
       end
   end
   methods (Static,Access = private)
       function x = zero_with_prob(prob,n,m)
          % returns 0 with p=prob and 1 with p=1-prob
          x = rand(n,m);
          x_plus = 0.5 - prob;
          x = round(x+x_plus);
       end
       
       function value = objective_test(obj)
        % objective function used for tests
          dm = obj.data_matrix();
          n = get(obj,'n');
          m = get(obj,'m');
          value = sum(sum(abs(dm - [ones(n,1) eye(n,m)])));
           
       end
        %% objective function
       function   value=objective_function(obj)% binary, types
           global task_matrix;
           global car_matrix;
           value=0;
           row=size(obj.binary,1); 
           col=size(obj.binary,2); 
           max_row=max(obj.binary,[],2);% max value in row
           for i=1:row %car cost
               if max_row(i)>0 && obj.types(i)>0
                  value=value+car_matrix(2,obj.types(i)); %add car cost
               end
           end
           for i=1:row
               for j=1:col
                  if obj.binary(i,j)==1 && obj.types(i)>0
                      value=value+car_matrix(3,obj.types(i))*task_matrix(1,j); %add cost of the road
                      % car_matrix - col 
                      % task_matrix
                  end
               end
            end
       end
       
   end

   
end