function matrix = collocation(panels,centroids)
% Fills in matrix relating panel charges to collocation point potentials.
% Panel is stored as 3-D array
% [panel verts, cond num, 0]
% [vert 1 x,y,z]
% [vert 2 x,y,z]
% [vert 3 x,y,z]
%
%
% [vert verts x,y,z]
% Centroids stored as a matrix with 3 columns.
% [vert 1 x,y,z]
% [vert 2 x,y,z]
% [vert 3 x,y,z]
%
%
% Setting up the collocation matrix
 [rows,cols,numpanels] = size(panels);
 for i=1:numpanels
   numverts = panels(1,1,i);
   panel = panels(2:numverts+1,:,i);
   [area, collocpt, Z, fss] = calcp(panel, centroids);
   matrix(:,i) = fss';
 end

