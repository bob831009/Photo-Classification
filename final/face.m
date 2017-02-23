function woohoo = face(path)
I = imread(path);
tmp = size(I);
minsize = min(tmp(1), tmp(2));
FDetect = vision.CascadeObjectDetector('MinSize', [max(20,floor(minsize/12)), max(20,floor(minsize/12))], 'MergeThreshold',4);
%Returns Bounding Box values based on number of objects
BB = step(FDetect,I);
num = size(BB);
woohoo = num(1);