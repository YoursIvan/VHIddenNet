function [v_l_y,v_l_cb,v_l_cr] = readyuv( filename,row,col,frames)
    %UNTITLED �˴���ʾ�йش˺�����ժҪ
    %   �˴���ʾ��ϸ˵��
    f1 = fopen(filename,'r'); %�����ļ�
    v_l_y = zeros(row,col,frames);
    v_l_cb = zeros(row/2,col/2,frames);
    v_l_cr = zeros(row/2,col/2,frames);
    for frame=1:frames
     %�����ļ� ��yuvת��Ϊrgb������imshow��ʾ
      %  im_l_y=fread(fid,[row,col],'uchar');  %����Ķ���
        im_l_y = zeros(row,col); %Y
        for i1 = 1:row 
           im_l_y(i1,:) = fread(f1,col);  %��ȡ���ݵ������� 
        end

        im_l_cb = zeros(row/2,col/2); %cb
        for i2 = 1:row/2 
           im_l_cb(i2,:) = fread(f1,col/2);  
        end

        im_l_cr = zeros(row/2,col/2); %cr
        for i3 = 1:row/2 
           im_l_cr(i3,:) = fread(f1,col/2);  
        end

        %���������yuv�ļ�Ϊ4:2:0������CbCrҪ�ı��С��
        %����im_l_ycbcr(:, :, 2) =im_l_cb;����ִ���
        
        v_l_y(:, :,frame) = im_l_y;
        v_l_cb(:, :,frame) = im_l_cb;
        v_l_cr(:, :,frame) = im_l_cr;
        
    end
    fclose(f1);
end

