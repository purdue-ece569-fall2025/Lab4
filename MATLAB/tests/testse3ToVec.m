function tests = testse3ToVec
tests = functiontests(localfunctions);
end

function test_Nonzero(testCase)
se3mat = [0    -3     2     4;
     3     0    -1     5;
    -2     1     0     6;
     0     0     0     0];
actual = ECE569_se3ToVec(se3mat);
expected = [1 2 3 4 5 6]';
verifyEqual(testCase,actual,expected,'AbsTol', 1e-3);
end