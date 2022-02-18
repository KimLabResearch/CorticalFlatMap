

# Cortical Flatmap
This code here is designed to generate a flatmap visual representation with a image that is registered (transformed) to the Allen CCF.   

## How to use
- Download the required asset from https://kimlab.io/data_share/files/NVU_young/Code_S2_Cortical_Flat_Map_NaN.zip
- flat_map_data_20um_v2.mat
- flat_map_data_10um_v2.mat
- allen_20_anno_16bit.nii
- allen_10_anno_16bit.nii
- 16bit_allen_csv_20200916.csv
- Open *RUN_THIS_FILE.m*  in Matlab. Edit the setting to locate your input image. Run the script.  The script will gives you a *.nii*  file as the flatmap. 
- Download the media asset from https://kimlab.io/data_share/files/NVU_young/Code_S2_Cortical_Flat_Map_NaN.zip to help your publication illustration

## Setting
*input_immage*
- The image have to be registered to Allen CCF with upright coronal posterial to anterial both nii and tif are okay

***output_folder***
- output location

***output_name***
- name here is used as prefix for the final file name output will be nii

***gaussian_preprocessing_pix***
- gaussian_preprocessing_pix = 0; no preprocessing
- gaussian_preprocessing_pix = 4; 4 pixel blurring

***projection_math***
- projection_math = 'maximum'; maximum
- projection_math = 'average'; average

***layer_specific***
- layer_specific = 0 meaning all layers together
- layer_specific = 1 meaning you want to plot layer specific map

***Layer_specific_list*** 
- Layer_specific_list =  {["1" ], ["2", "3", "4" ], ["5" ], ["6" ]}; pick layers


## Limitations
- The brain need to oriented as x(image top to down) = D->V, y(image left to right)  = L->R, z(image stack) = P->A.
- The image need to be exact dimetion as the Allen CCF
- The input image can be 10x10x10 um or 20x20x20 um 

## Environment
Matlab 2019a

## Liscense
Free academic use.
