% Parameters
d = 1; % Diameter of the pipe
l = 0.1; % Length of the pipe
c = 0.000005; % Constant for the pipe material
P0 = 99; % Initial guess for P

% Derived parameter
k = (c * d^2) / l;

% Define the functions
f = @(P) k * (100 - P)^(1/2); % f(P)
fp = @(P) k / (2 * (100 - P)^(1/2)); % f'(P)

% Newton's Method
tol = 1e-6; % Tolerance for convergence
max_iter = 100; % Maximum number of iterations
P = P0; % Initialize P
iter = 0;

while iter < max_iter
    % Update step
    P_new = P - f(P) / fp(P);
    
    % Check for convergence
    if abs(P_new - P) < tol
        break;
    end
    
    % Update variables
    P = P_new;
    iter = iter + 1;
end

% Display the result
if iter == max_iter
    fprintf('Newton''s method did not converge within the maximum iterations.\n');
else
    fprintf('Solution converged to P = %.6f after %d iterations.\n', P_new, iter);
end
