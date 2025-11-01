function tests = testAdjoint
tests = functiontests(localfunctions);
end

function test_Nonzero(testCase)
T = [[1, 0, 0, 0]; [0, 0, -1, 0]; [0, 1, 0, 3]; [0, 0, 0, 1]];
actual = ECE569_Adjoint(T);
expected = [    1     0     0     0     0     0;
    0     0    -1     0     0     0;
    0     1     0     0     0     0;
    0     0     3     1     0     0;
    3     0     0     0     0    -1;
    0     0     0     0     1     0];
verifyEqual(testCase,actual,expected,'AbsTol', 1e-3);
end