function [Group] = predict_InOutdoor(Path)
    load('./svm_Model', 'SVMStruct');
%     Path = './dataset/outdoor/10.jpg';
    x = imfinfo(Path);
    if(isfield(x, 'DigitalCamera'))
        tmp_train_data = zeros(1,9);
        if(isfield(x.DigitalCamera, 'ExposureTime'))
            tmp_train_data(1) = x.DigitalCamera.ExposureTime;
        end
        if(isfield(x.DigitalCamera, 'FNumber'))
            tmp_train_data(2) = x.DigitalCamera.FNumber;
        end
        if(isfield(x.DigitalCamera, 'ISOSpeedRatings'))
            tmp_train_data(3) = x.DigitalCamera.ISOSpeedRatings;
        end
        if(isfield(x.DigitalCamera, 'ShutterSpeedValue'))
            tmp_train_data(4) = x.DigitalCamera.ShutterSpeedValue;
        end
        if(isfield(x.DigitalCamera, 'ApertureValue'))
            tmp_train_data(5) = x.DigitalCamera.ApertureValue;
        end
        if(isfield(x.DigitalCamera, 'BrightnessValue'))
            tmp_train_data(6) = x.DigitalCamera.BrightnessValue;
        end
        if(isfield(x.DigitalCamera, 'ExposureBiasValue'))
            tmp_train_data(7) = x.DigitalCamera.ExposureBiasValue;
        end
        if(isfield(x.DigitalCamera, 'MaxApertureValue'))
            tmp_train_data(8) = x.DigitalCamera.MaxApertureValue;
        end
        if(isfield(x.DigitalCamera, 'FocalLength'))
            tmp_train_data(9) = x.DigitalCamera.FocalLength;
        end
        if(sum(tmp_train_data) == 0)
            Group = -1;
        else
            Group = svmclassify(SVMStruct, tmp_train_data);
        end
    else
        Group = -1;
end