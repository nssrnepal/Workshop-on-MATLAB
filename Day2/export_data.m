clc;
clear all;
%% Export to Text / CSV / Excel
%Write Table to CSV:
writetable(T,'data.csv')

%% Write Matrix to CSV:
writematrix(A,'matrix.csv')

%Write Cell Array:
writecell(C,'cells.csv')

%% Export to Excel:
writetable(T,'data.xlsx','Sheet',1)

%% Save Figures
%Save current figure:
savefig('myfigure.fig')          % MATLAB figure format
saveas(gcf,'figure1.png')        % save as PNG
saveas(gcf,'figure1.jpg')        % save as JPG
saveas(gcf,'figure1.pdf')        % save as PDF

%% High-resolution export (best for publications):
print(gcf,'-dpng','-r300','figure1.png')   % 300 dpi

%% Export Image Data
%Write image to file:
imwrite(img,'output.png')
imwrite(img,'output.tif')

%% Export Audio
%Write audio signal to file:
audiowrite('sound.wav', y, Fs)   % y = signal, Fs = sample rate

%% Export Video
%Create and save a video:
v = VideoWriter('myvideo.mp4','MPEG-4');
open(v)
writeVideo(v,frames)   % frames = image or video frames
close(v)

%% Quick Tip: MATLAB figures (.fig) can be reopened and edited later:
openfig('myfigure.fig')