function mit18086_linpde_fourier
%MIT18086_LINPDE_FOURIER
%    Solves the linear initial value problems u_t=u_x,
%    u_t=u_xx, u_t=u_xxx and u_t=u_xxxx on [-pi,pi] by a
%    Fourier series approach, all starting with identical
%    initial conditions.

% 02/2007 by Benjamin Seibold
% Feel free to modify for teaching and learning.

n = 5;                         % number of Fourier coefficients
c = [.5 2/pi*j.^(0:n-2)./(1:n-1).*mod(1:n-1,2)]; % box function
x = linspace(-pi,pi,1000);
u0 = real(c*exp(j*(0:n-1)'*x));
for t = 0:.01:1                        % time steps to be shown
   clf
   for nd = 1:4
      subplot(2,2,nd)
      ct = c.*exp((j*(0:n-1)).^nd*t);
      plot(x,u0,'b:',x,real(ct*exp(j*(0:n-1)'*x)),'r-')
      axis([-pi pi -.5 1.5])
      title(sprintf('u_t = u_{%dx}',nd))
   end
   drawnow
end
