
%% 2.086 RECITATION 2
%  Spring 2013 - modified by J Thangavelautham

%% 
%%---------------------------------------------------------------------%% 
%%Command Window Demo
%%---------------------------------------------------------------------%% 
    
    %%Execution of simple commands, calculator


    2+3

    4*5
 
    80/40
    
    2^9
    
    16^0.25
    
    log(5)

        
%%---------------------------------------------------------------------%% 
%%M-file Demo
%%---------------------------------------------------------------------%% 

    %%Execution of multiple commands, easy editing

    %%File>New>Script
    %%Opens editor where commands can be typed and saved
    
    2+3

    4*5
 
    80/40
    
    2^9
    
    16^0.25
    
    log(5)
    
    %%Saving the script
    
            %%Setting the path
            %%File>Set Path>Add Folder>Close
            %%Name the script Script1.m (no spaces)
            
    %%Running the script        
            
    %Script1
    
    %%Run Button
    %%F5
    
    %%Demo semi-colon to supress output;
    

    
%%---------------------------------------------------------------------%%     
%%Variables and Assignment 
%%---------------------------------------------------------------------%% 
            
   a=5
   b=20
   c=100    
   d=2.5
   
   f=a*b
   
    %%Variables appear in workspace, stored and be used in future commands  
    
    %% Variables can be reassigned

   d=100
   
    %%who command   

   who
   whos
    
    
    %% Data Types

    %%Floating point
    %%Integer
    %%Logical 1,0 True,False
    %%Character
   
    a=true
    b='cow'
    
    
    %Matlab will handle this for you at this point, all variables you work
    %with are double (floating point)
    
    %%Save and clear workspace

    save rec1workspace.mat
    
    clear
    
    load rec1workspace.mat
   
%%---------------------------------------------------------------------%%     
%%Arithmetic Operations
%%---------------------------------------------------------------------%% 

    %%^ / + -
    
    %% Standard order of operations
    
    f=10/5*2^2-6/3
    
    %%Use brackets for clarity
    
    f=(10/5)*(2^2)-(6/3)
    
    %%Break up operations
    
    %%%%
    
    %%More complex math requires matlab functions, intro functions
    
    sin(pi)
    cos(pi)
    exp(1)
    pi-exp(pi)
    tanh(exp(1))
    log(exp(1))
    
    a=sin(pi)
    
    %%demo help command for finding functions (search for tanh, format)
      
    
 %%---------------------------------------------------------------------%%    
 %%Formatting numbers displayed
 %%---------------------------------------------------------------------%% 

 %% Format command - Short
    
    format short
    pi/2
    
% Format command - Long
    format long
    pi/2
    
% Format command - Short Scientific Notation
    format shortE
    100*pi/2
        
% Format command - Long Scientific Notation
    format longE
    100*pi/2    
    

%%---------------------------------------------------------------------%%    
%% Rounding, Floor and Ceil
%%---------------------------------------------------------------------%%
%%  
    %round towards nearest integer 
    round(pi)
    
    %round towards zero 
    fix(pi)
    
    format short
    
    roundn(pi,-2)
    roundn(pi,-3)

    %round to tens
    
    roundn(100*pi,1)
    
    %round to hundreds
    
    roundn(100*pi,2)
    
    %round to thousands
    
    roundn(100*pi,3) 
    roundn(200*pi,3) 
    
   %Round to negative infinity
   
    floor(3.1)
    floor(3.5)
    
   %Round to positive infinity
 
    ceil(3.1)
    ceil(3.5)
    
    
 %%---------------------------------------------------------------------%%    
 %%Relational Logical Operations
 %%---------------------------------------------------------------------%% 

   %% > < >= ==
   
   g=4
   h=4
   i=5
   

     logical1=g>i
     logical2=g<i
     logical3=g==h
     
     

    %%& | ~
    
     g=4
     h=5
     i=6

     logical3=(g<h) & (h>i)

     logical4=(g<h) | (h>i)
     
     %%short circuit || &&

 
%%---------------------------------------------------------------------%% 
%%Flow Control
%%---------------------------------------------------------------------%% 


    %%if statement
    
     j=3

     if j==3

         j=8

     end

     %%-------------%%

     j=4

      if j==3

         j=8

      end

     j=4

     %%-------------%%

     if j==3

         j=8

     elseif j<2

         j=9

     else

         j=10

     end   
     
      %%-------------%%
     
     %%while loop
     
     
    k=0
    
    while k<=10
        
        k=k+1;
        
    end
    
     %%-------------%%
     
    while k<=10
        
        k=k+1;
        
        
        if k==5
            
            break
            
        end
        
    end
    
     %%-------------%%
     
     %%for loop
     
     i=0
     
     
     for k=1:1:3
         
         
         i=i+1
         
     end
            
     
      
     i=0
     
        
     %%-------------%%
       
     i=0
     
     for k=1:2:5
         
         
         i=i+1
         
     end
     
     
     %%Counter can be used within in loop, but cannot be changed!
     %%Mention Debugging
            



