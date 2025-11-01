function tests = testTransInv
tests = functiontests(localfunctions);
end

function test_Identity(testCase)
T = eye(4);
actual = ECE569_TransInv(T);
expected = eye(4);
verifyEqual(testCase,actual,expected,'AbsTol', 1e-3);
end

function test_Nonidentity(testCase)
T = [[1, 0, 0, 0]; [0, 0, -1, 0]; [0, 1, 0, 3]; [0, 0, 0, 1]];
actual = ECE569_TransInv(T);
expected = [
    1     0     0     0;
    0     0     1    -3;
    0    -1     0     0;
    0     0     0     1];
verifyEqual(testCase,actual,expected,'AbsTol', 1e-3);
end