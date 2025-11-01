function tests = testJacobianBody
tests = functiontests(localfunctions);
end

function test_4(testCase)
Blist = [[0; 0; 1;   0; 0.2; 0.2], ...
       [1; 0; 0;   2;   0;   3], ...
       [0; 1; 0;   0;   2;   1], ...
       [1; 0; 0; 0.2; 0.3; 0.4]];
thetalist = [0.2; 1.1; 0.1; 1.2];
actual = ECE569_JacobianBody(Blist, thetalist);
expected = [
  -0.0453    0.9950         0    1.0000;
   0.7436    0.0930    0.3624         0;
  -0.6671    0.0362   -0.9320         0;
   2.3259    1.6681    0.5641    0.2000;
  -1.4432    2.9456    1.4331    0.3000;
  -2.0664    1.8288   -1.5887    0.4000];
verifyEqual(testCase,actual,expected,'AbsTol', 1e-3);
end

function test_6(testCase)
Blist = [
     0         0         0         0         0         0;
1.0000         0         0         0   -1.0000         0;
     0    1.0000    1.0000    1.0000         0    1.0000;
0.2232    0.0854    0.0854    0.0854   -0.0921         0;
     0   -0.4567   -0.2132         0         0         0;
0.4567         0         0         0         0         0];
thetalist = [-1.6800   -1.4018   -1.8127   -2.9937   -0.8857   -0.0696]';
actual = ECE569_JacobianBody(Blist, thetalist);
expected = [
   -0.0221   -0.7725   -0.7725   -0.7725    0.0695         0;
    0.9981   -0.0539   -0.0539   -0.0539   -0.9976         0;
    0.0580    0.6327    0.6327    0.6327         0    1.0000;
    0.3127   -0.0973    0.0541    0.0489   -0.0919         0;
    0.0076    0.2532    0.2866    0.0749   -0.0064         0;
   -0.0114   -0.0973    0.0905    0.0661         0         0];
verifyEqual(testCase,actual,expected,'AbsTol', 1e-3);
end