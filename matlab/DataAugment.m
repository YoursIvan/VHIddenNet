%Data Augment
%flipped

srcpath = 'D:\Data\Boss_jpg\95\';
dstpath = 'D:\Data\Boss_jpg\flipped\';

for i = 1 : 10000
    i
    srcfile = [srcpath,num2str(i),'.jpg'];
    dst1file = [dstpath,num2str(10000+i),'.jpg'];
    dst2file = [dstpath,num2str(20000+i),'.jpg'];
    dst3file = [dstpath,num2str(30000+i),'.jpg'];
    I=imread(srcfile); %����ͼ��
    J1=flip(I,1);%ԭͼ���ˮƽ����
    J2=flip(I,2);%ԭͼ��Ĵ�ֱ����
    J3=flip(I,3);%ԭͼ���ˮƽ��ֱ����
    imwrite(J1,dst1file,'quality',95);
    imwrite(J2,dst2file,'quality',95);
    imwrite(J3,dst3file,'quality',95);
end