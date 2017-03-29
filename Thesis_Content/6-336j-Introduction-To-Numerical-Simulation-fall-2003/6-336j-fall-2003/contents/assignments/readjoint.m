function [List,maxjoint] = readjoint(line, List, maxjoint)
% Reads a joint.

% Hack below deals with this programmer's limited ability to figure
% out matlab's approach to handling lines with mixed text and numbers.
   stuff = sscanf(line, '%s %f %f %f');

% Stuff now has the label, the node number, and the x and y positions.

% Element label of arbitrary length.
   label = sscanf(line, '%s',1);

% Stick in List (an array).
   n = stuff(length(label) + 1);
   maxjoint = max(n, maxjoint);
   List(n,1) = stuff(length(label)+2);
   List(n,2) = stuff(length(label)+3);

