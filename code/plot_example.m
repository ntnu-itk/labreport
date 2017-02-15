%% Example data
t = linspace(0,5,200);

y1 = 2*sin(3*t + 2);
y2 = y1 + 0.3*randn(size(t));

%% Define figure size
width = 10; % cm
height = 10; % cm
fontsize = 10; % points
x = 20; y = 20; % Where on the screen the plot will appear, not important.

set(0,'DefaultTextInterpreter', 'latex') % Interpret (most) text as LaTeX.

%% Set up the figure
fig1 = figure(1);
fig1.Units = 'centimeters';
fig1.Position = [x y width height];

%% Plot the data
plot(t,y1,t,y2);

%% Set up the properties of the axes
% One figure can have multiple axes, for example if we use subplot
ax = gca; %get the axes handle of the current axes
% Set the fontsize and units correctly
ax.FontUnits = 'points';
ax.FontSize = fontsize;
% (not important) Change the 'ticks' on the y label
ax.YTick = -pi:(pi/2):pi;
ax.YTickLabel = {'$-\pi$', '$-\frac{\pi}{2}$','$0$','$\frac{\pi}{2}$','$\pi$'};
ax.TickLabelInterpreter = 'latex'; %Interpret Tick labels as latex
% Label the axes, set up legend and title
xlabel('Time [s]')
ylabel('$\psi$ [rad]')
legend('Filtered \psi', 'Measured \psi', 'Location','NorthEast')
title('Heading')
ax.TitleFontSizeMultiplier = 1.1; %Set title to be 1.1 times larger than other fonts

%% Export the figure
hgexport(fig1,'heading_plot.eps')
% optional: save the fig, for later customization: 
% saveas(fig1,'heading_plot.fig')
% optional: save the data, for later plot reproduction:
% save('myAwesomeData.mat','t','y1','y2');

%% (not important) Uncomment these lines if you want to set up different settings for the exported figure than for the figure plotted in matlab
% plotStyle = hgexport('factorystyle');
% plotStyle.Format = 'eps';
% plotStyle.Width = 10;
% plotStyle.Height = 10;
% plotStyle.FontMode = 'Fixed';
% plotStyle.FixedFontSize = 10;
% hgexport(fig1,'heading_plot.eps', plotStyle)

