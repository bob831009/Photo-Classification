function [predict] = Starter()
    TOTAL_PIC_NUM = 29;
    predict = zeros(TOTAL_PIC_NUM,3);
    prob = zeros(TOTAL_PIC_NUM,3);
    for i = 1:TOTAL_PIC_NUM;
        i
        path = strcat('./liang/', num2str(i), '.jpg');
      I = imread(path);
        [hei, wid, dim] = size(I);
        
        predict_inout = predict_InOutdoor(path);
        people_num = face(path);
        [predict_building, prob(i)] = Building_detect(path);
        
        predict(i,1) = predict_inout;
        predict(i,2) = predict_building;
        predict(i,3) = people_num;
        if(predict_inout == 0)
%       =========indoor=========
            if(people_num == 1)
                output_path = strcat('./Result/indoor/people/solo/', num2str(i),  '.jpg');
                imwrite(I, output_path);
            elseif(people_num > 1)
                output_path = strcat('./Result/indoor/people/group/', num2str(i), '.jpg');
                imwrite(I, output_path);
            end
            
            if(predict_building == 1)
                output_path = strcat('./Result/indoor/building/', num2str(i), '.jpg');
                imwrite(I, output_path);
            end
            
            if(predict_building == 0 && people_num == 0)
                output_path = strcat('./Result/indoor/other/', num2str(i), '.jpg');
                imwrite(I, output_path);
            end
        elseif(predict_inout == 1)
%       =========outdoor=========
            if(people_num == 1)
                output_path = strcat('./Result/outdoor/people/solo/', num2str(i), '.jpg');
                imwrite(I, output_path);
            elseif(people_num > 1)
                output_path = strcat('./Result/outdoor/people/group/', num2str(i), '.jpg');
                imwrite(I, output_path);
            end
            
            if(predict_building == 1)
                output_path = strcat('./Result/outdoor/building/', num2str(i), '.jpg');
                imwrite(I, output_path);
            end
            
            if(predict_building == 0 && people_num == 0)
                output_path = strcat('./Result/outdoor/other/',  num2str(i), '.jpg');
                imwrite(I, output_path);
            end
        else
%          ================Have NO EXIF info================
            if(people_num == 1)
                output_path = strcat('./Result/people/solo/', num2str(i), '.jpg');
                imwrite(I, output_path);
            elseif(people_num > 1)
                output_path = strcat('./Result/people/group/', num2str(i), '.jpg');
                imwrite(I, output_path);
            end
            
            if(predict_building == 1)
                output_path = strcat('./Result/building/', num2str(i), '.jpg');
                imwrite(I, output_path);
            end
            
            if(predict_building == 0 && people_num == 0)
                output_path = strcat('./Result/other/',  num2str(i), '.jpg');
                imwrite(I, output_path);
            end
        end
    end
    plot(prob);
end