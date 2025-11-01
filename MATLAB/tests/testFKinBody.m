function tests = testFKinBody
tests = functiontests(localfunctions);
end

function test_3(testCase)
M = [[-1, 0, 0, 0]; [0, 1, 0, 6]; [0, 0, -1, 2]; [0, 0, 0, 1]];
Blist = [[0; 0; -1; 2; 0; 0], [0; 0; 0; 0; 1; 0], [0; 0; 1; 0; 0; 0.1]];
thetalist = [pi / 2; 3; pi];
actual = ECE569_FKinBody(M, Blist, thetalist);
expected = [
  -0.0000    1.0000         0   -5.0000;
   1.0000    0.0000         0    4.0000;
        0         0   -1.0000    1.6858;
        0         0         0    1.0000];
verifyEqual(testCase,actual,expected,'AbsTol', 1e-2);
end

function test_6(testCase)
M =    [
    -1.0000         0         0    0.4567;
     0         0    1.0000    0.2232;
     0    1.0000         0    0.0665;
     0         0         0    1.0000];
Blist = [
    0         0         0         0         0         0;
    1.0000         0         0         0   -1.0000         0;
         0    1.0000    1.0000    1.0000         0    1.0000;
    0.2232    0.0854    0.0854    0.0854   -0.0921         0;
         0   -0.4567   -0.2132         0         0         0;
    0.4567         0         0         0         0         0];
thetalist = [-1.6800   -1.4018   -1.8127   -2.9937   -0.8857   -0.0696]';
actual = ECE569_FKinBody(M, Blist, thetalist);
expected = [
   -0.6987   -0.0569    0.7131    0.2154;
    0.7151   -0.0248    0.6986    0.2271;
   -0.0221    0.9981    0.0580    0.2966;
         0         0         0    1.0000];
verifyEqual(testCase,actual,expected,'AbsTol', 1e-2);
end


