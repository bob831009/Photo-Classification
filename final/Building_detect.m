function [predict, prob] = Building_detect(Path)
    addpath(strcat(pwd, '/phog/'));
    
    bin = 18;
    angle = 180;
    L=0;
    
    I = imread(Path);
    [hei, wid, dim] = size(I);
    max_size = max(hei, wid);
    if(max_size > 1500)
        I = imresize(I,500/max_size);
        [hei, wid, dim] = size(I);
    end
    roi = [1;hei;1;wid];
    tmpHistogram = anna_phog(Path, bin, angle, L, roi);
%     plot(tmpHistogram);
    prob = sum(tmpHistogram(1:2)) + sum(tmpHistogram(8:10)) + sum(tmpHistogram(17:18));
    if(sum(tmpHistogram(1:2)) + sum(tmpHistogram(8:10)) + sum(tmpHistogram(17:18)) > 0.5)
        predict = 1;
    else
        predict = 0;
    end
end
