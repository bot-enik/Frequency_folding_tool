function main
    % Аналог тулзе, расположенной по адресу: 
    % https://www.analog.com/en/design-center/interactive-design-tools/frequency-folding-tool.html
    % Эта версия позволяет рассмотреть все более точно, плюс
    % неограниценное число каналов и гармоник. 
    % Ширина канала обозначается двумя синусоидами.
    
    close all;
    df = 10e3;
    
    % Центральная частота
    f = 172.8e6;
    p = 10;
    
    % Первый канал
    f1_l = f + df;
    f1_h = f - df;
    sig_1_low  = Signal('sig1', f1_l, 1, p);
    sig_1_high = Signal('sig1', f1_h, 1, p);
    
    % Второй канал
    f2 = f + 25e3;
    f2_l = f2 + df;
    f2_h = f2 - df;
    sig_2_low  = Signal('sig2', f2_l, 1, p);
    sig_2_high = Signal('sig2', f2_h, 1, p);
    
    % Третий канал
    f3 = f + 50e3;
    f3_l = f3 + df;
    f3_h = f3 - df;
    sig_3_low  = Signal('sig3', f3_l, 1, p);
    sig_3_high = Signal('sig3', f3_h, 1, p);
    
    % Четвертый канал
    f4 = f - 25e3;
    f4_l = f4 + df;
    f4_h = f4 - df;
    sig_4_low  = Signal('sig4', f4_l, 1, p);
    sig_4_high = Signal('sig4', f4_h, 1, p);
    
    % Пятый канал
    f5 = f - 50e3;
    f5_l = f5 + df;
    f5_h = f5 - df;
    sig_5_low  = Signal('sig5', f5_l, 1, p);
    sig_5_high = Signal('sig5', f5_h, 1, p);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%Генерация гармоник%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Можно генерировать умнее: смотри в саморм низу
    
    % Третья гармоника от первого канала   
    f13_l = f1_l*3;
    f13_h = f1_h*3;
    p3 = -70;   
    sig_1_h3_low  = Signal('sig1', f13_l, 1, p3);
    sig_1_h3_high = Signal('sig1', f13_h, 1, p3);
    
    % Третья гармоника от второго канала   
    f23_l = f2_l*3;
    f23_h = f2_h*3;
    p3 = -70;   
    sig_2_h3_low  = Signal('sig2', f23_l, 1, p3);
    sig_2_h3_high = Signal('sig2', f23_h, 1, p3);
    
    % Третья гармоника от третьего канала   
    f33_l = f3_l*3;
    f33_h = f3_h*3;
    p3 = -70;   
    sig_3_h3_low  = Signal('sig3', f33_l, 1, p3);
    sig_3_h3_high = Signal('sig3', f33_h, 1, p3);
    
    % Третья гармоника от четвертого канала   
    f43_l = f4_l*3;
    f43_h = f4_h*3;
    p3 = -70;   
    sig_4_h3_low  = Signal('sig4', f43_l, 1, p3);
    sig_4_h3_high = Signal('sig4', f43_h, 1, p3);
    
    % Третья гармоника от пятого канала   
    f53_l = f5_l*3;
    f53_h = f5_h*3;
    p3 = -70;   
    sig_5_h3_low  = Signal('sig5', f53_l, 1, p3);
    sig_5_h3_high = Signal('sig5', f53_h, 1, p3);
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % Частота дискретизации
    fs = 230.4e6;
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    list = {sig_1_low, sig_1_high, sig_2_low, sig_2_high, ...
            sig_3_low, sig_3_high, sig_4_low, sig_4_high, ...
            sig_5_low, sig_5_high, sig_1_h3_low, sig_1_h3_high, ...
            sig_2_h3_low, sig_2_h3_high, sig_3_h3_low, sig_3_h3_high, ...
            sig_4_h3_low, sig_4_h3_high, sig_5_h3_low, sig_5_h3_high};
    
    % Вот так можно создавать гармоники, это удобнее
    list = horzcat(list, {sig_1_low.CreateHarmonic(2, -40)});    
    list = horzcat(list, {sig_2_high.CreateHarmonic(2, -30)});
    
    figure;
    plot_freqs(0, "Начальное состояние", list);
    ADC1 = ADC(fs);
    ADC1.Digitize(list);
    figure;
    plot_freqs(fs, "После оцифровки", list);
    
    

end