clc;
clearvars;
%% 1. Text and CSV Files
%Delimited text / CSV
T = readtable('lightning.csv');     % as table
%%
M = readmatrix('lightning.csv');    % as numeric matrix
C = readcell('lightning.csv');      % as cell array

%Text with custom delimiter
%T = readtable('lightning.txt','Delimiter','\t');

%% 2. Excel Files
% Reads .xls, .xlsx, .xlsm
T = readtable('data.xlsx');
M = xlsread('data.xlsx');   % older way (numeric + text)

%% 3. MAT-files (MATLAB format)
% For saving/loading MATLAB variables
save('mydata.mat','var1','var2')
load('mydata.mat')

%% 4. Images
% Import images (.jpg, .png, .tif, etc.)
img = imread('image.png');
imshow(img);

%% 5. Audio
% Read .wav, .mp3
[y, Fs] = audioread('sound.wav');
sound(y, Fs);

%% 6. Video
% Read video frames
v = VideoReader('video.mp4');
frame1 = readFrame(v);
imshow(frame1);

%% 7. Databases
%Requires Database Toolbox
conn = database('myDB','username','password');
data = fetch(conn,'SELECT * FROM table');

%% 8. Web Data
% From URLs
data = webread('https://example.com/data.json');

%% 9. Other Scientific Data Formats
%HDF5 / NetCDF (common in physics, climate, satellite data)
data = h5read('file.h5','/dataset');
ncdisp('file.nc')
ncread('file.nc','varname')

%JSON
str = fileread('data.json');
data = jsondecode(str);

%% MATLAB also has the Import Tool (GUI) → you can open it with:
uiimport