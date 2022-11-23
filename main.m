[sig, fs] = audioread("enge_beat.wav");

disp(["sampels:", numel(sig)]);
disp(["Samplefreq: ", fs]);
disp(["Hz (beats): ",(fs/(numel(sig)))*33]);

%% take fft of signal and divide in frequency bands
% 0-200Hz, 200-400Hz, 400-800Hz, 800-1600Hz, 1600-3200Hz, and finally 3200Hz

fft_sig = fft(sig);
figure(3);
plot(envelope(sig, numel(sig), 'peak'));

bp_200 = bandpass(fft_sig, [1 200], fs);
bp_400 = bandpass(fft_sig, [200 400], fs);
bp_800 = bandpass(fft_sig, [400 800], fs);
bp_1600 = bandpass(fft_sig, [800 1600], fs);
bp_3200 = bandpass(fft_sig, [1600 3200], fs);
hp_3200 = highpass(fft_sig, 3200, fs);

% find max value in the fft
% src: https://nl.mathworks.com/matlabcentral/answers/374132-how-to-get-the-index-value-of-maximum-peak-in-fft-domain
FTsignal = fft(sig - mean(sig))/length(sig);
[maxpeak, maxpeakindes] = max(abs(FTsignal)*2);


%% plot everything
figure(1);
subplot(311);
plot(sig);
subplot(312);
plot(abs(fft(sig)));


figure(2);
subplot(231)
plot(abs(bp_200(1:NFFT/2+1)))
title("0-200Hz");
subplot(232)
plot(abs(bp_400))
title("200-400Hz");
subplot(233)
plot(abs(bp_800))
title("400-800Hz");
subplot(234)
plot(abs(bp_1600))
title("800-1600Hz");
subplot(235)
plot(abs(bp_3200))
title("1600-3200Hz");
subplot(236)
plot(abs(hp_3200))
title("3200Hz");

% convert back to time domain
%time = ifft(array);
%figure(2);
%plot(abs(time));

