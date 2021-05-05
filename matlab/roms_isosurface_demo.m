% Example script of how to use roms_isosurface.m to visualize some constant
% value surface of a ROMS 3-D variable
%
% John Wilkin - January 2021

% Data URL for the MARACOOS real-time ROMS ocean forecast
f = 'http://tds.marine.rutgers.edu/thredds/dodsC/roms/doppio/2017_da/avg/Averages_Best';

% Load the ROMS grid structure
g = roms_get_grid(f,f);

%% Example 1: The salinity = 33 front of central Mid-Atlantic Bight
figure(1)
varname = 'salt';
value = 33;

% make the plot
tindex = 942; % '31-May-2020 12:00:00'
[S,P,H] = roms_isosurface(f,varname,tindex,value,g);

% modify the view point
azel = [-20 20];
view(azel)

% modify axis limits and aspect ratio
xlim([-75 -70]); ylim([37 41.5]); zlim([-100 20]);
daspect([1 1 100])

%% Example 2: The mid summer Cold Pool of the Mid-Atlantic Bight
figure(2)
varname = 'temp';
value = 10;

% make the plot
tindex = 1281; % 5-April: 10C cold pool has formed
[S,P,H] = roms_isosurface(f,varname,tindex,value,g);

% modify the view point
azel = [-4 20];
view(azel)

% modify axis limits and aspect ratio
xlim([-75 -70]); ylim([37 41.5]); zlim([-100 20]);
daspect([1 1 100])

%% Example 3: high u-velocity in the Gulf Stream
figure(3)
varname = 'u';
value = 0.5;

% make the plot
tindex = 942; % '31-May-2020 12:00:00'
[S,P,H] = roms_isosurface(f,varname,tindex,value,g);

% change the isosurface color
P.FaceColor = 'r';

% modify the view point
azel = [-10 65];
view(azel)

% modify axis limits and aspect ratio
zlim([-4000 20]);
daspect([1 1 500])

