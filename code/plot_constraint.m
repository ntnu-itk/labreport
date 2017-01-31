% Plot a figure with some Latex in the labels
l = linspace(70,170)*pi/180;
a = 0.2;
b = 20;
l_b = 2*pi/3;

e = a*exp(-b*(l-l_b).^2);

l_deg = l*180/pi;
e_deg = e*180/pi;

figure(1)
plot(l_deg,e_deg, 'LineWidth', 2)

handles(1) = xlabel('$\lambda$/degrees');
handles(2) = ylabel('$e$/degrees');
set(handles, 'Interpreter', 'Latex');