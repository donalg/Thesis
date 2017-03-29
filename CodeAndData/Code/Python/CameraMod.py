'''
This file is to define a camera object for use with the transfer from images to 3d models

Requirements: 
    Special Image formats (to be advised)
    Origin object image file (will have to be compared for DOF and stability of location)
    Images without object to be moddelled input (as to define a means of defining what to spend computational effort on)
    Images with the object to be modelled in plave (without moving origin definitions)
    
Process: 
    Read in and clarify (determine stability of measurements i.e. error analysis) the search objet (origin definition)
    Read in images without object in place to be modelled define base line system regions of unknown or undefined areas. 
    Read in images with object to be modelled 

'''