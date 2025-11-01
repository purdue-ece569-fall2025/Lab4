function tests = testMatrixLog6
tests = functiontests(localfunctions);
end

function test_Identity(testCase)
T = eye(4);
actual = ECE569_MatrixLog6(T);
expected =  zeros(4);
verifyEqual(testCase,actual,expected,'AbsTol', 1e-3);
end
   
function test_NonIdentity(testCase)
T = [[1, 0, 0, 0]; [0, 0, -1, 0]; [0, 1, 0, 3]; [0, 0, 0, 1]];
actual = ECE569_MatrixLog6(T);
expected =  [0         0         0         0
        0         0   -1.5708    2.3562
        0    1.5708         0    2.3562
        0         0         0         0];
verifyEqual(testCase,actual,expected,'AbsTol', 1e-3);
end