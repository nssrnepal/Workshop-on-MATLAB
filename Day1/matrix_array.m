%% MATLAB's Matrix and Array
clc; clear; close all;

%% What are Matrices and Arrays?
% An array can be 1-D (vector), 2-D (matrix), or multi-dimensional
% In MATLAB, a matrix is a 2-dimensional array of numbers
% MATLAB is designed for matrix operations and is optimized for them

%% 1. Creating Matrices and Arrays

fprintf('=== CREATING MATRICES AND ARRAYS ===\n');

% 1.1 Creating vectors (1-D arrays)
rowVector = [1, 2, 3, 4, 5];          % Row vector
columnVector = [1; 2; 3; 4; 5];       % Column vector
fprintf('Row vector: %s\n', mat2str(rowVector));
fprintf('Column vector: %s\n', mat2str(columnVector));

% 1.2 Creating matrices (2-D arrays)
matrix1 = [1, 2, 3; 4, 5, 6; 7, 8, 9]; % 3x3 matrix
matrix2 = [10, 11, 12; 13, 14, 15];    % 2x3 matrix
fprintf('Matrix 1 (3x3):\n');
disp(matrix1);
fprintf('Matrix 2 (2x3):\n');
disp(matrix2);

% 1.3 Using built-in functions to create matrices
zerosMatrix = zeros(2, 3);             % 2x3 matrix of zeros
onesMatrix = ones(3, 2);               % 3x2 matrix of ones
identityMatrix = eye(3);               % 3x3 identity matrix
randomMatrix = rand(2, 4);             % 2x4 matrix of random numbers
magicMatrix = magic(3);                % 3x3 magic square

fprintf('Zeros matrix (2x3):\n');
disp(zerosMatrix);
fprintf('Identity matrix (3x3):\n');
disp(identityMatrix);
fprintf('Magic matrix (3x3):\n');
disp(magicMatrix);

% 1.4 Creating sequences
sequence1 = 1:5;                       % 1 to 5 with step 1
sequence2 = 1:2:10;                    % 1 to 10 with step 2
sequence3 = linspace(0, 1, 5);         % 5 points between 0 and 1
sequence4 = logspace(0, 2, 5);         % 5 points between 10^0 and 10^2

fprintf('Sequence 1:5: %s\n', mat2str(sequence1));
fprintf('Sequence 1:2:10: %s\n', mat2str(sequence2));
fprintf('Linspace 0 to 1 (5 points): %s\n', mat2str(sequence3));
fprintf('Logspace 0 to 2 (5 points): %s\n', mat2str(sequence4));

fprintf('\n');

%% 2. Matrix Operations (Linear Algebra)

fprintf('=== MATRIX OPERATIONS (LINEAR ALGEBRA) ===\n');

A = [1, 2; 3, 4];
B = [5, 6; 7, 8];

% 2.1 Matrix addition and subtraction
fprintf('Matrix addition:\n');
disp(A + B);
fprintf('Matrix subtraction:\n');
disp(A - B);

% 2.2 Matrix multiplication
fprintf('Matrix multiplication:\n');
disp(A * B);

% 2.3 Matrix division (solving linear systems)
% A\B is equivalent to inv(A)*B
% B/A is equivalent to B*inv(A)
fprintf('Matrix division (A\\B):\n');
disp(A \ B);
fprintf('Matrix division (B/A):\n');
disp(B / A);

% 2.4 Matrix exponentiation
fprintf('Matrix exponentiation (A^2):\n');
disp(A^2);

% 2.5 Matrix transpose
fprintf('Matrix transpose (A''):\n');
disp(A');  % Complex conjugate transpose
fprintf('Matrix transpose (A.''):\n');
disp(A.'); % Non-conjugate transpose

% 2.6 Matrix inverse
fprintf('Matrix inverse (inv(A)):\n');
disp(inv(A));

% 2.7 Matrix determinant
fprintf('Matrix determinant (det(A)): %.2f\n', det(A));

% 2.8 Matrix rank
fprintf('Matrix rank (rank(A)): %d\n', rank(A));

% 2.9 Eigenvalues and eigenvectors
fprintf('Eigenvalues of A:\n');
eigenvalues = eig(A);
disp(eigenvalues);

fprintf('\n');

%% 3. Array Operations (Element-wise)

fprintf('=== ARRAY OPERATIONS (ELEMENT-WISE) ===\n');

X = [1, 2, 3; 4, 5, 6];
Y = [7, 8, 9; 10, 11, 12];

% 3.1 Element-wise addition and subtraction
% (Same as matrix addition/subtraction for same-size arrays)
fprintf('Element-wise addition:\n');
disp(X + Y);
fprintf('Element-wise subtraction:\n');
disp(X - Y);

% 3.2 Element-wise multiplication
fprintf('Element-wise multiplication (X .* Y):\n');
disp(X .* Y);

% 3.3 Element-wise division
fprintf('Element-wise division (X ./ Y):\n');
disp(X ./ Y);
fprintf('Element-wise division (X .\\ Y):\n');
disp(X .\ Y);

% 3.4 Element-wise exponentiation
fprintf('Element-wise exponentiation (X .^ 2):\n');
disp(X .^ 2);
fprintf('Element-wise exponentiation (2 .^ X):\n');
disp(2 .^ X);
fprintf('Element-wise exponentiation (X .^ Y):\n');
disp(X .^ Y);

fprintf('\n');

%% 4. Matrix Indexing and Slicing

fprintf('=== MATRIX INDEXING AND SLICING ===\n');

M = magic(4); % Create a 4x4 magic square
fprintf('Magic matrix (4x4):\n');
disp(M);

% 4.1 Accessing single elements
fprintf('Element at row 2, column 3: %d\n', M(2, 3));

% 4.2 Accessing entire rows or columns
fprintf('Row 2: %s\n', mat2str(M(2, :)));
fprintf('Column 3: %s\n', mat2str(M(:, 3)));

% 4.3 Accessing submatrices
fprintf('Submatrix rows 1-2, columns 2-4:\n');
disp(M(1:2, 2:4));

% 4.4 Using end keyword
fprintf('Last element: %d\n', M(end));
fprintf('Last row: %s\n', mat2str(M(end, :)));
fprintf('Last column: %s\n', mat2str(M(:, end)));

% 4.5 Linear indexing
fprintf('Element at linear index 7: %d\n', M(7));

% 4.6 Logical indexing
fprintf('Elements greater than 10:\n');
disp(M(M > 10));

fprintf('\n');

%% 5. Matrix Functions

fprintf('=== MATRIX FUNCTIONS ===\n');

C = [1, 2, 3; 4, 5, 6; 7, 8, 9];

% 5.1 Matrix size
fprintf('Size of C: %s\n', mat2str(size(C)));
fprintf('Number of rows: %d\n', size(C, 1));
fprintf('Number of columns: %d\n', size(C, 2));

% 5.2 Matrix length (max dimension)
fprintf('Length of C: %d\n', length(C));

% 5.3 Matrix reshape
fprintf('Reshape C to 1x9:\n');
disp(reshape(C, 1, 9));
fprintf('Reshape C to 9x1:\n');
disp(reshape(C, 9, 1));

% 5.4 Matrix diagonal
fprintf('Diagonal of C: %s\n', mat2str(diag(C)));

% 5.5 Matrix trace
fprintf('Trace of C: %d\n', trace(C));

% 5.6 Matrix norm
fprintf('Frobenius norm of C: %.2f\n', norm(C, 'fro'));

% 5.7 Matrix condition number
fprintf('Condition number of C: %.2f\n', cond(C));

fprintf('\n');

%% 6. Special Matrix Operations

fprintf('=== SPECIAL MATRIX OPERATIONS ===\n');

% 6.1 Kronecker product
fprintf('Kronecker product of A and B:\n');
disp(kron(A, B));

% 6.2 Matrix concatenation
fprintf('Horizontal concatenation [A, B]:\n');
disp([A, B]);
fprintf('Vertical concatenation [A; B]:\n');
disp([A; B]);

% 6.3 Matrix replication
fprintf('Replicate A 2 times vertically, 3 times horizontally:\n');
disp(repmat(A, 2, 3));

% 6.4 Finding indices of elements
D = [1, 5, 3; 4, 2, 6];
fprintf('Indices of elements greater than 3:\n');
[row, col] = find(D > 3);
for i = 1:length(row)
    fprintf('Element at (%d, %d) = %d\n', row(i), col(i), D(row(i), col(i)));
end

% 6.5 Sorting matrices
fprintf('Sort each column of D:\n');
disp(sort(D));
fprintf('Sort each row of D:\n');
disp(sort(D, 2));

fprintf('\n');

%% 7. Array Functions

fprintf('=== ARRAY FUNCTIONS ===\n');

arr = [3, 1, 4, 1, 5, 9, 2, 6];

% 7.1 Array statistics
fprintf('Array: %s\n', mat2str(arr));
fprintf('Sum: %.2f\n', sum(arr));
fprintf('Mean: %.2f\n', mean(arr));
fprintf('Median: %.2f\n', median(arr));
fprintf('Standard deviation: %.2f\n', std(arr));
fprintf('Variance: %.2f\n', var(arr));
fprintf('Minimum: %.2f\n', min(arr));
fprintf('Maximum: %.2f\n', max(arr));

% 7.2 Cumulative operations
fprintf('Cumulative sum: %s\n', mat2str(cumsum(arr)));
fprintf('Cumulative product: %s\n', mat2str(cumprod(arr)));

% 7.3 Array filtering
fprintf('Filtered array (values > 3): %s\n', mat2str(arr(arr > 3)));

% 7.4 Array shifting and rotating
fprintf('Circular shift by 2: %s\n', mat2str(circshift(arr, 2)));

fprintf('\n');

%% 8. Multi-dimensional Arrays

fprintf('=== MULTI-DIMENSIONAL ARRAYS ===\n');

% 8.1 Creating 3D arrays
array3D = zeros(2, 3, 4); % 2x3x4 array of zeros
fprintf('Size of 3D array: %s\n', mat2str(size(array3D)));

% Fill the 3D array with values
for i = 1:size(array3D, 3)
    array3D(:, :, i) = i * ones(2, 3);
end

fprintf('3D array:\n');
disp(array3D);

% 8.2 Accessing elements in 3D arrays
fprintf('Element at (1, 2, 3): %d\n', array3D(1, 2, 3));
fprintf('Slice at z=2:\n');
disp(array3D(:, :, 2));

% 8.3 Reshaping multi-dimensional arrays
fprintf('Reshape 3D array to 2D (6x4):\n');
disp(reshape(array3D, 6, 4));

fprintf('\n');

%% 9. Sparse Matrices

fprintf('=== SPARSE MATRICES ===\n');

% 9.1 Creating sparse matrices
sparseMatrix = sparse([1, 2, 3], [1, 2, 3], [4, 5, 6], 5, 5);
fprintf('Sparse matrix:\n');
disp(sparseMatrix);
fprintf('Full representation:\n');
disp(full(sparseMatrix));

% 9.2 Converting between sparse and full
fullMatrix = full(sparseMatrix);
sparseAgain = sparse(fullMatrix);

% 9.3 Sparse matrix operations
fprintf('Number of non-zero elements: %d\n', nnz(sparseMatrix));

fprintf('\n');

%% 10. Practical Examples

fprintf('=== PRACTICAL EXAMPLES ===\n');

% Example 1: Solving a system of linear equations
% Solve Ax = b where A = [2, 1; 1, 3] and b = [5; 10]
A_ex = [2, 1; 1, 3];
b_ex = [5; 10];
x_ex = A_ex \ b_ex;
fprintf('Solving Ax = b:\n');
fprintf('A = \n');
disp(A_ex);
fprintf('b = \n');
disp(b_ex);
fprintf('x = \n');
disp(x_ex);

% Example 2: Matrix transformation
points = [1, 2, 3; 4, 5, 6]; % 2x3 matrix of points
rotation = [cosd(30), -sind(30); sind(30), cosd(30)]; % 30-degree rotation matrix
transformed = rotation * points;
fprintf('Original points:\n');
disp(points);
fprintf('Rotation matrix (30 degrees):\n');
disp(rotation);
fprintf('Transformed points:\n');
disp(transformed);

% Example 3: Image as a matrix
% Create a simple grayscale image pattern
imageMatrix = zeros(10, 10);
imageMatrix(3:7, 3:7) = 1; % White square in the middle
fprintf('Simple image matrix (10x10):\n');
disp(imageMatrix);

% Example 4: Covariance matrix calculation
data = randn(100, 3); % 100 samples, 3 variables
covMatrix = cov(data);
fprintf('Covariance matrix of random data (3 variables):\n');
disp(covMatrix);

fprintf('\n=== END OF MATRIX AND ARRAY OPERATIONS GUIDE ===\n');