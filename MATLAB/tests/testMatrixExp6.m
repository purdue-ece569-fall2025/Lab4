function tests = testMatrixExp6
tests = functiontests(localfunctions);
end


function test_Zero(testCase)
se3mat = [0 0 0 1; 0 0 0 2; 0 0 0 3; 0 0 0 0];
actual = ECE569_MatrixExp6(se3mat);
expected = [1 0 0 1; 0 1 0 2; 0 0 1 3; 0 0 0 1];
verifyEqual(testCase,actual,expected,'AbsTol', 1e-3);
end

function test_Nonzero(testCase)
se3mat = [ 0,      0,       0,      0;
         0,      0, -1.5708, 2.3562;
         0, 1.5708,       0, 2.3562;
         0,      0,       0,      0];
actual = ECE569_MatrixExp6(se3mat);
expected =  [1.0000         0         0         0;
        0    0.0000   -1.0000   -0.0000;
        0    1.0000    0.0000    3.0000;
        0         0         0    1.0000];
verifyEqual(testCase,actual,expected,'AbsTol', 1e-3);
end