%% MATLAB Data Visualization – Publication Ready Plots
% figure            → Opens new figure window
% figure(n)         → Opens/activates figure with ID = n
% figure('Name','title','NumberTitle','off') → Customized figure
% clf               → Clears figure
% close             → Close current figure
% close all         → Close all figures
% gcf               → Get current figure handle
% set(gcf,...)      → Customize figure

%% Example: Opening figure with name
figure('Name','Line Plot Example','NumberTitle','off');
x = 0:0.1:10; y = sin(x);
plot(x,y,'-b','LineWidth',2);
title('Sine Function');
xlabel('x'); ylabel('sin(x)');

%% Subplots
% subplot(m,n,p)  → Divide figure into m rows, n cols, pick position p
% subplot(2,2,1) → 2x2 grid, select 1st subplot
% sgtitle('text') → Super title for all subplots

x = 0:0.1:10; 
y1 = sin(x); y2 = cos(x); y3 = exp(-0.1*x).*sin(2*x); y4 = x.^2;

figure('Name','Subplot Example','NumberTitle','off','Position',[100 100 900 600]);
subplot(2,2,1);
plot(x,y1,'-r','LineWidth',2);
title('Sine'); xlabel('x'); ylabel('sin(x)'); grid on;

subplot(2,2,2);
plot(x,y2,'--b','LineWidth',2);
title('Cosine'); xlabel('x'); ylabel('cos(x)'); grid on;

subplot(2,2,3);
plot(x,y3,'-k','LineWidth',2);
title('Damped Oscillation'); xlabel('x'); ylabel('y'); grid on;

subplot(2,2,4);
plot(x,y4,'-g','LineWidth',2);
title('Quadratic'); xlabel('x'); ylabel('x^2'); grid on;

sgtitle('Multiple Subplots Example','FontSize',16,'FontWeight','bold');

%% Basic Plot
% Syntax: plot(x,y,'style')
% Styles: '-' solid, '--' dashed, ':' dotted, '-.' dash-dot
% Markers: 'o','s','d','x','*'
% Colors: 'r','g','b','k','m','c','y'

x = 0:0.1:2*pi;
y = sin(x);

figure('Name','Line Plot Styles');
plot(x,y,'-r','LineWidth',2); hold on;
plot(x,cos(x),'--b','LineWidth',2);
plot(x,sin(2*x),':k','LineWidth',2);
legend('sin(x)','cos(x)','sin(2x)');
xlabel('x'); ylabel('y');
title('Different Line Styles');
grid on;

%% Scatter Plot
% Syntax: scatter(x,y,size,'filled')

x = randn(1,100); y = 2*x + randn(1,100);

figure('Name','Scatter Plot Example');
scatter(x,y,60,'filled','MarkerFaceColor','m','MarkerEdgeColor','k');
xlabel('X Data'); ylabel('Y Data');
title('Scatter Plot with Customization');
grid on;

%% Hist Plot
% Syntax: histogram(data, bins)

data = randn(1,1000);

figure('Name','Histogram Example');
histogram(data,30,'FaceColor','g','EdgeColor','k');
xlabel('Value'); ylabel('Frequency');
title('Histogram with 30 bins');
grid on;

%% Bar Plot
% Syntax: bar(values)

categories = {'A','B','C','D','E'};
values = randi([5 50],1,5);

figure('Name','Bar Chart Example');
bar(values,'FaceColor',[0.2 0.6 0.8]); 
set(gca,'XTickLabel',categories,'FontSize',12);
ylabel('Counts'); title('Bar Chart');
grid on;

%% PIE Chart
% Syntax: pie(values, labels)

values = [20 30 15 35];
labels = {'Physics','Chemistry','Biology','Math'};

figure('Name','Pie Chart Example');
pie(values,labels);
title('Pie Chart Example');

%% Boxplot
% Syntax: boxplot(data)

data = randn(50,3); % 3 groups
figure('Name','Boxplot Example');
boxplot(data,'Labels',{'Group1','Group2','Group3'});
ylabel('Values');
title('Boxplot for Groups');

%% 3D Plots
% 1. Surface Plot: surf(X,Y,Z)
% 2. Mesh Plot: mesh(X,Y,Z)
% 3. Contour Plot: contour(X,Y,Z)
% 4. Plot3: plot3(x,y,z)

[X,Y] = meshgrid(-3:0.1:3,-3:0.1:3);
Z = peaks(X,Y);

figure('Name','3D Surface Plot');
surf(X,Y,Z);
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Surface Plot');
shading interp; 
colormap jet; 
colorbar;

figure('Name','3D Mesh Plot');
mesh(X,Y,Z);
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Mesh Plot');

figure('Name','3D Contour Plot');
contour(X,Y,Z,20);
xlabel('X'); ylabel('Y'); title('Contour Plot');
colorbar;

figure('Name','3D Line Plot');
t = 0:0.1:10;
x = sin(t); y = cos(t); z = t;
plot3(x,y,z,'-r','LineWidth',2);
xlabel('X'); ylabel('Y'); zlabel('Z');
title('3D Line Plot');

%% CUSTOMIZATION
% xlabel('text','FontSize',n,'FontWeight','bold')
% ylabel('text'), zlabel('text')
% title('text','FontSize',n)
% legend('label1','label2',...)
% grid on / off
% axis([xmin xmax ymin ymax])
% xlim([min max]), ylim([min max]), zlim([min max])
% set(gca,'Property',Value)
% set(gcf,'Property',Value)
% colorbar, colormap()
% hold on, hold off

x = 0:0.1:10; y = sin(x);

figure('Name','Customized Plot');
plot(x,y,'-m','LineWidth',2);
xlabel('Time (s)','FontSize',14,'FontWeight','bold');
ylabel('Amplitude','FontSize',14,'FontWeight','bold');
title('Customized Sine Wave','FontSize',16,'FontWeight','bold');
legend('sin(x)','Location','northeast');
grid on;
xlim([0 8]); ylim([-1.5 1.5]);
set(gca,'FontSize',12,'LineWidth',1.5,'Box','on');
colorbar;

%% SAVING FIGURES
% Syntax: print(gcf,'filename','-dpng','-r300') → save as PNG, 300 dpi
% Syntax: saveas(gcf,'filename.fig') → save as MATLAB figure
% Syntax: exportgraphics(gca,'filename.pdf') → save as PDF

figure('Name','Saving Example');
plot(0:0.1:10,sin(0:0.1:10),'-b','LineWidth',2);
title('Save This Figure');
xlabel('X'); ylabel('sin(X)');
print(gcf,'sine_plot','-dpng','-r300'); % high-res PNG
saveas(gcf,'sine_plot.fig');            % MATLAB fig
exportgraphics(gca,'sine_plot.pdf');    % PDF

%% Interactive Plotting

figure('Name', 'Interactive Plotting');

% Create sample data
x = 0:0.1:2*pi;
y = sin(x);

% Create plot with interactive elements
plot(x, y, 'b-', 'LineWidth', 2);
title('Interactive Plot - Try Zoom, Pan, and Data Cursor Tools');
xlabel('X');
ylabel('sin(X)');
grid on;

% Enable interactive tools
zoom on;  % Enable zoom
pan on;   % Enable pan
datacursormode on;  % Enable data cursor

% Add a button for interaction
uicontrol('Style', 'pushbutton', 'String', 'Reset View', ...
    'Position', [20 20 100 30], 'Callback', @resetView);

fprintf('Interactive plot created. Check Figure window.\n');
fprintf('Try using the zoom, pan, and data cursor tools.\n\n');

% Callback function for the reset button
function resetView(~, ~)
    xlim('auto');
    ylim('auto');
end

%% Animation

figure('Name', 'Animation Example');

x = linspace(0, 2*pi, 100);
y = zeros(size(x));
h = plot(x, y, 'r-', 'LineWidth', 2);
title('Sine Wave Animation');
xlabel('X');
ylabel('sin(X + t)');
axis([0, 2*pi, -1.5, 1.5]);
grid on;

% Create animation
for t = 0:0.1:2*pi
    y = sin(x + t);
    set(h, 'YData', y);
    drawnow;
    pause(0.05);
end

fprintf('Animation completed. Check Figure window.\n\n');

%% Practical Data Visualization Examples

% Example 1: Financial data visualization
figure('Name', 'Financial Data Visualization');

% Create sample stock data
dates = datetime(2023, 1, 1):days(1):datetime(2023, 12, 31);
prices = 100 + cumsum(randn(length(dates), 1) * 0.5);

subplot(2, 2, 1);
plot(dates, prices, 'b-', 'LineWidth', 1);
title('Stock Price Over Time');
xlabel('Date');
ylabel('Price');
grid on;

% Example 2: Statistical data visualization
subplot(2, 2, 2);
data = randn(1000, 1);
histogram(data, 30, 'FaceColor', 'g', 'EdgeColor', 'k');
title('Distribution of Data');
xlabel('Value');
ylabel('Frequency');
grid on;

% Example 3: Geographical data visualization
subplot(2, 2, 3);
cities = {'New York', 'London', 'Tokyo', 'Sydney', 'Moscow'};
lat = [40.7, 51.5, 35.7, -33.9, 55.8];
lon = [-74.0, -0.1, 139.8, 151.2, 37.6];
values = [8.5, 9.0, 13.9, 5.3, 12.5];
geoscatter(lat, lon, values*10, values, 'filled');
title('Geographical Data Visualization');
geobasemap('colorterrain');
colorbar;

% Example 4: 3D surface with lighting
subplot(2, 2, 4);
[X, Y] = meshgrid(-2:0.1:2);
Z = sin(X) .* cos(Y);
surf(X, Y, Z, 'EdgeColor', 'none');
title('3D Surface with Lighting');
xlabel('X');
ylabel('Y');
zlabel('Z');
light('Position', [1, 1, 1], 'Style', 'infinite');
lighting gouraud;
material dull;
colorbar;
view(-30, 30);

fprintf('Practical visualization examples created. Check Figure window.\n\n');