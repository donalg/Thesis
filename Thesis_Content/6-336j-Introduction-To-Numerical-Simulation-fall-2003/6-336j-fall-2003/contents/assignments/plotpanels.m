function plotpanels(panels)
% PLOTPANELS: plot the panels.
%
% Usage: plotpanels(panels)
%           Input - panels: 3D array of panel informations.

% Find the number of panels.
[row,column,num_panels]=size(panels);

figure(1), clf
for i=1:num_panels
    
    % Find the number of vertices in the panels.
    num_verts=panels(1,1,i);
    
    % Extract the edges.
    x=[panels(2:1+num_verts,1,i); panels(2,1,i)];
    y=[panels(2:1+num_verts,2,i); panels(2,2,i)];
    z=[panels(2:1+num_verts,3,i); panels(2,3,i)];
    
    % Draw a panel.
    line(x,y,z);
    
end