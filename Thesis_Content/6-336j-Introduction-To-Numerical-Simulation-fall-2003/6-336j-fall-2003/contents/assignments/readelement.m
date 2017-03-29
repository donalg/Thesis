function [List,maxnode] = readelement(line,List,terms,maxnode)
% Reads an element with terms terminals described on line into List.

% Hack below deals with this programmer's limited ability to figure
% out matlab's approach to handling lines with mixed text and numbers.
   stuff = sscanf(line, '%s %f %f %f %f %f');
   if (terms > 4) 
     disp('Can not handle elements with more than four terminals.');
     break;
   end

% Stuff now has the label, the node numbers, and the value.

% Element label of arbitrary length.
   label = sscanf(line, '%s',1);

% Stick in List (an array).
   count = size(List,1);
   count = count +1; 
   for i=1:terms
    List(count,i+1) = stuff(length(label)+i);
    maxnode = max(List(count,i+1),maxnode);
   end
   List(count,1) = stuff(length(label)+terms+1);

