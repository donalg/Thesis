fid = fopen(file, 'r');
% Global vector to store the Joints.
clear Joints;
global Joints;
% Joints = [];

% Global vector to store struts.
clear global Struts;
Struts = [];

% Global vector to store struts.
clear global Loads;
Loads = [];

% Counter which keeps track of the maximum joint number.
maxjoint = 0;

% Parameters 
maxNewtonIters = 50;
RelTol = 1.0e-6;

% Read the file, line by line, and dispatch based on first character on line.
while 1
  line = fgetl(fid);
  if ~isstr(line), break, end
  if length(line) ~= 0, 
    if(strcmp(line(1),'j') > 0) 
      [Joints,maxjoint] = readjoint(line, Joints, maxjoint);
    elseif(strcmp(line(1),'s') > 0) 
      Struts = readstrut(line, Struts);
    elseif(strcmp(line(1),'l') > 0) 
      Loads = readload(line, Loads);
    end
  end
end

% Force allocate matrix of size NxN, where N is equal to the maximum joint
% number.
clear global Matrix;
clear global RHS;
Matrix(2 * maxjoint,2 * maxjoint) = 0; 
RHS(2 * maxjoint) = 0;
Matrix = zeros(2*maxjoint, 2*maxjoint); 
RHS = zeros(1,2*maxjoint); 
x = zeros(1,2 * maxjoint); 

% Global Circuit Description
% global Struts Joints Loads;
