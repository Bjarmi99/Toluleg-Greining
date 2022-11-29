function y=eulerstep(t,x,h)
y=x+h.*ydot(t,x);
end