function [counts_new] = gen_stem_counts(counts, idx_map)
%GEN_NEW_COUNTS Generate new counts using new vocabulary mapping matrix.
[num_obs,num_vocab] = size(counts);
maxidx = max(idx_map);
counts_new = zeros(num_obs, maxidx);

tic;
for i = 1:num_vocab
        counts_new(:,idx_map(i)) = counts_new(:,idx_map(i)) + counts(:,i);    
end
toc;
counts_new = sparse(counts_new);


