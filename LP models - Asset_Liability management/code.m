%%%% Arthor: Eunice Ofori-Addo

function Project_in_class_Opt_linear_ALM

%class2 work on asset liability management


% creating optimization variables

x1 = optimvar('x1', 'LowerBound',0,'UpperBound',100);
x2 = optimvar('x2', 'LowerBound',0,'UpperBound',100);
x3 = optimvar('x3', 'LowerBound',0,'UpperBound',100);
x4 = optimvar('x4', 'LowerBound',0,'UpperBound',100);
x5 = optimvar('x5', 'LowerBound',0,'UpperBound',100);

y1 = optimvar('y1', 'LowerBound',0, 'UpperBound', inf);
y2 = optimvar('y2', 'LowerBound',0, 'UpperBound', inf);
y3 = optimvar('y3', 'LowerBound',0, 'UpperBound', inf);

z1 = optimvar('z1', 'LowerBound', 0, 'UpperBound', inf);
z2 = optimvar('z2', 'LowerBound', 0, 'UpperBound', inf);
z3 = optimvar('z3', 'LowerBound', 0, 'UpperBound', inf);
z4 = optimvar('z4', 'LowerBound', 0, 'UpperBound', inf);
z5 = optimvar('z5', 'LowerBound', 0, 'UpperBound', inf);



v = optimvar('v', 'LowerBound', 0, 'UpperBound', inf);


prob = optimproblem('Objective', v, 'ObjectiveSense','maximize');

% Optimization constraints

prob.Constraints.c1 = x1 + y1 - z1 == 150;
prob.Constraints.c2 = x2 + y2 - 1.01*x1 + 1.003*z1 - z2 == 100;
prob.Constraints.c3 = x3 + y3 - 1.01*x2 + 1.003*z2 - z3 == -200;
prob.Constraints.c4 = x4 - 1.02*y1 - 1.01*x3 + 1.003*z3 - z4 == 200;
prob.Constraints.c5 = x5 - 1.02*y2 - 1.01*x4 + 1.003*z4 - z5 == -50;
prob.Constraints.c6 = -1.02*y3 - 1.01*x5 + 1.003*z5 - v == -300;


% Writing optimization problem in matrix form before passing to linprog
% function

problem = prob2struct(prob);


% Solving the optimization problem

[sol, fval, exitflag, output] = linprog(problem)

end



