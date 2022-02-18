function [roi_id_list] = find_layer_spec_id(layer_wanted)

%layer_wanted = '6a'


csv_numbers = readmatrix('16bit_allen_csv_20200916.csv');
csv_string = readmatrix('16bit_allen_csv_20200916.csv','OutputType', 'string');

csv_numbers = csv_numbers(7:379,:);
csv_string = csv_string(7:379,:);

finding_strings_match = strfind(csv_string(:,3),num2str(layer_wanted)); 

flag = false(size(finding_strings_match));

for ii = 1:length(finding_strings_match)
    if ~isempty(finding_strings_match{ii})
        flag(ii) = 1;
    end
end

roi_id_list = csv_numbers(flag,1);
%csv_string(flag,2)