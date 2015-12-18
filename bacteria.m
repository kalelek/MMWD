classdef bacteria < matlab.mixin.SetGet % because of it we can use get(obj_h,'binary')
   properties %(Access = private)
      binary %binary matrix
      types % n cars, value = type
      n %max number of cars
      m % number of tasks
      cost % value of objective function
      restrictions=0; % if restrictions are not met then restrictions=1
   end
% can use properties, properties(Const) - read-only
    properties (Constant)
        max_time=12;
    end
   methods
       function obj=bacteria(varargin)
           %% Generates bacteria of size n1 x m1, binary matrix has random expected amount of zeros (rand(1))
           % or creates object using data_matrix, functionality used by
           % crossover function
          if nargin==2
              obj.n=varargin{1};
              obj.m=varargin{2};
              obj.zero_with_prob(rand(1));
              obj.types = ceil(11*rand(obj.n,1))-1;   % Random types from 0 to 10
              obj.objective_function();
          elseif nargin == 1
              data_matrix = varargin{1};
              obj.n=size(data_matrix,1);
              obj.m=size(data_matrix,2)-1;
              obj.binary = data_matrix(:,2:end);
              obj.types = data_matrix(:,1);%example from 0 to 10, equal probabilities
              obj.objective_function();
          elseif nargin==0  % Every class should have default constructor
              obj.n=30;     % Size may be changed with some global variable
              obj.m=7;
              obj.zero_with_prob(rand(1));
              obj.types = ceil(11*rand(obj.n,1))-1;
              obj.objective_function();
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
          row = ceil(obj.n*rand(1));
          col = floor((1+obj.m)*rand(1));
          if col==0
              obj.types(row) = ceil(11*rand(1))-1;
          else
              obj.binary(row,col) = ~ obj.binary(row,col); 
          end
          obj.objective_function();
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
       
       function zero_with_prob(obj,prob)
          % returns 0 with p=prob and 1 with p=1-prob
          obj.binary=rand(obj.n,obj.m);
          binary_plus = 0.5 - prob;
          obj.binary = round(obj.binary+binary_plus);
       end
       
       function value = objective_test(obj)
        % objective function used for tests
          dm = obj.data_matrix();
          value = sum(sum(abs(dm - [ones(obj.n,1) eye(obj.n,obj.m)])));
       end
       
        %% objective function
       function objective_function(obj)% binary, types
           global task_matrix;
           global car_matrix;
           value=0;
           penalty=0;
           max_row=max(obj.binary,[],2);% max value in row
           for i=1:obj.n %car cost
               if max_row(i)>0 && obj.types(i)>0
                  value=value+car_matrix(2,obj.types(i)); %add car cost
               end
           end
           for i=1:obj.n
               time=0;
               for j=1:obj.m
                  if obj.binary(i,j)==1 && obj.types(i)>0
                      value=value+car_matrix(3,obj.types(i))*task_matrix(1,j); %add cost of the road
                      time=time+task_matrix(2,j);
                  end
               end
               if time > obj.max_time    % over 12h, default paramter 
                      penalty=penalty+10^6;
               end
           end
           for j=1:obj.m %col
               capacity=0;
               for i=1:obj.n %row
                  if obj.binary(i,j)>0 && obj.types(i)>0
                      capacity=capacity+car_matrix(4,obj.types(i));   %check index in car_matrix
                  end
               end
               if capacity<task_matrix(3,j) %check index in task_matrix
                  penalty=penalty+10^10; %first option: add a constant large number
               end
           end 
           obj.cost=penalty+value;
           if penalty>0
               obj.restrictions=1;
           end
       end 
   end   
end
