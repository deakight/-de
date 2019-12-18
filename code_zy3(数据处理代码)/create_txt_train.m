clc;
clear all;
tic

folder1= 'D:\Landsat8_datas\764channels_imagess\467channel_test\train0\images\';
filepath1 = dir([folder1 '*.jpg']) ;

folder2 = 'D:\Landsat8_datas\764channels_imagess\467channel_test\train0\labels\';
filepath2 = dir([folder2 '*.png']) ;

% 
 folder3='/zy3_images/';
 folder4='/labels/';



fid1 = fopen(['D:\Landsat8_datas\764channels_imagess\467channel_test\train0\'  'train_aug.txt'],'a');


for i = 1 :length(filepath2)
    str7=filepath2(i).name;  % label name
  
    str_img=str7(1:length(str7)-4);
    %%
   str8= [str_img '.jpg'];
%    str9=[folder4 str7];  
    fprintf(fid1,'%s%s %s%s\n',folder3,str8,folder4,str7); % 字符串之间一个空格
%     fprintf(fid1,'%s %s\n',str8,str9); % 字符串之间一个空格
    
end
fclose(fid1);
toc
















