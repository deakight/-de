clc;
clear;
tic
folder1 = 'D:\论文实验结果\zy3-test_imag_labels\images\';
filepath1 = dir([folder1 '*.jpg']) ;

folder3='/GF1_test/';
fid1 = fopen(['E:\RemoteSensingData\GF-1\GF-1_train\'  'val.txt'],'a');
fid2 = fopen(['E:\RemoteSensingData\GF-1\GF-1_train\'  'val_id.txt'],'a');

for i = 1:length(filepath1)

 str5=filepath1(i).name; %images
  
 str6=str5( 1:(length(str5)-4) ); % get the test's name
 format1='.jpg'; 
 format2='.png';
 fprintf(fid1,'%s%s%s\n',folder3,str6,format1); 
 fprintf(fid2,'%s\n',str6);  

end
fclose(fid1);fclose(fid2);

toc
