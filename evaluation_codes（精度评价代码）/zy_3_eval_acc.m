
clear all
clc
tic

addpath('evaluationCode');
addpath('visualizationCode');

 str1='C:\Users\Administrator\Desktop\labels_add\'; % 合并的分割labels
 str2='D:\论文实验结果\zy3\test_img\1224\labels_add\'; % 原始labels
labels=importdata('D:\论文实验结果\zy3\test_img\1224\val_id.txt'); % labels name 索引
str_blob='_blob_0.png';
m=length(labels);

%% Evaluation
% initialize statistics
cnt=0;
numClass=2;
area_intersection = double.empty;
area_union = double.empty;
pixel_accuracy = double.empty;
pixel_correct = double.empty;
pixel_labeled = double.empty;

% main loop
% filesPred = dir(fullfile(pathPred, '*.png'));
for i = 1 : m

       str_label_name=labels{i};
       str_label=[str_label_name '.png']; % reference label
       str_test_label=[str_label_name str_blob]; %test label
       filePred=[str1 str_test_label ];
       fileAnno=[str2 str_label];
    % read in prediction and label
       imPred_1= imread(filePred); %test label
       imAnno= imread(fileAnno); % reference label

       [m1,n1,z1]=size(imAnno);
       imPred=imPred_1(1:n1,1:m1,:);
% 
%         % compute IoU
        cnt = cnt + 1;
        [area_intersection(:,cnt), area_union(:,cnt)] = intersectionAndUnion(imPred, imAnno, numClass);
% 
%         % compute pixel-wise accuracy
        [pixel_accuracy(i), pixel_correct(i), pixel_labeled(i)] = pixelAccuracy(imPred, imAnno);
        fprintf('Evaluating %d/%d... Pixel-wise accuracy: %2.2f%%\n', cnt, numel(labels), pixel_accuracy(i)*100.);
end

%% Summary
IoU = sum(area_intersection,2)./sum(eps+area_union,2);
mean_IoU = mean(IoU);
accuracy = sum(pixel_correct)/sum(pixel_labeled);

fprintf('==== Summary IoU ====\n');
for i = 1:numClass
    fprintf('%3d %.4f\n', i,  IoU(i));
end
fprintf('Mean IoU over %d classes: %.4f\n', numClass, mean_IoU);
fprintf('Pixel-wise Accuracy: %2.2f%%\n', accuracy*100.);
sub_acc = accuracy*100.;
sub_iou = mean_IoU;


toc







