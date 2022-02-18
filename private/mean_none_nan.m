function [out_var] = mean_none_nan(in_var)

% in_var = in_var(in_var(:)~=0.0);
in_var = in_var(~isnan(in_var(:)));
out_var = mean(in_var);