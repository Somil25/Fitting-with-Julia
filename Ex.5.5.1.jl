
##Exercise 5.5-1
# function of the form y = ae^x + b sin(4x) that best fits the given data
using LinearAlgebra
# Ax=r (*Least squares with non-polynomials*)
A=zeros(2,2); # Constructing A
xi=[1 ,2, 3, 4, 5] #data
A[1,1]=sum(x->((exp(x))^2),xi)
A[1,2]=sum(x->(exp(x)*sin(4*x)),xi)
A[2,1]=sum(x->(exp(x)*sin(4*x)),xi)
A[2,2]=sum(x->((sin(4*x))^2),xi)
A

y=[-4 ,6, -1, 5 ,20] #data
r=zeros(2,1) # Constructing r
time=[i for i=1:5];
r[1]=dot(y,map(xi->exp(xi),time))
r[2]=dot(y,map(xi->sin(4*xi),time));
r

A\r # computing x (parameters a & b)

using PyPlot # make sure to use before plotting
f(x)=0.10433380823831859*exp(x)+ 5.224957549065798*sin(4x) # Best Fit Function
xaxis=1:1:5
yvals=map(t->f(t),xaxis)
plot(xaxis,yvals,label="Least squares approximation") # Best fit function plot
plot(xi,y,label="data") # data plot
xlabel("X-axis")
ylabel("Y-axis")
legend(loc="upper center");
