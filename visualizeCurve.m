
function visualizeCurve (vertex,res,curveSet)

[qx, qy, qz] =  surfacePlot(vertex, res);
[th,phi,r] = cart2sph(qx(:),qy(:),qz(:));
[xx1,yy1,zz1] = sph2cart(th,phi,r);
    
plot3(xx1, yy1, zz1,'ro');
    
for k = 1: length(curveSet)
  
    curve = curveSet{k,1};
    hold on
    plot3(curve(:,1),curve(:,2),curve(:,3),'ks');

end    