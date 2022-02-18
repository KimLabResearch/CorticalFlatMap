function [] = cortical_flat_mapping(input_immage,output_folder,output_name,gaussian_preprocessing_pix,projection_math,layer_specific,Layer_specific_list)

mkdir(output_folder);

switch layer_specific
    case 0
            out_file_name = [output_folder, '/',  output_name,'_', projection_math, '.nii'];
            layered_flat_map_function_pro(input_immage, out_file_name, ["1", "2", "3", "4", "5", "6" ],projection_math,gaussian_preprocessing_pix)
    case 1

        for ii = 1:length(Layer_specific_list)
            out_file_name = strjoin([output_folder, '/',  output_name, '_', strjoin(Layer_specific_list{ii},'_'), '_', projection_math,'.nii'],'');
            layered_flat_map_function_pro(input_immage, out_file_name, Layer_specific_list{ii},projection_math,gaussian_preprocessing_pix)
        end
        
end