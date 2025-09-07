%% Data Cleaning and Filtering
% data cleaning, filtering, 
% normalization, scaling, and signal processing techniques in MATLAB
% using randomly generated data.

clc; clear; close all;

%% 1. Generate Random Messy Data
n = 100;  % number of data points

% randn(n,1): Generate n random numbers from standard normal distribution
% Syntax: randn(sz1,...,szN)
Time = (1:n)';                          % Time column
Value = randn(n,1)*10;                  % Random values (normal distribution)

% randi(n,5,1): Generate 5 random integers between 1 and n
% Syntax: randi(imax,sz1,...,szN)
Value(randi(n,5,1)) = NaN;              % Insert random NaNs
Value(randi(n,3,1)) = 999;              % Insert random outliers
Category = randi([1 3],n,1);            % Categorical-like numbers

% table(): Create table from data
% Syntax: table(var1, var2, ..., 'VariableNames', {'name1', 'name2', ...})
T = table(Time, Value, Category);       % Create table
disp('Original Data:');

% head(): Display first few rows of table/array
% Syntax: head(T, n) where n is number of rows to display
head(T,10)

%% 2. Handle Missing Data
T1 = T;

% fillmissing(): Fill missing entries
% Syntax: fillmissing(A, method) where method can be 'constant', 'previous', 'next', 'nearest', 'linear', 'spline', 'pchip', 'makima'
T1.Value = fillmissing(T1.Value,'linear');  % Fill missing values with linear interpolation
% T1 = rmmissing(T);                        % Option to remove rows with NaN

%% 3. Remove Outliers
T2 = T1;

% isoutlier(): Detect outliers in data
% Syntax: TF = isoutlier(A, method) where method can be 'mean', 'median', 'grubbs', 'gesd', 'quartiles'
out_idx = isoutlier(T2.Value);             % Detect outliers

% filloutliers(): Replace outliers with specified method
% Syntax: B = filloutliers(A, fillmethod, findmethod)
T2.Value = filloutliers(T2.Value,'center');   % Replace outliers with median
% T2 = T2(~out_idx,:);                     % Option to remove outliers completely

%% 4. Filter Data by Condition
T3 = T2;

% Table indexing with conditions
% Syntax: T(condition, :)
T3 = T3(T3.Value > 0,:);                  % Keep only positive values
T3 = T3(T3.Category == 1,:);             % Keep only Category = 1

%% 5. Normalize / Scale Data
% Min-max normalization: (x - min(x)) / (max(x) - min(x))
% max(): Maximum value of array
% min(): Minimum value of array
T3.Value_norm = (T3.Value - min(T3.Value)) / (max(T3.Value) - min(T3.Value));

% Z-score normalization: (x - mean(x)) / std(x)
% mean(): Mean value of array
% std(): Standard deviation of array
T3.Value_z = (T3.Value - mean(T3.Value)) / std(T3.Value);

%% 6. Smoothing / Noise Reduction
% movmean(): Moving average filter
% Syntax: M = movmean(A, k) where k is window size
T3.Smooth_MA = movmean(T3.Value,5);      % Moving average filter

% movmedian(): Moving median filter
% Syntax: M = movmedian(A, k)
T3.Smooth_Median = movmedian(T3.Value,5); % Median filter alternative

% Savitzky-Golay Filter Implementation
% This filter fits a polynomial to a sliding window of data points
% Syntax: y_sg = savgol_filter(y, order, framelen)
%   y: input signal
%   order: polynomial order (typically 2-4)
%   framelen: window length (must be odd and greater than order)
function y_sg = savgol_filter(y, order, framelen)
    % Check inputs
    if framelen <= order
        error('Window length must be greater than polynomial order');
    end
    if mod(framelen, 2) == 0
        error('Window length must be odd');
    end
    
    n = length(y);
    y_sg = zeros(size(y));
    half_win = (framelen - 1) / 2;
    
    % Create Vandermonde matrix
    x = (-half_win:half_win)';
    A = zeros(framelen, order+1);
    for i = 0:order
        A(:, i+1) = x.^i;
    end
    
    % Compute Savitzky-Golay coefficients
    [Q, R] = qr(A, 0);
    sg_coeff = Q * (R' \ eye(size(R,2)));
    
    % Get the middle row (for smoothing)
    coeff = sg_coeff(:, 1)';
    
    % Handle edges with asymmetric windows
    for i = 1:n
        if i <= half_win
            % Left edge - use beginning of data
            window = y(1:framelen);
            x_window = (0:framelen-1)';
        elseif i > n - half_win
            % Right edge - use end of data
            window = y(n-framelen+1:n);
            x_window = (0:framelen-1)';
        else
            % Middle - symmetric window
            window = y(i-half_win:i+half_win);
            x_window = (-half_win:half_win)';
        end
        
        % Create Vandermonde matrix for this window
        A_window = zeros(framelen, order+1);
        for j = 0:order
            A_window(:, j+1) = x_window.^j;
        end
        
        % Fit polynomial and get smoothed value at center
        p = A_window \ window;
        y_sg(i) = p(1);  % Constant term (value at center)
    end
end

% Apply Savitzky-Golay filter
T3.Smooth_SG = savgol_filter(T3.Value, 2, 5); % 2nd order polynomial, window size 5

%% 7. Signal Filtering (Digital Filter)
T3.Value_LP = movmean(T3.Value,5);     % low-pass (smooth)
T3.Value_HP = T3.Value - movmean(T3.Value,5); % high-pass approx

%% 8. Detrend Data (Remove Linear Trend)
% detrend(): Remove linear trend from data
% Syntax: y = detrend(x, 'linear')
T3.Value_detrend = detrend(T3.Value);

%% 9. Resampling / Downsampling
% Simple downsampling without requiring Signal Processing Toolbox
ds_factor = 2;

% Array indexing: A(start:step:end)
T3_ds = T3.Value(1:ds_factor:end);    % Keep every 2nd sample

% Resampling using interpolation instead of resample function
original_fs = 1; % Assuming 1 Hz sampling rate
target_fs = original_fs * 2/3; % Resample at 2/3 rate

% Create time vectors
t_original = (0:length(T3.Value)-1)/original_fs;
t_target = 0:1/target_fs:t_original(end);

% interp1(): 1-D data interpolation
% Syntax: vq = interp1(x, v, xq, method) where method can be 'linear', 'nearest', 'spline', etc.
T3_resample = interp1(t_original, T3.Value, t_target, 'linear');

%% 10. Plot Results
% figure(): Create new figure window
% Syntax: figure('Name', name)
figure('Name','Data Cleaning and Filtering Demo');

% subplot(): Create subplot in figure
% Syntax: subplot(m, n, p) where m=rows, n=columns, p=position
subplot(3,2,1);

% plot(): Create 2-D line plot
% Syntax: plot(x, y, 'LineSpec')
plot(T.Time, T.Value, 'o-'); 
title('Original Data'); grid on;
xlabel('Time'); ylabel('Value');

subplot(3,2,2);
plot(T1.Time, T1.Value, 'o-'); 
title('After Handling Missing Data'); grid on;
xlabel('Time'); ylabel('Value');

subplot(3,2,3);
plot(T2.Time, T2.Value, 'o-'); 
title('After Outlier Handling'); grid on;
xlabel('Time'); ylabel('Value');

subplot(3,2,4);
plot(T3.Time, T3.Value, 'o-'); hold on;

% hold on: Retain current plot when adding new plots
plot(T3.Time, T3.Smooth_MA, 'r-', 'LineWidth', 1.5);
plot(T3.Time, T3.Smooth_SG, 'g-', 'LineWidth', 1.5);

% legend(): Add legend to plot
% Syntax: legend(label1, label2, ...)
legend('Filtered', 'Moving Avg', 'Savitzky-Golay');
title('Smoothed Data'); grid on;
xlabel('Time'); ylabel('Value');

subplot(3,2,5);
plot(T3.Time, T3.Value, 'o-'); hold on;
plot(T3.Time, T3.Value_LP, 'r-', 'LineWidth', 1.5);
plot(T3.Time, T3.Value_HP, 'g-', 'LineWidth', 1.5);
legend('Original', 'Low-pass', 'High-pass');
title('Digital Filtering'); grid on;
xlabel('Time'); ylabel('Value');

subplot(3,2,6);
plot(T3.Time, T3.Value, 'o-'); hold on;
plot(T3.Time, T3.Value_detrend, 'r-', 'LineWidth', 1.5);
legend('Original', 'Detrended'); 
title('Detrending'); grid on;
xlabel('Time'); ylabel('Value');

%% 11. Display Cleaned Data Table
disp('Cleaned and Processed Data:');
head(T3,10)

%% 12. Display Downsampled and Resampled Data (Optional)
% fprintf(): Display formatted text
% Syntax: fprintf(format, A, ...)
fprintf('\nDownsampled Data (first 10 values):\n');

% min(): Minimum of array elements
disp(T3_ds(1:min(10, length(T3_ds))));

fprintf('\nResampled Data (first 10 values):\n');
disp(T3_resample(1:min(10, length(T3_resample))));