function [svmStruct] = train_InOutdoor()
    train_X = [];
    train_Y = [];
    for class = 1:2
        for i = 1:20
            if(class == 1)
                CLASS = 'indoor/';
                label = 0;
            else
                CLASS = 'outdoor/';
                label = 1;
            end
            Path = strcat('./dataset/', CLASS, num2str(i), '.jpg');
            x = imfinfo(Path);
            
            tmp_train_data = zeros(1,9);
            tmp_train_data(1) = x.DigitalCamera.ExposureTime;
            tmp_train_data(2) = x.DigitalCamera.FNumber;
            tmp_train_data(3) = x.DigitalCamera.ISOSpeedRatings;
            tmp_train_data(4) = x.DigitalCamera.ShutterSpeedValue;
            tmp_train_data(5) = x.DigitalCamera.ApertureValue;
            tmp_train_data(6) = x.DigitalCamera.BrightnessValue;
            tmp_train_data(7) = x.DigitalCamera.ExposureBiasValue;
            tmp_train_data(8) = x.DigitalCamera.MaxApertureValue;
            tmp_train_data(9) = x.DigitalCamera.FocalLength;
            train_X = [train_X;tmp_train_data];
            train_Y = [train_Y;label];
            
        end
    end
    SVMStruct = svmtrain(train_X, train_Y, 'kernel_function', 'rbf');
    save('./svm_Model', 'SVMStruct');
end