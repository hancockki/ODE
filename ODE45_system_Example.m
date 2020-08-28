function ODE45_system_Example

% Approximate the solution of an ODE of the form 

%  x' = ax + by
%  y' = cx + dy

% using ODE45. 
% The function f(t,y) is defined by rhs(t,y)
%
clear all

global a b c d

dt = .01;          % spacing size (Delta t) 
tspan = 0:dt:100;   % values of t defined in tspan 

y0 = 1;           % initial values
x0 = 0;




R0 = [x0;y0];

opts = odeset('abstol',1e-10,'reltol',1e-10);  % set-up tolerences (do not edit this line)
[t Rspan]= ode45(@rhs, tspan,R0,opts);         % Matlab function to solve the IVP

xspan = Rspan(:,1);
yspan = Rspan(:,2);



%plot result
figure(1); clf; % open figure window and clear the window
plot(tspan,yspan,'b','linewidth',2)          % plot approximation 
hold on
plot(tspan,xspan,'r','linewidth',2)          % plot approximation 
xlabel('t ','fontsize',18);
ylabel('x(t),y(t)','fontsize',18);
set(gca,'fontsize',18)
title('u and v with respect to time')

figure(2);clf;
plot(xspan,yspan)
xlabel('x ','fontsize',18);
ylabel('y','fontsize',18);
set(gca,'fontsize',18)
title('u and v phase plane')


%fprintf('\n The end point of the solution is approximated to be: \n ')
%disp(['y(',num2str(t(end)),') = ',num2str(yspan(end))])
%fprintf('\n')

end

% Where you define the "right hand side" of the ODE
function dRdt = rhs(t,R)
global a b c d

x = R(1);
y = R(2);



dxdt = y;
dydt = -(4*y/pi)*atan(y) - x;

dRdt = [dxdt; dydt];

end