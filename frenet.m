function [qt, binormal, pnormal, Geo]=  frenet(input)



x_dot=gradient(input);
x_dot_dot=gradient(x_dot);

x_dot_mag=sqrt(x_dot(1,:).^2+x_dot(2,:).^2+x_dot(3,:).^2);

bi=cross(x_dot,x_dot_dot);
bi_mag=sqrt(bi(1,:).^2+bi(2,:).^2+bi(3,:).^2);

for i=1:size(x_dot,2)
    tangent_x(:,i)=x_dot(:,i)./x_dot_mag(i);
    binormal(:,i)=bi(:,i)./bi_mag(i);
    %crVature(i)=(bi_mag(i))./(x_dot_mag(i)).^3;
end

pnormal=cross(binormal,tangent_x);

%Geodesic length at different point instance 
qt=tangent_x;

for i=1:size(x_dot,2)-1
    Geo(i)=acos(qt(:,i)'*qt(:,i+1));
end
