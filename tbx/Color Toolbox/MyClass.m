classdef MyClass
%MyClass This class contains methods for performing simple arithmetics. 
%
%  Copyright 2016-2017 The MathWorks, Inc.

   properties
      Value = [2 4]
   end
   
   methods
       
      function r = addTwo( obj )
         r = obj.Value + 2;
      end
      
      function r = timesTwo( obj )
         r = obj.Value * 2;
      end
      
   end %public
   
end %MyClass