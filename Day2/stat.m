%% Statistics in MATLAB
clc; clear; close all;
%% What is Statistical Analysis in MATLAB?
% MATLAB provides comprehensive tools for statistical analysis, including 
% descriptive statistics, probability distributions, hypothesis testing, 
% regression analysis, and multivariate statistics.
%% 1. Descriptive Statistics

fprintf('=== DESCRIPTIVE STATISTICS ===\n');

% Create sample data
data = [12, 15, 18, 22, 17, 14, 19, 25, 16, 21, 13, 20, 24, 16, 18];

fprintf('Sample data: %s\n', mat2str(data));

% 1.1 Measures of central tendency
fprintf('Mean: %.2f\n', mean(data));
fprintf('Median: %.2f\n', median(data));
fprintf('Mode: %.2f\n', mode(data));
fprintf('Geometric mean: %.2f\n', geomean(data));
fprintf('Harmonic mean: %.2f\n', harmmean(data));

% 1.2 Measures of dispersion
fprintf('Range: %.2f\n', range(data));
fprintf('Variance: %.2f\n', var(data));
fprintf('Standard deviation: %.2f\n', std(data));
fprintf('Mean absolute deviation: %.2f\n', mad(data));
fprintf('Interquartile range: %.2f\n', iqr(data));

% 1.3 Shape of distribution
fprintf('Skewness: %.2f\n', skewness(data));
fprintf('Kurtosis: %.2f\n', kurtosis(data));

% 1.4 Quantiles and percentiles
fprintf('Quantiles (0, 0.25, 0.5, 0.75, 1): %s\n', mat2str(quantile(data, [0, 0.25, 0.5, 0.75, 1])));
fprintf('95th percentile: %.2f\n', prctile(data, 95));

% 1.5 Summary statistics
fprintf('Summary statistics:\n');
summary(table(data'))

fprintf('\n');

%% Canvas Second Day Quiz Code
imshow('C:\\Users\WT\Documents\MATLAB\Workshop\Canvas\2.png');
%% 2. Probability Distributions

fprintf('=== PROBABILITY DISTRIBUTIONS ===\n');

% 2.1 Normal distribution
x = -4:0.1:4;
mu = 0;      % Mean
sigma = 1;   % Standard deviation

% Probability Density Function (PDF)
pdf_normal = normpdf(x, mu, sigma);

% Cumulative Distribution Function (CDF)
cdf_normal = normcdf(x, mu, sigma);

% Inverse CDF (Quantile function)
p = 0.05:0.05:0.95;
quantile_normal = norminv(p, mu, sigma);

% Random number generation
normal_rnd = normrnd(mu, sigma, 1000, 1);

fprintf('Normal distribution:\n');
fprintf('PDF at x=0: %.4f\n', normpdf(0, mu, sigma));
fprintf('CDF at x=0: %.4f\n', normcdf(0, mu, sigma));
fprintf('Quantile for p=0.95: %.4f\n', norminv(0.95, mu, sigma));

% 2.2 Other common distributions
% Uniform distribution
uniform_rnd = unifrnd(0, 1, 1000, 1);

% Exponential distribution
exp_rnd = exprnd(2, 1000, 1);

% Binomial distribution
binomial_rnd = binornd(10, 0.5, 1000, 1);

% Poisson distribution
poisson_rnd = poissrnd(3, 1000, 1);

% 2.3 Distribution fitting
figure('Name', 'Distribution Fitting');
subplot(2, 2, 1);
histfit(normal_rnd, 20, 'normal');
title('Normal Distribution Fit');

subplot(2, 2, 2);
histfit(exp_rnd, 20, 'exponential');
title('Exponential Distribution Fit');

subplot(2, 2, 3);
histfit(poisson_rnd, 20, 'poisson');
title('Poisson Distribution Fit');

% 2.4 Probability plots
subplot(2, 2, 4);
probplot('normal', normal_rnd);
title('Normal Probability Plot');

fprintf('\n');

%% 3. Hypothesis Testing

fprintf('=== HYPOTHESIS TESTING ===\n');

% 3.1 One-sample t-test
% Test if the mean of data is different from 20
[h, p, ci, stats] = ttest(data, 20);
fprintf('One-sample t-test (H0: mean = 20):\n');
fprintf('h = %d, p = %.4f, t = %.4f, df = %d\n', h, p, stats.tstat, stats.df);
fprintf('95%% Confidence Interval: [%.2f, %.2f]\n', ci(1), ci(2));

% 3.2 Two-sample t-test
% Compare two samples
data1 = [12, 15, 18, 22, 17, 14, 19];
data2 = [25, 16, 21, 13, 20, 24, 16, 18];

[h, p, ci, stats] = ttest2(data1, data2);
fprintf('\nTwo-sample t-test (H0: means are equal):\n');
fprintf('h = %d, p = %.4f, t = %.4f, df = %d\n', h, p, stats.tstat, stats.df);
fprintf('95%% Confidence Interval: [%.2f, %.2f]\n', ci(1), ci(2));

% 3.3 Paired t-test
% Compare paired samples
before = [12, 15, 18, 22, 17];
after = [14, 16, 20, 25, 19];

[h, p, ci, stats] = ttest(before, after);
fprintf('\nPaired t-test (H0: mean difference = 0):\n');
fprintf('h = %d, p = %.4f, t = %.4f, df = %d\n', h, p, stats.tstat, stats.df);
fprintf('95%% Confidence Interval: [%.2f, %.2f]\n', ci(1), ci(2));

% 3.4 Chi-square test for independence
% Create categorical data for chi-square test
% For a proper chi-square test, we need categorical data, not a matrix
group1 = [repmat('A', 10, 1); repmat('B', 15, 1); repmat('C', 20, 1)];
group2 = [repmat('A', 20, 1); repmat('B', 25, 1); repmat('C', 10, 1)];
categories = [group1; group2];
group_labels = [repmat('Group1', length(group1), 1); repmat('Group2', length(group2), 1)];

% Perform chi-square test
[tbl, chi2, p_val, labels] = crosstab(categories, group_labels);
fprintf('\nChi-square test for independence:\n');
fprintf('Chi-square statistic: %.4f\n', chi2);
fprintf('p-value: %.4f\n', p_val);
fprintf('Degrees of freedom: %d\n', (size(tbl, 1)-1)*(size(tbl, 2)-1));

% 3.5 ANOVA (Analysis of Variance)
group1 = [5, 6, 7, 8, 9];
group2 = [3, 4, 5, 6, 7];
group3 = [1, 2, 3, 4, 5];

[p, tbl, stats] = anova1([group1', group2', group3'], {'Group1', 'Group2', 'Group3'});
fprintf('\nOne-way ANOVA:\n');
fprintf('p = %.4f, F = %.4f\n', p, tbl{2,5});

fprintf('\n');

%% 4. Regression Analysis

fprintf('=== REGRESSION ANALYSIS ===\n');

% 4.1 Simple linear regression
x = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]';
y = [2.1, 3.9, 6.2, 8.1, 9.8, 12.3, 13.9, 16.2, 17.8, 20.1]';

% Fit linear model
mdl = fitlm(x, y);

fprintf('Simple linear regression:\n');
fprintf('Equation: y = %.2f + %.2f*x\n', mdl.Coefficients.Estimate(1), mdl.Coefficients.Estimate(2));
fprintf('R-squared: %.4f\n', mdl.Rsquared.Ordinary);
fprintf('Adjusted R-squared: %.4f\n', mdl.Rsquared.Adjusted);
fprintf('p-value for slope: %.4f\n', mdl.Coefficients.pValue(2));

% 4.2 Multiple linear regression
x1 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]';
x2 = [0.5, 1.2, 2.1, 2.8, 3.6, 4.2, 5.1, 5.8, 6.5, 7.3]';
y_multi = [3.2, 5.1, 7.8, 9.6, 12.3, 14.1, 16.8, 18.9, 21.5, 23.8]';

% Fit multiple regression model
mdl_multi = fitlm([x1, x2], y_multi, 'VarNames', {'x1', 'x2', 'y'});

fprintf('\nMultiple linear regression:\n');
disp(mdl_multi);

% 4.3 Polynomial regression
x_poly = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]';
y_poly = [2.1, 3.9, 8.2, 15.1, 24.8, 35.3, 49.9, 63.2, 80.8, 99.1]';

% Fit polynomial model (degree 2)
p = polyfit(x_poly, y_poly, 2);
y_poly_fit = polyval(p, x_poly);

fprintf('\nPolynomial regression (degree 2):\n');
fprintf('Equation: y = %.2f*x^2 + %.2f*x + %.2f\n', p(1), p(2), p(3));

% 4.4 Regression plots
figure('Name', 'Regression Analysis');
subplot(2, 2, 1);
plot(mdl);
title('Linear Regression');
xlabel('X');
ylabel('Y');

subplot(2, 2, 2);
plot(x_poly, y_poly, 'o', x_poly, y_poly_fit, '-');
title('Polynomial Regression');
xlabel('X');
ylabel('Y');
legend('Data', 'Fit', 'Location', 'northwest');

% Residual analysis
subplot(2, 2, 3);
plotResiduals(mdl, 'fitted');
title('Residuals vs Fitted Values');

subplot(2, 2, 4);
plotResiduals(mdl, 'probability');
title('Normal Probability Plot of Residuals');

fprintf('\n');

%% 5. Multivariate Statistics

fprintf('=== MULTIVARIATE STATISTICS ===\n');

% 5.1 Principal Component Analysis (PCA)
load fisheriris; % Load built-in dataset
X = meas;       % Measurements
Y = species;    % Species

% Perform PCA
[coeff, score, latent, tsquared, explained] = pca(X);

fprintf('Principal Component Analysis:\n');
fprintf('Variance explained by each PC: %s\n', mat2str(explained(1:4)'));
fprintf('Cumulative variance explained: %.2f%%\n', sum(explained(1:2)));

% 5.2 Cluster analysis
% K-means clustering
rng(1); % For reproducibility
[idx, C] = kmeans(X, 3);

% Calculate silhouette values
silhouette_values = silhouette(X, idx);

fprintf('\nK-means clustering:\n');
fprintf('Average silhouette value: %.4f\n', mean(silhouette_values));

% 5.3 Multivariate visualization
figure('Name', 'Multivariate Statistics');
subplot(2, 2, 1);
gscatter(score(:,1), score(:,2), Y);
title('PCA: PC1 vs PC2');
xlabel('First Principal Component');
ylabel('Second Principal Component');

subplot(2, 2, 2);
biplot(coeff(:,1:2), 'Scores', score(:,1:2), 'VarLabels', {'SL', 'SW', 'PL', 'PW'});
title('PCA Biplot');

subplot(2, 2, 3);
silhouette(X, idx);
title('Silhouette Plot');

subplot(2, 2, 4);
dendrogram(linkage(X, 'ward'), 'ColorThreshold', 'default');
title('Hierarchical Clustering Dendrogram');

fprintf('\n');


%% Additional Practices
%% 6. Practical Statistical Analysis Example

fprintf('=== PRACTICAL STATISTICAL ANALYSIS EXAMPLE ===\n');

% Load carsmall data
load carsmall;
data_table = table(Acceleration, Horsepower, MPG, Weight, Cylinders, Origin);

% Remove missing values
data_table = rmmissing(data_table);

% Summary statistics
fprintf('Summary statistics for car data:\n');
summary(data_table)

% Correlation analysis
fprintf('\nCorrelation matrix:\n');
corr_matrix = corr(table2array(data_table(:, 1:4)));
disp(array2table(corr_matrix, 'VariableNames', {'Acceleration', 'Horsepower', 'MPG', 'Weight'}, ...
    'RowNames', {'Acceleration', 'Horsepower', 'MPG', 'Weight'}));

% Regression analysis: Predict MPG from other variables
fprintf('\nMultiple regression to predict MPG:\n');
mdl_cars = fitlm(data_table, 'MPG ~ Acceleration + Horsepower + Weight + Cylinders');
disp(mdl_cars);

% ANOVA to compare MPG by number of cylinders
fprintf('\nANOVA: MPG by number of cylinders:\n');
[p, tbl, stats] = anova1(data_table.MPG, data_table.Cylinders, 'off');
disp(array2table(tbl(2:4, :), 'VariableNames', tbl(1, :)));

% Visualization
figure('Name', 'Car Data Analysis');
subplot(2, 2, 1);
scatter(data_table.Weight, data_table.MPG);
xlabel('Weight');
ylabel('MPG');
title('MPG vs Weight');

subplot(2, 2, 2);
boxplot(data_table.MPG, data_table.Cylinders);
xlabel('Number of Cylinders');
ylabel('MPG');
title('MPG by Number of Cylinders');

subplot(2, 2, 3);
plotResiduals(mdl_cars, 'fitted');
title('Residuals vs Fitted Values');

subplot(2, 2, 4);
plotEffects(mdl_cars);
title('Effect of Predictors on MPG');

fprintf('\n=== END OF STATISTICS GUIDE ===\n');