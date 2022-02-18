
# Cortical Flatmap
This code here is designed to generate a flatmap visual representation with a image that is registered (transformed) to the Allen CCF.   

## How to use
- Open *RUN_THIS_FILE.m*  in Matlab deepens on what kind of projection you need. Edit *image_to_project* to locate your input image. Run the script.  The script will gives you a *.nii*  file as the flatmap. 

## Limitations
- The brain need to oriented as x(image top to down) = D->V, y(image left to right)  = L->R, z(image stack) = P->A.
- The image need to be exact dimetion as the Allen CCF
- The input image can be 10x10x10 um or 20x20x20 um (or 20x20x50 with our particular padding)

## Environment
Matlab 2019a

## Liscense
Free academic use.
