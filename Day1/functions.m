%% MATLAB Functions: Complete Beginner's Guide

clc; clear; close all;

%% What is a Function?
% A function is a block of code that performs a specific task. 
% Functions help organize code, make it reusable, and easier to maintain.
% MATLAB has built-in functions and you can create your own custom functions.
%% 1. Basic Function Syntax
% Functions are defined in files with .m extension
% Basic syntax:
%   function [outputs] = functionName(inputs)
%       % Function code here
%   end

%% Example 1: Simple function without inputs or outputs
% Save this in a file named sayHello.m
%   function sayHello()
%       fprintf('Hello, World!\n');
%   end

% Calling the function:
sayHello();
fprintf('\n');

%% Example 2: Function with one input
% Save this in a file named greetUser.m
%   function greetUser(name)
%       fprintf('Hello, %s!\n', name);
%   end

% Calling the function:
greetUser('Alice');
fprintf('\n');

%% Example 3: Function with one output
% Save this in a file named calculateSquare.m
%   function result = calculateSquare(number)
%       result = number * number;
%   end

% Calling the function:
squareResult = calculateSquare(5);
fprintf('Square of 5 is: %d\n', squareResult);
fprintf('\n');
%% Example 4: Function with multiple inputs and outputs
% Save this in a file named rectangleAreaPerimeter.m
%   function [area, perimeter] = rectangleAreaPerimeter(length, width)
%       area = length * width;
%       perimeter = 2 * (length + width);
%   end

% Calling the function:
[area, perimeter] = rectangleAreaPerimeter(4, 3);
fprintf('Rectangle with length 4 and width 3:\n');
fprintf('Area: %d, Perimeter: %d\n', area, perimeter);
fprintf('\n');

%% 2. Function Files vs. Local Functions
% Functions can be in separate files or defined locally in a script

% Main function in a file (must have the same name as the file)
% Local functions are defined at the end of a file and can only be used within that file

fprintf('=== LOCAL FUNCTIONS EXAMPLE ===\n');

% This script contains a main function and local functions
result1 = multiplyNumbers(5, 7);
result2 = divideNumbers(10, 2);
fprintf('Multiplication result: %d\n', result1);
fprintf('Division result: %d\n', result2);
fprintf('\n');

%% 3. Built-in MATLAB Functions
% MATLAB comes with many built-in functions for various purposes

fprintf('=== BUILT-IN FUNCTION EXAMPLES ===\n');

% Math functions
fprintf('Math functions:\n');
fprintf('sqrt(25) = %.2f\n', sqrt(25));
fprintf('sin(pi/2) = %.2f\n', sin(pi/2));
fprintf('log(10) = %.2f\n', log(10));
fprintf('round(3.7) = %d\n', round(3.7));
fprintf('\n');

% Array functions
fprintf('Array functions:\n');
numbers = [3, 1, 4, 1, 5, 9];
fprintf('max(%s) = %d\n', mat2str(numbers), max(numbers));
fprintf('min(%s) = %d\n', mat2str(numbers), min(numbers));
fprintf('mean(%s) = %.2f\n', mat2str(numbers), mean(numbers));
fprintf('sum(%s) = %d\n', mat2str(numbers), sum(numbers));
fprintf('\n');

% String functions
fprintf('String functions:\n');
text = 'Hello MATLAB';
fprintf('length(''%s'') = %d\n', text, length(text));
fprintf('upper(''%s'') = %s\n', text, upper(text));
fprintf('strrep(''%s'', ''MATLAB'', ''World'') = %s\n', text, strrep(text, 'MATLAB', 'World'));
fprintf('\n');

%% 4. Creating and Using Custom Functions

fprintf('=== CREATING CUSTOM FUNCTIONS ===\n');

% Example 1: Temperature conversion function
% Save this in a file named celsiusToFahrenheit.m
%   function f = celsiusToFahrenheit(c)
%       f = (c * 9/5) + 32;
%   end

% Using the function:
cTemp = 25;
fTemp = celsiusToFahrenheit(cTemp);
fprintf('%d°C = %.1f°F\n', cTemp, fTemp);
fprintf('\n');

%% Example 2: Function to check if a number is even
% Save this in a file named isEven.m
%   function result = isEven(number)
%       if mod(number, 2) == 0
%           result = true;
%       else
%           result = false;
%       end
%   end

% Using the function:
num = 7;
if isEven(num)
    fprintf('%d is even\n', num);
else
    fprintf('%d is odd\n', num);
end
fprintf('\n');

%% Example 3: Function with default values (using varargin)
% Save this in a file named greetPerson.m
%   function greetPerson(name, varargin)
%       if nargin > 1 && strcmpi(varargin{1}, 'formal')
%           fprintf('Good day, Mr./Ms. %s\n', name);
%       else
%           fprintf('Hi %s!\n', name);
%       end
%   end

% Using the function:
greetPerson('John');
greetPerson('Smith', 'formal');
fprintf('\n');

%% 5. Function Handles
% Function handles are variables that store references to functions

fprintf('=== FUNCTION HANDLES ===\n');

% Creating function handles
squareHandle = @calculateSquare;
cubeHandle = @(x) x^3; % Anonymous function

% Using function handles
result1 = squareHandle(4);
result2 = cubeHandle(3);
fprintf('Square of 4: %d\n', result1);
fprintf('Cube of 3: %d\n', result2);
fprintf('\n');
%% Aditional Codes for Practice 
%% 6. Practical Examples

fprintf('=== PRACTICAL FUNCTION EXAMPLES ===\n');

% Example 1: Calculating compound interest
principal = 1000;
rate = 0.05;
time = 5;
amount = calculateCompoundInterest(principal, rate, time);
fprintf('Compound interest:\n');
fprintf('Principal: $%.2f, Rate: %.1f%%, Time: %d years\n', principal, rate*100, time);
fprintf('Final amount: $%.2f\n', amount);
fprintf('\n');

%% Example 2: Plotting a function
x = linspace(0, 2*pi, 100);
y = sin(x);
createPlot(x, y, 'Sine Wave', 'x', 'sin(x)');
fprintf('Plot created. Check Figure window.\n\n');

%% Example 3: Sorting and displaying data
data = [34, 7, 23, 32, 15, 42];
sortedData = sortArray(data);
fprintf('Original array: %s\n', mat2str(data));
fprintf('Sorted array: %s\n', mat2str(sortedData));
fprintf('\n');

%% 7. Tips for Writing Good Functions

fprintf('=== TIPS FOR WRITING GOOD FUNCTIONS ===\n');
fprintf('1. Give functions descriptive names\n');
fprintf('2. Include comments to explain what the function does\n');
fprintf('3. Use consistent indentation and formatting\n');
fprintf('4. Validate input parameters\n');
fprintf('5. Keep functions focused on a single task\n');
fprintf('6. Test functions with different inputs\n');
fprintf('7. Use meaningful variable names\n');

%% Local Functions (Defined at the end of the file)

% Local function 1: Multiply two numbers
function result = multiplyNumbers(a, b)
    result = a * b;
end

% Local function 2: Divide two numbers
function result = divideNumbers(a, b)
    if b == 0
        error('Cannot divide by zero');
    end
    result = a / b;
end

% Local function 3: Calculate compound interest
function amount = calculateCompoundInterest(principal, rate, time)
    amount = principal * (1 + rate)^time;
end

% Local function 4: Create a plot
function createPlot(x, y, plotTitle, xLabel, yLabel)
    figure;
    plot(x, y, 'b-', 'LineWidth', 2);
    title(plotTitle);
    xlabel(xLabel);
    ylabel(yLabel);
    grid on;
end

% Local function 5: Sort an array
function sortedArray = sortArray(array)
    sortedArray = sort(array);
end

% Local function 6: Say hello
function sayHello()
    fprintf('Hello, World!\n');
end

% Local function 7: Greet user
function greetUser(name)
    fprintf('Hello, %s!\n', name);
end

% Local function 8: Calculate square
function result = calculateSquare(number)
    result = number * number;
end

% Local function 9: Rectangle area and perimeter
function [area, perimeter] = rectangleAreaPerimeter(length, width)
    area = length * width;
    perimeter = 2 * (length + width);
end

% Local function 10: Celsius to Fahrenheit
function f = celsiusToFahrenheit(c)
    f = (c * 9/5) + 32;
end

% Local function 11: Check if number is even
function result = isEven(number)
    if mod(number, 2) == 0
        result = true;
    else
        result = false;
    end
end

% Local function 12: Greet person with options
function greetPerson(name, varargin)
    if nargin > 1 && strcmpi(varargin{1}, 'formal')
        fprintf('Good day, Mr./Ms. %s\n', name);
    else
        fprintf('Hi %s!\n', name);
    end
end

fprintf('\n=== END OF FUNCTIONS GUIDE ===\n');