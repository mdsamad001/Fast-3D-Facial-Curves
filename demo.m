%%%%%%%%%%%%%%%%

%

% Please cite the following paper

% M. Samad and K. Iftekharuddin, Frenet frame-based generalized space curve 
% representation for pose invariant classification and recognition of 3D Face. IEEE Transactions on
% Human-Machine Systems (THMS), vol. 46, no. 4, pp. 522 - 533, 2016.

% Contact: manar.eee@gmail.com

clc
clear all
close all
clf
% Load from files and folders
faceFolder = 'faceFolder/'; 
fileType = '.wrl';
folderContent = dir([faceFolder,'*',fileType]);
addpath('faceFolder/');
% number of faces in the folder
nface = size (folderContent,1); 

for k = 1:nface
    
    % Extract 3D vertices from 3D facial data
    string = folderContent(k,1).name;
    vertex = read3Dwrl(string);
    
    % Resample 3D point cloud on a uniformly sampled grid of 
    % res-by-res dimension
    res = 100;    
    
    % Selection for 3D facial curve type
    % sel = 1 for radial curves and sel = 2 for iso-geodesic curves
    sel = 2; 
    
    % Space curve level sets. For radial curves it can go from zero degree 
    % up to 360 at, e.g., 30 degree intervals.For iso-geodesic curves 
    % it starts at 0 (nosetip)and can go at arbitrary distance below, 
    % e.g., 0:15:45
    
    % Try this for iso-geodsic curves, sel = 2
    %lvSet = 0:5:60;
    
    % Level set for radial curves
    % 0:30:210 Total 8 curves starting 
    % from 0 degree to 210 degrees 
    lvSet = 0:10:60; 
    
    % Number of uniformly spaced points per curve (only for radial curves)
    npt = 20;
    
    % Extract 3D facial curves
    curvSet = exFacialCurve(vertex, res, sel, lvSet, npt);
    
    % Visualize extracted facial curves on the 3D face
    visualizeCurve(vertex, res, curvSet);
    
end

% Example for one single test 3D curve

% Compute frenet-based geometric features for the 6-th 3D space curve
curve = curvSet{6,1};

% Visualizing the frenet-frame vectors on the 3D space curve
figure;
visualizeFrenet(curve);

% ka = curvature at each point of the 3D space curve, change in tangent
% ta = Torsion at each point of the 3D space curve, change in binormal vec
% na = Change in normal vector
% geoDis = piece-wise geodesic distance 
[ka,ta, na, geoDis]= frenetFeatures (curve);

figure;
subplot(3,1,1),plot(ka,'ro-')
title ('Curvature at each point of the curve')
subplot(3,1,2),plot(ta,'g*-')
title ('Torsion at each point of the curve')
subplot(3,1,3), plot(geoDis,'s-')
title ('Piece-wise geodesic distance between two consequtive points of the curve')


