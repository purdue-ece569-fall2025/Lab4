function tests = testVecTose3
tests = functiontests(localfunctions);
end

function test_Nonzero(testCase)
xi = [1 2 3 4 5 6]';
actual = ECE569_VecTose3(xi);
expected = [0    -3     2     4;
     3     0    -1     5;
    -2     1     0     6;
     0     0     0     0];
verifyEqual(testCase,actual,expected,'AbsTol', 1e-3);
end