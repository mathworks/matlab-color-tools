classdef MyTest < matlab.unittest.TestCase
%MyTest Simple test case.
%
%  Copyright 2016-2017 The MathWorks, Inc.

    methods (Test)
        
        function test_myfunc( testCase )      
            %test_myfunc 
            
            act = myfunc(2);
            exp = 4;
            
            % Verify results
            testCase.verifyEqual( act, exp );
        
        end %test_myfunc
        
        function test_MyClass( testCase )
            %test_MyClass
            
            aObj = MyClass();
            aObj.Value = [3 9];
            
            % Test addTwo method
            act = addTwo( aObj );
            exp = [5 11];
            
            % Verify results
            testCase.verifyEqual( act, exp );
            
            % Test timesTwo method
            act = timesTwo( aObj );
            exp = [6 18];
            
            % Verify results
            testCase.verifyEqual( act, exp );

        end %test_MyClass
        
    end
    
end %MyTest