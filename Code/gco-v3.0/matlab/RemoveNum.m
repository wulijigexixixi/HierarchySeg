function ResultImg = RemoveNum(OutImg)
    %ʹ��colfilt������SegImg���д���
    %RemoveZeros��������ȥ��0Ԫ�� �õ�SI
    SI = colfilt(OutImg,[3 3],'distinct',@RemoveZeros);
    %RemoveOtherNum��������ȥ���������֣���ǰ��ֵ��8��ͨ���бȽϣ�
    ResultImg = RemoveOtherNum(SI);
    %��������RemoveOtherNum����20�� ʹ�ô���ĸ��ɾ�
    i=1;
    while i<=20
        ResultImg_1 = RemoveOtherNum(ResultImg);
        ResultImg=ResultImg_1;
        i=i+1;
    end
end