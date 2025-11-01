function tests = testIKinBody
tests = functiontests(localfunctions);
end

function test_3(testCase)
Blist = [[0; 0; -1; 2; 0; 0], [0; 0; 0; 0; 1; 0], [0; 0; 1; 0; 0; 0.1]];
M = [[-1, 0, 0, 0]; [0, 1, 0, 6]; [0, 0, -1, 2]; [0, 0, 0, 1]];
T = [[0, 1, 0, -5]; [1, 0, 0, 4]; [0, 0, -1, 1.6858]; [0, 0, 0, 1]];
thetalist0 = [1.5; 2.5; 3];
eomg = 0.01;
ev = 0.001;
[actualTheta, actualSuccess] = ECE569_IKinBody(Blist, M, T, thetalist0, eomg, ev);
expectedTheta = [1.5707 2.9997 3.1415]';
expectedSuccess = true;
verifyEqual(testCase,actualTheta,expectedTheta,'AbsTol', 1e-3);
verifyEqual(testCase,actualSuccess,expectedSuccess,'AbsTol', 1e-3);
end

function test_6(testCase)
Blist = [
     0         0         0         0         0         0;
1.0000         0         0         0   -1.0000         0;
     0    1.0000    1.0000    1.0000         0    1.0000;
0.2232    0.0854    0.0854    0.0854   -0.0921         0;
     0   -0.4567   -0.2132         0         0         0;
0.4567         0         0         0         0         0];
M =    [
    -1.0000         0         0    0.4567;
     0         0    1.0000    0.2232;
     0    1.0000         0    0.0665;
     0         0         0    1.0000];
T = [
-0.6987   -0.0569    0.7131    0.2154;
0.7151   -0.0248    0.6986    0.2271;
-0.0221    0.9981    0.0580    0.2966;
     0         0         0    1.0000];
thetalist0 = [-1.6800 -1.4018 -1.8127 -2.9937 -0.8857 -0.0696]' + 0.1;
[actualTheta, actualSuccess] = ECE569_IKinBody(Blist, M, T, thetalist0, 1e-6, 1e-6);
expectedTheta = [-1.6800 -1.4018 -1.8127 -2.9937 -0.8857 -0.0696]';
expectedSuccess = true;
verifyEqual(testCase,actualTheta,expectedTheta,'AbsTol', 1e-3);
verifyEqual(testCase,actualSuccess,expectedSuccess,'AbsTol', 1e-3);
end


