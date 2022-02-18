
# Cortical Flatmap
This code here is designed to generate a flatmap visual representation with a image that is registered (transformed) to the Allen CCF.   

## How to use
- Open *RUN_THIS_FILE.m*  in Matlab. Edit the setting to locate your input image. Run the script.  The script will gives you a *.nii*  file as the flatmap. 


%% Setting

input_immage = 'E:\cell_counted_ref_space-artery.nii';
% The image have to be registered to Allen CCF with upright coronal
% posterial to anterial
% both nii and tif are okay

output_folder = pwd;
output_name = 'testing';
% name here is used as prefix for the final file name
% output will be nii

gaussian_preprocessing_pix = 0;
% gaussian_preprocessing_pix = 0; no preprocessing
% gaussian_preprocessing_pix = 4; 4 pixel blurring

projection_math = 'maximum';
% projection_math = 'maximum'; maximum
% projection_math = 'average'; average

layer_specific = 0;

Layer_specific_list =  {["1" ], ["2", "3", "4" ], ["5" ], ["6" ]};
% Layer_specific_list =  {["1" ], ["2", "3", "4" ], ["5" ], ["6" ]}; pick layers


## Limitations
- The brain need to oriented as x(image top to down) = D->V, y(image left to right)  = L->R, z(image stack) = P->A.
- The image need to be exact dimetion as the Allen CCF
- The input image can be 10x10x10 um or 20x20x20 um (or 20x20x50 with our particular padding)

## Environment
Matlab 2019a

## Liscense
Free academic use.
