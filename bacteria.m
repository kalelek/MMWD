classdef bacteria
   properties (Access = private)
      binary %macierz binarna
      types % n elementów typy samochodów
      n %max liczba samochodów
      m % liczba zadań
   end
   properties 
      bin
   end
   methods
       function b=bacteria(n1,m1)
          b.n=n1;
          b.m=m1;
          b.binary = rand(b.n,b.m);
          b.types = rand(b.n,1);
          b.bin=33;
       end
       function types = get_types(b)
           types = b.types;
       end
   end
end