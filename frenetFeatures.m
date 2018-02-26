function [ka,ta, na, Geo_ds]= frenetFeatures (curve)

[qt,binormal, pnormal, Geo_ds]=  frenet(curve'); % Extract the Frenet features


Gqt=gradient(qt);
Gbi=gradient(binormal);
Gpn=gradient(pnormal);

ka=sqrt(Gqt(1,:).^2+Gqt(2,:).^2+Gqt(3,:).^2);
ta=sqrt(Gbi(1,:).^2+Gbi(2,:).^2+Gbi(3,:).^2);
na=sqrt(Gpn(1,:).^2+Gpn(2,:).^2+Gpn(3,:).^2);
 
