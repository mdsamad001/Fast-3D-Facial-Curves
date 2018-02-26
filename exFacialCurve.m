function cdata = exFacialCurve (vertex, varargin)

%%%%%%%%%%%%% Upsample 3D face %%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Step 01%%%%%%%%%% Map the 3D face on n-by-n grid%%%%
%%%%%To allow a common topology for all 3D point clouds%%
        
if nargin > 1
    
res = cell2mat(varargin(1));
p = cell2mat(varargin(2));
rp = cell2mat(varargin(3));
npt = cell2mat(varargin(4));
else
disp('Using default parameters');    
res = 100;
p = 2; 
rp = 30:10:70;
end

nth = rp;
[qx, qy, qz] =  surfacePlot(vertex, res);
[th,phi,r] = cart2sph(qx(:),qy(:),qz(:));
%[xx1,yy1,zz1] = sph2cart(th,phi,r);
    
th = th(~isnan(r));
phi = phi(~isnan(r));
r = r(~isnan(r));
%cdata = cell(1,100);
if p == 1

   for t=1:length(nth)
   piu = nth(t);
   
    if piu>180
      theta = (180-piu)/57.7;
    else
      theta = piu/57.7;
    end 

    xc= th(th>theta & th<theta+0.05);
    yc = phi(th>theta & th<theta+0.05);
    zc = r(th>theta & th<theta+0.05);
    [xx,yy,zz]=sph2cart(xc,yc,zc);
    cdata = [xx yy zz];
    cdist = cat(1,0,cumsum(sqrt(sum(diff(cdata,[],1).^2,2))));
    ccurve = interp1(cdist, cdata, linspace(0,cdist(end),npt),'pchip');
    cdata1 (t,:) = {ccurve};
    
   end
   cdata = cdata1;
   
else

    for t=1:length(nth)
    lev = nth(t);
    xc = th(r>lev & r<lev+2);
    yc = phi(r>lev & r<lev+2);
    zc = r(r>lev & r<lev+2);
    [xx,yy,zz] = sph2cart(xc,yc,zc);
    cdata2 (t,:) = {[xx yy zz]};
    end

cdata = cdata2;
end


