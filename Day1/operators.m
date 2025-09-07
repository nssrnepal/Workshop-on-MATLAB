%% MATLAB Operators

clc; clear; close all;

%% What are Operators?
% Operators are special symbols that perform specific operations on one or more operands 
% (variables, values, or expressions). MATLAB provides various types of operators for
% arithmetic, comparison, logical operations, and more.

%% 1. Arithmetic Operators
% Used to perform mathematical operations

fprintf('=== ARITHMETIC OPERATORS ===\n');

a = 10;
b = 3;

% Addition (+)
fprintf('Addition (%d + %d): %d\n', a, b, a + b);

% Subtraction (-)
fprintf('Subtraction (%d - %d): %d\n', a, b, a - b);

% Multiplication (*)
fprintf('Multiplication (%d * %d): %d\n', a, b, a * b);

% Division (/)
fprintf('Division (%d / %d): %.2f\n', a, b, a / b);

% Right Division (\)
fprintf('Right Division (%d \\ %d): %.2f\n', a, b, a \ b);

% Exponentiation (^)
fprintf('Exponentiation (%d ^ %d): %.2f\n', a, b, a ^ b);

% Modulus (mod)
fprintf('Modulus (mod(%d, %d)): %d\n', a, b, mod(a, b));

% Remainder (rem)
fprintf('Remainder (rem(%d, %d)): %d\n', a, b, rem(a, b));

fprintf('\n');

%% 2. Relational Operators
% Used to compare two values or expressions

fprintf('=== RELATIONAL OPERATORS ===\n');

x = 5;
y = 8;

% Equal to (==)
fprintf('Equal to (%d == %d): %d\n', x, y, x == y);

% Not equal to (~=)
fprintf('Not equal to (%d ~= %d): %d\n', x, y, x ~= y);

% Greater than (>)
fprintf('Greater than (%d > %d): %d\n', x, y, x > y);

% Less than (<)
fprintf('Less than (%d < %d): %d\n', x, y, x < y);

% Greater than or equal to (>=)
fprintf('Greater than or equal to (%d >= %d): %d\n', x, y, x >= y);

% Less than or equal to (<=)
fprintf('Less than or equal to (%d <= %d): %d\n', x, y, x <= y);

fprintf('\n');

%% 3. Logical Operators
% Used to perform logical operations

fprintf('=== LOGICAL OPERATORS ===\n');

p = true;   % 1
q = false;  % 0

% AND (& or &&)
fprintf('AND (p & q): %d\n', p & q);
fprintf('Short-circuit AND (p && q): %d\n', p && q);

% OR (| or ||)
fprintf('OR (p | q): %d\n', p | q);
fprintf('Short-circuit OR (p || q): %d\n', p || q);

% NOT (~)
fprintf('NOT (~p): %d\n', ~p);
fprintf('NOT (~q): %d\n', ~q);

% XOR (Exclusive OR)
fprintf('XOR (p, q): %d\n', xor(p, q));

fprintf('\n');

%% 4. Assignment Operators
% Used to assign values to variables

fprintf('=== ASSIGNMENT OPERATORS ===\n');

% Basic assignment (=)
a = 10;
fprintf('Basic assignment: a = %d\n', a);

% Compound assignment (not directly supported, but can be simulated)
a = a + 5;
fprintf('After a = a + 5: %d\n', a);

a = a * 2;
fprintf('After a = a * 2: %d\n', a);

fprintf('\n');

%% 5. Special Operators
% MATLAB-specific operators

fprintf('=== SPECIAL OPERATORS ===\n');

% Colon operator (:)
fprintf('Colon operator (1:5): %s\n', mat2str(1:5));
fprintf('Colon operator with step (1:2:10): %s\n', mat2str(1:2:10));

% Transpose operator (')
matrix = [1, 2; 3, 4];
fprintf('Original matrix: %s\n', mat2str(matrix));
fprintf('Transpose of matrix: %s\n', mat2str(matrix'));

% Complex conjugate transpose (')
complexMatrix = [1+2i, 3+4i; 5+6i, 7+8i];
fprintf('Complex matrix: %s\n', mat2str(complexMatrix));
fprintf('Conjugate transpose: %s\n', mat2str(complexMatrix'));

% Element-wise operations (.*, ./, .^)
fprintf('Element-wise multiplication ([1 2] .* [3 4]): %s\n', mat2str([1 2] .* [3 4]));
fprintf('Element-wise division ([1 2] ./ [3 4]): %s\n', mat2str([1 2] ./ [3 4]));
fprintf('Element-wise exponentiation ([1 2] .^ [3 4]): %s\n', mat2str([1 2] .^ [3 4]));

fprintf('\n');

%% 6. Bitwise Operators
% Used to perform bit-level operations

fprintf('=== BITWISE OPERATORS ===\n');

% Convert numbers to binary for demonstration
num1 = 5;  % binary: 101
num2 = 3;  % binary: 011

% Bitwise AND (bitand)
fprintf('Bitwise AND (%d & %d): %d\n', num1, num2, bitand(num1, num2));

% Bitwise OR (bitor)
fprintf('Bitwise OR (%d | %d): %d\n', num1, num2, bitor(num1, num2));

% Bitwise XOR (bitxor)
fprintf('Bitwise XOR (%d XOR %d): %d\n', num1, num2, bitxor(num1, num2));

% Bitwise NOT (bitcmp)
fprintf('Bitwise NOT (~%d): %d\n', num1, bitcmp(num1, 8)); % 8 bits

% Bit shift (bitshift)
fprintf('Bit shift (%d << 1): %d\n', num1, bitshift(num1, 1));
fprintf('Bit shift (%d >> 1): %d\n', num1, bitshift(num1, -1));

fprintf('\n');

%% 7. Set Operators
% Used for set operations

fprintf('=== SET OPERATORS ===\n');

set1 = [1, 2, 3, 4, 5];
set2 = [3, 4, 5, 6, 7];

% Union (union)
fprintf('Union of %s and %s: %s\n', mat2str(set1), mat2str(set2), mat2str(union(set1, set2)));

% Intersection (intersect)
fprintf('Intersection of %s and %s: %s\n', mat2str(set1), mat2str(set2), mat2str(intersect(set1, set2)));

% Set difference (setdiff)
fprintf('Set difference (%s \\ %s): %s\n', mat2str(set1), mat2str(set2), mat2str(setdiff(set1, set2)));

% Set exclusive OR (setxor)
fprintf('Set XOR of %s and %s: %s\n', mat2str(set1), mat2str(set2), mat2str(setxor(set1, set2)));

% Is member (ismember)
fprintf('Is 3 a member of %s: %d\n', mat2str(set1), ismember(3, set1));
fprintf('Is 9 a member of %s: %d\n', mat2str(set1), ismember(9, set1));

fprintf('\n');

%% 8. Special Value Operators
% MATLAB special values

fprintf('=== SPECIAL VALUE OPERATORS ===\n');

% Pi (π)
fprintf('Value of pi: %.6f\n', pi);

% Imaginary unit (i or j)
fprintf('Imaginary unit: %.0fi\n', 1i);

% Infinity (Inf)
fprintf('Infinity: %f\n', Inf);

% Not a Number (NaN)
fprintf('Not a Number: %f\n', NaN);

% Machine epsilon (eps)
fprintf('Machine epsilon: %e\n', eps);

fprintf('\n');

%% 9. Operator Precedence
% Order in which operations are performed

fprintf('=== OPERATOR PRECEDENCE ===\n');

% Demonstrate operator precedence
result1 = 2 + 3 * 4;      % Multiplication before addition
result2 = (2 + 3) * 4;    % Parentheses change order

fprintf('2 + 3 * 4 = %d (Multiplication first)\n', result1);
fprintf('(2 + 3) * 4 = %d (Parentheses change order)\n', result2);

% Common precedence (from highest to lowest):
fprintf('\nOperator Precedence (highest to lowest):\n');
fprintf('1. Parentheses ()\n');
fprintf('2. Transpose (.''), Power (.^), Complex conjugate transpose (''), Matrix power (^)\n');
fprintf('3. Unary plus (+), Unary minus (-), Logical negation (~)\n');
fprintf('4. Multiplication (.*), Right division (./), Left division (.\\), Matrix multiplication (*), Matrix right division (/), Matrix left division (\\)\n');
fprintf('5. Addition (+), Subtraction (-)\n');
fprintf('6. Colon operator (:)\n');
fprintf('7. Less than (<), Less than or equal to (<=), Greater than (>), Greater than or equal to (>=), Equal to (==), Not equal to (~=)\n');
fprintf('8. Element-wise AND (&)\n');
fprintf('9. Element-wise OR (|)\n');
fprintf('10. Short-circuit AND (&&)\n');
fprintf('11. Short-circuit OR (||)\n');

fprintf('\n');

%% 10. Practical Examples

fprintf('=== PRACTICAL EXAMPLES ===\n');

% Example 1: Using operators in expressions
fprintf('Example 1: Using operators in expressions\n');
x = 5;
y = 3;
z = (x + y) * 2 - 1;
fprintf('(x + y) * 2 - 1 = (%d + %d) * 2 - 1 = %d\n', x, y, z);

% Example 2: Logical operations with arrays
fprintf('\nExample 2: Logical operations with arrays\n');
A = [true, false, true];
B = [false, true, true];
fprintf('A = %s\n', mat2str(A));
fprintf('B = %s\n', mat2str(B));
fprintf('A & B = %s\n', mat2str(A & B));
fprintf('A | B = %s\n', mat2str(A | B));
fprintf('~A = %s\n', mat2str(~A));

% Example 3: Element-wise operations
fprintf('\nExample 3: Element-wise operations\n');
X = [1, 2, 3];
Y = [4, 5, 6];
fprintf('X = %s\n', mat2str(X));
fprintf('Y = %s\n', mat2str(Y));
fprintf('X .* Y = %s\n', mat2str(X .* Y));
fprintf('X .^ 2 = %s\n', mat2str(X .^ 2));

% Example 4: Using operators with matrices
fprintf('\nExample 4: Using operators with matrices\n');
M1 = [1, 2; 3, 4];
M2 = [5, 6; 7, 8];
fprintf('M1 = %s\n', mat2str(M1));
fprintf('M2 = %s\n', mat2str(M2));
fprintf('M1 * M2 = %s\n', mat2str(M1 * M2));      % Matrix multiplication
fprintf('M1 .* M2 = %s\n', mat2str(M1 .* M2));    % Element-wise multiplication

fprintf('\n=== END OF OPERATORS GUIDE ===\n');