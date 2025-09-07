%% 1. Basic 2D Plot
% Random data
x = 0:0.1:10;
y = sin(x) + 0.1*randn(size(x));

figure;
plot(x,y,'-b','LineWidth',2);
xlabel('Time (s)','FontSize',12,'FontWeight','bold');
ylabel('Signal Amplitude','FontSize',12,'FontWeight','bold');
title('Noisy Sine Wave','FontSize',14,'FontWeight','bold');
grid on;

%% 2. Scatter Plot
x = randn(1,100);
y = 2*x + randn(1,100);

figure;
scatter(x,y,50,'filled','MarkerFaceColor','r');
xlabel('X Values','FontSize',12);
ylabel('Y Values','FontSize',12);
title('Scatter Plot with Noise','FontSize',14);
grid on;

%% 3. Histogram
data = randn(1,1000); % Normally distributed random data

figure;
histogram(data,30,'FaceColor','g','EdgeColor','k');
xlabel('Bins','FontSize',12);
ylabel('Frequency','FontSize',12);
title('Histogram of Random Data','FontSize',14);

%% 4. Bar Plot
categories = {'A','B','C','D'};
values = randi([10 50],1,4);

figure;
bar(values,'FaceColor',[0.2 0.6 0.8]);
set(gca,'XTickLabel',categories,'FontSize',12);
ylabel('Counts');
title('Bar Chart Example','FontSize',14);

%% 5. 3D Surface Plot
[X,Y] = meshgrid(-3:0.1:3,-3:0.1:3);
Z = peaks(X,Y);

figure;
surf(X,Y,Z);
xlabel('X-axis'); ylabel('Y-axis'); zlabel('Z-axis');
title('3D Surface Plot','FontSize',14);
shading interp; colorbar;

%% 6. Subplots (Publication-Ready)

x = 0:0.1:10;
y1 = sin(x);
y2 = cos(x);
y3 = exp(-0.1*x).*sin(2*x);
y4 = x.^2;

figure('Units','inches','Position',[1 1 8 6]);

subplot(2,2,1);
plot(x,y1,'-r','LineWidth',2);
xlabel('x'); ylabel('sin(x)'); title('Sine');

subplot(2,2,2);
plot(x,y2,'--b','LineWidth',2);
xlabel('x'); ylabel('cos(x)'); title('Cosine');

subplot(2,2,3);
plot(x,y3,'-k','LineWidth',2);
xlabel('x'); ylabel('Amplitude'); title('Damped Oscillation');

subplot(2,2,4);
plot(x,y4,'-g','LineWidth',2);
xlabel('x'); ylabel('x^2'); title('Quadratic');

sgtitle('Publication-Ready Subplots','FontSize',14,'FontWeight','bold');

%% 7. Customizing Figures (Publication Quality)
x = 0:0.1:5;
y = exp(-0.5*x).*cos(2*pi*x);

figure;
plot(x,y,'-m','LineWidth',2);
xlabel('Time (s)','FontSize',14,'FontWeight','bold');
ylabel('Amplitude','FontSize',14,'FontWeight','bold');
title('Damped Cosine Wave','FontSize',16,'FontWeight','bold');
grid on;

% Custom axes
set(gca,'FontSize',12,'LineWidth',1.5);
legend('exp(-0.5x)cos(2πx)','FontSize',12,'Location','northeast');

% Save as high resolution
print(gcf,'damped_cosine','-dpng','-r300');



