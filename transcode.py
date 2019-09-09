#save yuv
#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import cv2
import numpy as np

def encode_mp4_from_y(y_dir, mp4_file, dst_mp4)





#ffmpeg transcode




#extract y from yuv




def yuv2imgs(filename, height, width):
    """
    :param filename: ������ YUV ��Ƶ������
    :param height: YUV ��Ƶ��ͼ��ĸ�
    :param width: YUV ��Ƶ��ͼ��Ŀ�
    :param startfrm: ��ʼ֡
    :return: None
    """
    fp = open(filename, 'rb')

    framesize = height * width * 3 // 2  # һ֡ͼ�����������ظ���
    h_h = height // 2
    h_w = width // 2

    fp.seek(0, 2)  # �����ļ�ָ�뵽�ļ�����β��
    ps = fp.tell()  # ��ǰ�ļ�ָ��λ��
    numfrm = ps // framesize  # �������֡��
    fp.seek(framesize * startfrm, 0)

    for i in range(numfrm - startfrm):
        Yt = np.zeros(shape=(height, width), dtype='uint8', order='C')
        Ut = np.zeros(shape=(h_h, h_w), dtype='uint8', order='C')
        Vt = np.zeros(shape=(h_h, h_w), dtype='uint8', order='C')

        for m in range(height):
            for n in range(width):
                Yt[m, n] = ord(fp.read(1))
        for m in range(h_h):
            for n in range(h_w):
                Ut[m, n] = ord(fp.read(1))
        for m in range(h_h):
            for n in range(h_w):
                Vt[m, n] = ord(fp.read(1))

        img = np.concatenate((Yt.reshape(-1), Ut.reshape(-1), Vt.reshape(-1)))
        img = img.reshape((height * 3 // 2, width)).astype('uint8')  # YUV �Ĵ洢��ʽΪ��NV12��YYYY UV��

        # ���� opencv ����ֱ�Ӷ�ȡ YUV ��ʽ���ļ�, ����Ҫת��һ�¸�ʽ
        bgr_img = cv2.cvtColor(img, cv2.COLOR_YUV2BGR_NV12)  # ע�� YUV �Ĵ洢��ʽ
        cv2.imwrite('frames/%d.jpg' % (i + 1), bgr_img)
        print("Extract frame %d " % (i + 1))

    fp.close()
    print("job done!")
    return None
    

if __name__ == "__main__":
    coverfile = "/cyf/StegaStamp1/data/test_768x576/1.mp4"
    yuvfile = "temp.yuv"

    os.system("ffmpeg -i {} {}".format(coverfile,yuvfile))

