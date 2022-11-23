%Inputsignaal
sig = audioread("100bpm.wav");

%Smoothing met envelope
smooth_sig = envelope(sig,1500,'peak');

%FFT van smooth
fft_smooth_sig = fft(smooth_sig);

%Afgeleide van smooth
afgel_smooth_sig = diff(smooth_sig);
%Max vinden
FTsignal = fft(afgel_smooth_sig - mean(afgel_smooth_sig))/length(afgel_smooth_sig);
[maxpeak, maxpeakindes] = max(abs(FTsignal)*2);
disp(["Hz (beats): ",(fs/(numel(sig)))*maxpeakindes/2]);
disp(["BPM: ", (((fs/(numel(sig)))*maxpeakindes)/2)*60]);

%Plotten
figure(1);

subplot(221);
plot(sig);
title("Origineel signaal")

subplot(222);
plot(envelope(sig,700,'peak'));
title("Envelope signaal");

%subplot(223);
%plot(abs(fft_smooth_sig));
%title("FFT envelope signaal")

subplot(223);
plot(abs(fft(afgel_smooth_sig)));
title("FFT van afgeleide van envelope signaal")

subplot(224);
plot(afgel_smooth_sig);
title("Afgeleide envelope signaal")

