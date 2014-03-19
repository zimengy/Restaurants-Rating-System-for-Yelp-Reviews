function [info_gains, index] = fs_IG(x,y)

info_gains = zeros(1, size(x,2));

% calculate H(y)
classes = unique(y);
hy = 0;
for c=classes'
    py = sum(y==c)/size(y,1);
    hy = hy + py*log2(py);
end
hy = -hy;

% iterate over all features (columns)
for col=1:size(x,2)

    features = unique(x(:,col));

    % calculate entropy
    hyx = 0;
    for f=features'

        pf = sum(x(:,col)==f)/size(x,1);
        yf = y(x(:,col)==f);

        % calculate h for classes given feature f
        yclasses = unique(yf);
        hyf = 0;
        for yc=yclasses'
            pyf = sum(yf==yc)/size(yf,1);
            hyf = hyf + pyf*log2(pyf);
        end
        hyf = -hyf;

        hyx = hyx + pf * hyf;

    end

    info_gains(col) = hy - hyx;

end

[~, index] = sort(info_gains, 'descend');
