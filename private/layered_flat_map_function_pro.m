function [] = layered_flat_map_function_pro(image_to_project, out_file_name, layer_wanted,projection_math,gaussian_preprocessing_pix)

%image_to_project = 'D:\MATLAB\20200924_YTW_NII_accumulation\4_young_vess_20201221.nii';
%out_file_name = '4_young_vess_20201221_flat.nii';
output_pixel_size = 20; %in um


matlab_plot_map = 0;
out_file = 1;
castingg_int16_to_uint16 = 1;

%layer_wanted = ["2", "3", "4" ];



roi_id_list = [];
for ii = 1:length(layer_wanted)
    roi_id_list = [roi_id_list;find_layer_spec_id(layer_wanted(ii))];
end



%%
shrink_ratio = 10./output_pixel_size;

S = regexp(image_to_project,'\.','split');
switch S{end}
    case 'nii'
        data_to_project = niftiread(image_to_project);
    case 'tif'
        data_to_project = FastTiff(image_to_project);
        data_to_project = permute(data_to_project, [2,1,3]);
    case 'tiff'
        data_to_project = FastTiff(image_to_project);
        data_to_project = permute(data_to_project, [2,1,3]);
    otherwise
        error('file type is not nii or tif')
end


switching_handle = 0;
if isequal(size(data_to_project), [450 650 750])
    switching_handle = 1;
end
if isequal(size(data_to_project), [570 400 660])
    switching_handle = 2;
end
if isequal(size(data_to_project), [1140 800 1320])
    switching_handle = 3;
end
if isequal(size(data_to_project), [450 650 300])
    switching_handle = 4;
end


switch switching_handle
    case 1
        fprintf('Kim lab 20x20x20 um refernce size detected\n')
        if gaussian_preprocessing_pix~=0
            data_to_project = imgaussfilt3(data_to_project,gaussian_preprocessing_pix./2);%%%%%
        end
        data_to_project = data_to_project(26:425, 41:610, :);
        data_to_project = flip(data_to_project,1);
        data_to_project = flip(data_to_project,3);
        data_to_project = permute(data_to_project, [2,1,3]);
        data_to_project = data_to_project(:,:,36:696);
        
        anno = niftiread('allen_20_anno_16bit.nii');
        anno = flip(anno,3);
        flag = ismember(anno(:), roi_id_list);
        data_to_project(~flag) = nan;
        
        data_to_project = (data_to_project(1:end./2,:,:)+flip(data_to_project(end./2+1:end,:,:),1))./2;
        data_to_project = padarray(data_to_project,[1 1 0],0,'post');
        flat_map_data = load( 'flat_map_data_20um_v2.mat');
        plotting_1 = flat_map_data.plotting_1_20;
        plotting_2 = flat_map_data.plotting_2_20;
        pre_flat_index = flat_map_data.pre_flat_index_20;
        
        
    case 2
        fprintf('Allen 20x20x20 um refernce size detected\n')
        if gaussian_preprocessing_pix~=0
            data_to_project = imgaussfilt3(data_to_project,gaussian_preprocessing_pix./2);%%%%%
        end
        anno = niftiread('allen_20_anno_16bit.nii');
        flag = ismember(anno(:), roi_id_list);
        data_to_project(~flag) = nan;
        
        data_to_project = flip(data_to_project,3);
        data_to_project = (data_to_project(1:end./2,:,:)+flip(data_to_project(end./2+1:end,:,:),1))./2;
        data_to_project = padarray(data_to_project,[1 1 1],0,'post');
        
        flat_map_data = load( 'flat_map_data_20um_v2.mat');
        plotting_1 = flat_map_data.plotting_1_20;
        plotting_2 = flat_map_data.plotting_2_20;
        pre_flat_index = flat_map_data.pre_flat_index_20;
        
        
    case 3
        fprintf('Allen 10x10x10 um refernce size detected\n')
        if gaussian_preprocessing_pix~=0
            data_to_project = imgaussfilt3(data_to_project,gaussian_preprocessing_pix);%%%%%
        end        
        anno = niftiread('allen_10_anno_16bit.nii');
        flag = ismember(anno(:), roi_id_list);
        data_to_project(~flag) = nan;
        
        data_to_project = flip(data_to_project,3);
        data_to_project = (data_to_project(1:end./2,:,:)+flip(data_to_project(end./2+1:end,:,:),1))./2;
        data_to_project = padarray(data_to_project,[1 1 1]);
        
        flat_map_data = load( 'flat_map_data_10um_v2.mat');
        plotting_1 = flat_map_data.plotting_1;
        plotting_2 = flat_map_data.plotting_2;
        pre_flat_index = flat_map_data.pre_flat_index;
        
        
        
    case 4
        
        fprintf('Kim lab 20x20x50 um refernce size detected\n')
        anno = niftiread('allen_20_anno_16bit_kim.nii');
        flag = ismember(anno(:), roi_id_list);
        data_to_project(~flag) = nan;
        data_to_project = imresize3(data_to_project,size(data_to_project).*[1 1 2.5]);
        if gaussian_preprocessing_pix~=0
            data_to_project = imgaussfilt3(data_to_project,gaussian_preprocessing_pix./2);%%%%%
        end        
        
        flat_map_data = load( 'flat_map_data_20um_v2.mat');
        
        data_to_project = data_to_project(26:425, 41:610, :);
        data_to_project = flip(data_to_project,1);
        data_to_project = flip(data_to_project,3);
        data_to_project = permute(data_to_project, [2,1,3]);
        data_to_project = (data_to_project(1:end./2,:,:)+flip(data_to_project(end./2+1:end,:,:),1))./2;
        data_to_project = data_to_project(:,:,36:696);
        data_to_project = padarray(data_to_project,[1 1 0],0,'post');
        
        plotting_1 = flat_map_data.plotting_1_20;
        plotting_2 = flat_map_data.plotting_2_20;
        pre_flat_index = flat_map_data.pre_flat_index_20;
        
        
    otherwise
        image_stack_size = size(data_to_project)
        error('no usable refernce size found');
end

if castingg_int16_to_uint16
    if isa(data_to_project,'int16')
        data_to_project = reshape(typecast(data_to_project(:),'uint16'),size(data_to_project));
    end
end

data_to_project = double(data_to_project);

flat_xxx = plotting_1-min(plotting_1);
flat_yyy = plotting_2-min(plotting_2);

flat_xxx = ceil(flat_xxx.*shrink_ratio)+1;
flat_yyy = ceil(flat_yyy.*shrink_ratio)+1;

flat_map_size = [max(flat_xxx), max(flat_yyy)];
flat_inx = sub2ind(flat_map_size, flat_xxx, flat_yyy);

[C,~,IC] = unique(flat_inx);

switch projection_math
    case 'maximum'
        accumulated = accumarray(IC, data_to_project(pre_flat_index),[], @max_none_nan);
    case 'average'
        accumulated = accumarray(IC, data_to_project(pre_flat_index),[], @mean_none_nan);
end

final_projection  = zeros(flat_map_size);
final_projection(C) = accumulated;
final_projection(isnan(final_projection(:))) = 0;

if matlab_plot_map
    x_tick_original = [0:100:max(plotting_1)];
    for ii = 1:length(x_tick_original)
        x_tick_original_string_cell{ii} = num2str(x_tick_original(ii).*0.01);
    end
    y_tick_original = [flip(-100:-100:min(plotting_2)), 0:100:max(plotting_2)];
    for ii = 1:length(y_tick_original)
        y_tick_original_string_cell{ii} = num2str(y_tick_original(ii).*0.01);
    end
    figure
    imagesc(final_projection)
    axis equal
    yticks((x_tick_original-min(plotting_1)).*shrink_ratio)
    yticklabels(x_tick_original_string_cell)
    
    xticks((y_tick_original-min(plotting_2)).*shrink_ratio)
    xticklabels(y_tick_original_string_cell)
end
if out_file
    S = regexp(out_file_name,'\.','split');
    switch S{end}
        case 'nii'
            niftiwrite(final_projection',out_file_name);
        case 'tif'
            imwrite(uint16(final_projection),out_file_name);
        case 'tiff'
            imwrite(uint16(final_projection),out_file_name);
        otherwise
            error('file type is not nii or tif')
    end
end