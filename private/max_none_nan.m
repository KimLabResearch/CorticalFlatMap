function [out_var] = max_none_nan(in_var)

% in_var = in_var(in_var(:)~=0.0);
in_var = in_var(~isnan(in_var(:)));
out_var = max(in_var);