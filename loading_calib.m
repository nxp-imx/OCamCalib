if ~exist('Omni_Calib_Results.mat'),
   h = errordlg('Calibration file Omni_Calib_Results.mat not found!');
   uiwait(h);
   return;
end;

fprintf(1,'\nLoading calibration results from Omni_Calib_Results.mat\n');

clear calib_data;
load Omni_Calib_Results.mat

fprintf(1,'done\n');

h = msgbox('Loading calibration results from Omni_Calib_Results.mat. Done.');
uiwait(h);
