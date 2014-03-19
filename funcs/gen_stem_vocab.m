function [newvocab, idx_map] = gen_stem_vocab(vocab)
%GEN_NEW_VOCAB Generate new vocabulary using stemmer.


num_vocab = length(vocab);
% vocab_stem = vocab;
vocab_new = cell(1, num_vocab);
% vocab_new{1} = porterStemmer(vocab{1});
idx_map = zeros(1, num_vocab);
% vocab_same_stem_store = cell(1, num_vocab);
idx = 1;
% m=1;
for i = 1:num_vocab
    %letter_lower = lower(letter);   % lower case
    %letter = strtrim(letter_lower); % 裁切开头和尾部的空格，tab，enter
    letter_stem = porterStemmer(vocab{i});
    %vocab_stem{i} = letter_stem;
    flag = strcmp(letter_stem, vocab_new);
    
    if sum(flag) == 0
        vocab_new{idx} = letter_stem;
        idx_map(i) = idx;
        idx = idx+1;
    else
        idx_map(i) = find(flag == 1);
 %      vocab_same_stem_store{m} = letter_stem;
 %      m = m+1;
    end
end

newvocab = vocab_new(1:idx-1);
%num_vocab_result = idx-1;