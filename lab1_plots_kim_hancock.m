

t = 0:0.01:3;

y = 0.02*t.^2 + 1;

figure(1);clf;
plot(t,y,'linewidth',2, 'g')
set(gca,'fontsize',18);
xlabel('t','fontsize',18);
ylabel('y','fontsize',18);

