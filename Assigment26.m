% Approximate the solution of an ODE of the form y' = f(t,y) using ODE45. 
% The function f(t,y) is defined by rhs(t,y)
function ODE45_Example

  dt = .1;          % spacing size (Delta t) 
  tspan = 0:dt:5;   % values of t defined in tspan 
  y0 = 0;           % initial value

  opts = odeset('abstol',1e-10,'reltol',1e-10);  % set-up tolerences (do not edit this line)
  [t yspan]= ode45(@rhs, tspan,y0,opts);         % Function to solve the IVP (do not edit this line)
  
   matrix1 = [0,0.5,1,1.5,2,2.5,3,3.5,4,4.5,5]

  matrix2 = [0,1.5,3.375,2.5546,3.34,2.59,3.32,2.62,3.30,2.64,3.289] 
  %plot result
  figure(3); clf;                                % open figure window and clear the window
  plot(tspan,yspan, 'r','linewidth',3, matrix1, matrix2, 'o');         % plot approximation 
  set(gca,'fontsize',18);
  xlabel('t ','fontsize',18);
  ylabel('y(t)','fontsize',18);



  %printing the end point
  fprintf('\n The end point of the solution is approximated to be: \n ');
  disp(['y(',num2str(t(end)),') = ',num2str(yspan(end))]);  %Prints the end point in the command window
  fprintf('\n');                                            %Prints a new line
  
end


% Where you define the "right hand side" of the ODE
function dydt = rhs(t,y)
  dydt = (3-y)*(y+1);
end
