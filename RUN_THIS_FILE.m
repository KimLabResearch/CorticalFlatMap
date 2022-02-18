clear

% Cortical flat map by Yuan-Ting Wu
% Ver. 0.990
% Currently only work with Allen CCFv3 Structure


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



%% pipeline

cortical_flat_mapping(input_immage,output_folder,output_name,gaussian_preprocessing_pix,projection_math,layer_specific,Layer_specific_list);
