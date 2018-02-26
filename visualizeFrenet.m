function visualizeFrenet(curve)

curve = curve';

[qt, binor, pnor, ~] =  frenet(curve);

plot3(curve(1,:),curve(2,:),curve(3,:), 'ro-');
hold on
quiver3(curve(1,:),curve(2,:),curve(3,:), qt(1,:),qt(2,:),qt(3,:),0.5);
quiver3(curve(1,:),curve(2,:),curve(3,:), binor(1,:),binor(2,:),binor(3,:),0.2);
quiver3(curve(1,:),curve(2,:),curve(3,:), pnor(1,:),pnor(2,:),pnor(3,:),0.2);

legend('Curve', 'Tangent Vector', 'Binormal vector', 'Principal normal vector')
title ('Frenet frames at each point of the extracted curve')
box on