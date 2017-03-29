function List = readload(line, List)
% Reads a load

% Hack below deals with this programmer's limited ability to figure
% out matlab's approach to handling lines with mixed text and numbers.
   stuff = sscanf(line, '%s %f %f %f');

% Stuff now has the label, the node number, and the x and y force value.

% Element label of arbitrary length.
   label = sscanf(line, '%s',1);

% Stick in List (an array).
   count = size(List,1) + 1;
   for i=1:3
    List(count,i) = stuff(length(label)+i);
   end











