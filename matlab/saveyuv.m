function saveyuv(v_l_y,v_l_cb,v_l_cr,row,col,frames,filename)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
    f1 = fopen(filename,'w'); %�����ļ�

    for frame=1:frames
        for i1 = 1:row 
            fwrite(f1,v_l_y(i1,:,frame)); 
        end

        for i2 = 1:row/2 
           fwrite(f1,v_l_cb(i2,:,frame)); 
        end

        for i3 = 1:row/2 
           fwrite(f1,v_l_cr(i3,:,frame));  
        end
    end
    fclose(f1);
end

