function [out_var] = sum_none_nan(in_var)

% in_var = in_var(in_var(:)~=0.0);
in_var = in_var(~isnan(in_var(:)));
out_var = sum(in_var);