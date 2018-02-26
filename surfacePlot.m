
function [qx33, qy33, qz33] =  surfacePlot(VM, res)

if size (VM,1)==3
    VM =VM';
end

x3=VM(:,1);
y3=VM(:,2);
z3=VM(:,3);

x3 = x3-x3(z3==max(z3));
y3 = y3-y3(z3==max(z3));
z3 = z3-z3(z3==max(z3));

[qx33,qy33] = meshgrid(linspace(min(x3),max(x3), res),linspace(min(y3),max(y3),res));
qz33=griddata(x3,y3,z3,qx33,qy33,'linear');
%qmin=min(min(qz33));
%qz33(isnan(qz33))=qmin;