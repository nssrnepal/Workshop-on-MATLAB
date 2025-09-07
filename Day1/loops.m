%% MATLAB Loops
% A loop is a programming construct that repeats a block of code multiple times until a condition is met.
%Loops are useful for tasks like iterating over arrays, performing calculations repeatedly, or automating repetitive work.
%MATLAB supports two main loops:
        %for loop – repeats a block of code a fixed number of times.
        %while loop – repeats a block of code as long as a condition is true.
clc; clear; close all;
%% 1. FOR Loops
% Syntax: for index = values
%            statements
%         end

fprintf('=== FOR LOOP EXAMPLES ===\n');
%%
% Example 1: Basic for loop with numeric range
% Iterates from 1 to 5 with default step of 1
fprintf('Basic for loop (1 to 5):\n');
for i = 1:5
    fprintf('Iteration %d\n', i);
end
fprintf('\n');
%%
% Example 2: For loop with custom step
% Iterates from 0 to 10 with step of 2
fprintf('For loop with step of 2 (0 to 10):\n');
for i = 0:2:10
    fprintf('Value: %d\n', i);
end
fprintf('\n');
%%
% Example 3: For loop with decreasing values
% Iterates from 10 to 1 with step of -1
fprintf('For loop with decreasing values (10 to 1):\n');
for i = 10:-1:1
    fprintf('Countdown: %d\n', i);
end
fprintf('\n');
%%
% Example 4: For loop with array elements
% Iterates through each element of an array
fprintf('For loop with array elements:\n');
colors = ['red', 'green', 'blue', 'yellow'];
for color = colors
    fprintf('Color: %s\n', color);
end
fprintf('\n');
%%
% Example 5: Nested for loops
% Creates a multiplication table
fprintf('Nested for loops (multiplication table):\n');
for i = 1:3
    for j = 1:3
        fprintf('%d x %d = %d\t', i, j, i*j);
    end
    fprintf('\n');
end
fprintf('\n');

%% 2. WHILE Loops
% Syntax: while condition
%            statements
%         end

fprintf('=== WHILE LOOP EXAMPLES ===\n');

% Example 1: Basic while loop
% Executes until condition becomes false
fprintf('Basic while loop (count to 5):\n');
count = 1;
while count <= 5
    fprintf('Count: %d\n', count);
    count = count + 1;
end
fprintf('\n');

% Example 2: While loop with break statement
% Exits loop when condition is met
fprintf('While loop with break statement:\n');
num = 0;
while true
    num = num + 1;
    if num > 5
        fprintf('Breaking at num = %d\n', num);
        break;  % Exit the loop
    end
    fprintf('Current num: %d\n', num);
end
fprintf('\n');

% Example 3: While loop with continue statement
% Skips current iteration when condition is met
fprintf('While loop with continue statement (skip even numbers):\n');
num = 0;
while num < 10
    num = num + 1;
    if mod(num, 2) == 0  % If number is even
        continue;        % Skip to next iteration
    end
    fprintf('Odd number: %d\n', num);
end
fprintf('\n');

%% 3. Loop Control Statements
% break    - Exit the loop
% continue - Skip to next iteration
% return   - Exit the function

fprintf('=== LOOP CONTROL EXAMPLES ===\n');

% Example: Using break and continue in a for loop
fprintf('Break and continue in a for loop:\n');
for i = 1:10
    if i == 8
        fprintf('Breaking at i = %d\n', i);
        break;
    end
    if mod(i, 2) == 0
        continue;
    end
    fprintf('Processing odd number: %d\n', i);
end
fprintf('\n');

%% 4. Practical Applications of Loops

fprintf('=== PRACTICAL LOOP APPLICATIONS ===\n');

% Example 1: Summing elements in an array
fprintf('Summing array elements with a for loop:\n');
data = [12, 45, 23, 67, 89, 34];
total = 0;
for i = 1:length(data)
    total = total + data(i);
end
fprintf('Sum of [12, 45, 23, 67, 89, 34] = %d\n', total);
fprintf('\n');

% Example 2: Finding maximum value in an array
fprintf('Finding maximum value with a for loop:\n');
values = [3, 7, 2, 9, 5, 1];
max_val = values(1);
for i = 2:length(values)
    if values(i) > max_val
        max_val = values(i);
    end
end
fprintf('Maximum value in [3, 7, 2, 9, 5, 1] = %d\n', max_val);
fprintf('\n');

% Example 3: Processing matrix elements with nested loops
fprintf('Processing matrix elements with nested loops:\n');
matrix = [1, 2, 3; 4, 5, 6; 7, 8, 9];
[row, col] = size(matrix);
for i = 1:row
    for j = 1:col
        fprintf('Element (%d,%d) = %d\n', i, j, matrix(i,j));
    end
end
fprintf('\n');

% Example 4: While loop for iterative calculation
fprintf('While loop for iterative calculation (square root):\n');
x = 25;      % Number to find square root of
guess = x/2; % Initial guess
tolerance = 1e-6;
iterations = 0;

while abs(guess^2 - x) > tolerance
    guess = (guess + x/guess) / 2;
    iterations = iterations + 1;
    fprintf('Iteration %d: guess = %.6f\n', iterations, guess);
end
fprintf('Square root of %d ≈ %.6f (in %d iterations)\n', x, guess, iterations);
fprintf('\n');

%% 5. Vectorization vs. Loops
% MATLAB is optimized for vectorized operations, which are often faster than loops

fprintf('=== VECTORIZATION VS LOOPS ===\n');

% Create a large array
largeArray = 1:100000;

% Method 1: Using a loop (slower)
fprintf('Timing loop method...\n');
tic;
result_loop = zeros(size(largeArray));
for i = 1:length(largeArray)
    result_loop(i) = largeArray(i)^2;
end
time_loop = toc;
fprintf('Loop method: %.4f seconds\n', time_loop);

% Method 2: Using vectorization (faster)
fprintf('Timing vectorization method...\n');
tic;
result_vectorized = largeArray.^2;
time_vectorized = toc;
fprintf('Vectorization method: %.4f seconds\n', time_vectorized);

fprintf('Vectorization is %.1f times faster\n', time_loop/time_vectorized);
fprintf('\n');

%% 6. Common Loop Patterns

fprintf('=== COMMON LOOP PATTERNS ===\n');

% Pattern 1: Iterating through cell arrays
fprintf('Iterating through cell arrays:\n');
cellArray = {'apple', 'banana', 'cherry', 'date'};
for i = 1:length(cellArray)
    fprintf('Fruit %d: %s\n', i, cellArray{i});
end
fprintf('\n');

% Pattern 2: Iterating through structure arrays
fprintf('Iterating through structure arrays:\n');
students(1).name = 'Alice';
students(1).grade = 95;
students(2).name = 'Bob';
students(2).grade = 87;
students(3).name = 'Charlie';
students(3).grade = 92;

for i = 1:length(students)
    fprintf('Student: %s, Grade: %d\n', students(i).name, students(i).grade);
end
fprintf('\n');

% Pattern 3: Conditional loop execution
fprintf('Conditional loop execution:\n');
numbers = [4, 7, 2, 9, 5, 12, 8];
threshold = 6;
fprintf('Numbers greater than %d: ', threshold);
for num = numbers
    if num > threshold
        fprintf('%d ', num);
    end
end
fprintf('\n\n');

%% 7. Loop Optimization Tips

fprintf('=== LOOP OPTIMIZATION TIPS ===\n');
fprintf('1. Preallocate arrays before loops to improve performance\n');
fprintf('2. Use vectorized operations instead of loops when possible\n');
fprintf('3. Move invariant code outside of loops\n');
fprintf('4. Avoid using loops for simple element-wise operations\n');
fprintf('5. Use parfor for parallel processing when appropriate\n');

% Example of preallocation
fprintf('\nExample of preallocation:\n');
n = 10000;
fprintf('Creating an array of %d elements...\n', n);

% Without preallocation (slower)
tic;
slowArray = [];
for i = 1:n
    slowArray(i) = i^2;
end
time_no_prealloc = toc;

% With preallocation (faster)
tic;
fastArray = zeros(1, n);
for i = 1:n
    fastArray(i) = i^2;
end
time_prealloc = toc;

fprintf('Without preallocation: %.4f seconds\n', time_no_prealloc);
fprintf('With preallocation: %.4f seconds\n', time_prealloc);
fprintf('Preallocation is %.1f times faster\n', time_no_prealloc/time_prealloc);

fprintf('\n=== END OF LOOP GUIDE ===\n');