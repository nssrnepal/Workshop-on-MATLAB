%% MATLAB Conditional Statements: Complete Guide

clc; clear; close all;

%% What are Conditional Statements?
% Conditional statements allow you to control the flow of your program by executing 
% different code blocks based on whether certain conditions are true or false.
% They are fundamental to creating flexible, decision-making programs.

%% 1. IF Statements
% Syntax: 
%   if condition
%       statements
%   end

fprintf('=== IF STATEMENT EXAMPLES ===\n');

% Example 1: Basic if statement
fprintf('Basic if statement:\n');
x = 10;
if x > 5
    fprintf('x is greater than 5\n');
end
fprintf('\n');

% Example 2: If-else statement
% Syntax:
%   if condition
%       statements
%   else
%       statements
%   end
fprintf('If-else statement:\n');
temperature = 25;
if temperature > 30
    fprintf('It''s hot outside\n');
else
    fprintf('It''s not hot outside\n');
end
fprintf('\n');

% Example 3: If-elseif-else statement
% Syntax:
%   if condition1
%       statements
%   elseif condition2
%       statements
%   else
%       statements
%   end
fprintf('If-elseif-else statement:\n');
score = 85;
if score >= 90
    fprintf('Grade: A\n');
elseif score >= 80
    fprintf('Grade: B\n');
elseif score >= 70
    fprintf('Grade: C\n');
elseif score >= 60
    fprintf('Grade: D\n');
else
    fprintf('Grade: F\n');
end
fprintf('\n');

% Example 4: Nested if statements
fprintf('Nested if statements:\n');
age = 25;
hasLicense = true;

if age >= 18
    fprintf('You are old enough to drive\n');
    if hasLicense
        fprintf('And you have a license - you can drive!\n');
    else
        fprintf('But you need a license to drive legally\n');
    end
else
    fprintf('You are too young to drive\n');
end
fprintf('\n');

%% 2. SWITCH Statements
% Syntax:
%   switch expression
%       case caseExpression1
%           statements
%       case caseExpression2
%           statements
%       ...
%       otherwise
%           statements
%   end

fprintf('=== SWITCH STATEMENT EXAMPLES ===\n');

% Example 1: Basic switch statement
fprintf('Basic switch statement:\n');
day = 'Wednesday';
switch day
    case 'Monday'
        fprintf('Start of the work week\n');
    case 'Tuesday'
        fprintf('Second day of the week\n');
    case 'Wednesday'
        fprintf('Middle of the week\n');
    case 'Thursday'
        fprintf('Almost Friday\n');
    case 'Friday'
        fprintf('Weekend is near\n');
    otherwise
        fprintf('Weekend!\n');
end
fprintf('\n');

% Example 2: Switch with multiple cases
fprintf('Switch with multiple cases:\n');
month = 'Feb';
switch month
    case {'Jan', 'Mar', 'May', 'Jul', 'Aug', 'Oct', 'Dec'}
        fprintf('31 days\n');
    case {'Apr', 'Jun', 'Sep', 'Nov'}
        fprintf('30 days\n');
    case 'Feb'
        fprintf('28 or 29 days\n');
    otherwise
        fprintf('Invalid month\n');
end
fprintf('\n');

%% 3. Conditional Loops (WHILE loops with conditions)
% What are Conditional Loops?
% Conditional loops repeatedly execute a block of code as long as a specified 
% condition remains true. The condition is evaluated before each iteration.

fprintf('=== CONDITIONAL LOOP EXAMPLES ===\n');

% Example 1: Basic while loop (conditional loop)
fprintf('Basic while loop (conditional loop):\n');
counter = 1;
while counter <= 5
    fprintf('Counter: %d\n', counter);
    counter = counter + 1;
end
fprintf('\n');

% Example 2: While loop with complex condition
fprintf('While loop with complex condition:\n');
x = 10;
y = 1;
while x > 0 && y < 20
    fprintf('x: %d, y: %d\n', x, y);
    x = x - 1;
    y = y + 2;
end
fprintf('\n');

% Example 3: Using break in a conditional loop
fprintf('Using break in a conditional loop:\n');
value = 0;
while true  % Infinite loop
    value = value + 1;
    if value > 10
        fprintf('Breaking at value = %d\n', value);
        break;  % Exit the loop
    end
    fprintf('Current value: %d\n', value);
end
fprintf('\n');

% Example 4: Using continue in a conditional loop
fprintf('Using continue in a conditional loop:\n');
num = 0;
while num < 10
    num = num + 1;
    if mod(num, 2) == 0  % If number is even
        continue;        % Skip to next iteration
    end
    fprintf('Odd number: %d\n', num);
end
fprintf('\n');



%% This is additional code, you can practice it yourself.
%% 4. Conditional Expressions
% MATLAB provides various operators for creating conditional expressions

fprintf('=== CONDITIONAL EXPRESSION EXAMPLES ===\n');

% Comparison operators: ==, ~=, <, >, <=, >=
fprintf('Comparison operators:\n');
a = 5;
b = 10;
fprintf('a = %d, b = %d\n', a, b);
fprintf('a == b: %d\n', a == b);
fprintf('a ~= b: %d\n', a ~= b);
fprintf('a < b: %d\n', a < b);
fprintf('a > b: %d\n', a > b);
fprintf('a <= b: %d\n', a <= b);
fprintf('a >= b: %d\n', a >= b);
fprintf('\n');

% Logical operators: && (AND), || (OR), ~ (NOT)
fprintf('Logical operators:\n');
x = 5;
y = 10;
z = 15;
fprintf('x < y && y < z: %d\n', x < y && y < z);
fprintf('x > y || y < z: %d\n', x > y || y < z);
fprintf('~(x < y): %d\n', ~(x < y));
fprintf('\n');

% Ternary-like operation using conditional expressions
fprintf('Ternary-like operation:\n');
age = 20;
status = 'Adult';
if age < 18
    status = 'Minor';
end
fprintf('Age %d: %s\n', age, status);

% Alternative using conditional assignment
status = ternary(age < 18, 'Minor', 'Adult');
fprintf('Age %d: %s\n', age, status);
fprintf('\n');

%% 5. Practical Applications

fprintf('=== PRACTICAL APPLICATIONS ===\n');

% Example 1: Input validation
fprintf('Input validation example:\n');
userInput = 150;  % Simulated user input
if isnumeric(userInput) && userInput >= 0 && userInput <= 100
    fprintf('Valid input: %d\n', userInput);
else
    fprintf('Invalid input! Must be between 0 and 100\n');
end
fprintf('\n');

% Example 2: Error handling with try-catch
fprintf('Error handling with try-catch:\n');
try
    % This will cause an error
    result = 10 / 0;
    fprintf('Result: %.2f\n', result);
catch ME
    fprintf('Error occurred: %s\n', ME.message);
end
fprintf('\n');

% Example 3: Menu-driven program
fprintf('Menu-driven program example:\n');
choice = 2;  % Simulated user choice
switch choice
    case 1
        fprintf('You selected: Create new file\n');
    case 2
        fprintf('You selected: Open file\n');
    case 3
        fprintf('You selected: Save file\n');
    case 4
        fprintf('You selected: Exit\n');
    otherwise
        fprintf('Invalid choice!\n');
end
fprintf('\n');

% Example 4: Conditional plotting
fprintf('Conditional plotting example:\n');
x = 0:0.1:10;
y = sin(x);

% Plot with different colors based on condition
figure('Name', 'Conditional Plotting');
hold on;
for i = 1:length(y)
    if y(i) > 0
        plot(x(i), y(i), 'go', 'MarkerSize', 5);
    else
        plot(x(i), y(i), 'ro', 'MarkerSize', 5);
    end
end
title('Sine Wave with Conditional Coloring');
xlabel('x');
ylabel('sin(x)');
legend('Positive values', 'Negative values');
grid on;
fprintf('Conditional plot created. Check Figure window.\n\n');

%% 6. Advanced Conditional Techniques

fprintf('=== ADVANCED CONDITIONAL TECHNIQUES ===\n');

% Example 1: Short-circuit evaluation
fprintf('Short-circuit evaluation:\n');
x = 10;
y = 0;
% Using && (short-circuit AND) - second condition not evaluated if first is false
if (y ~= 0) && (x/y > 2)
    fprintf('x/y is greater than 2\n');
else
    fprintf('Short-circuit prevented division by zero\n');
end
fprintf('\n');

% Example 2: Using any() and all() with arrays
fprintf('Using any() and all() with arrays:\n');
A = [1, 0, 1, 0, 1];
B = [5, 5, 5, 5, 5];
fprintf('Array A: %s\n', mat2str(A));
fprintf('any(A): %d (any element is true)\n', any(A));
fprintf('all(A): %d (all elements are true)\n', all(A));
fprintf('any(B > 3): %d (any element > 3)\n', any(B > 3));
fprintf('all(B > 3): %d (all elements > 3)\n', all(B > 3));
fprintf('\n');

% Example 3: Conditional function execution
fprintf('Conditional function execution:\n');
data = [1, 2, 3, 4, 5];
processData(data, 'mean');  % Process with mean
processData(data, 'sum');   % Process with sum
processData(data, 'invalid'); % Invalid operation
fprintf('\n');