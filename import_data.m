function ocam_model = import_data(file_path)
    % open the calibration file
    fid = fopen(file_path);
    s = textscan(fid, '%f', 'CommentStyle', '#');
    s = s{:};
    fclose(fid);

    % initialize the sturcture
    ocam_model = struct;
    i = 1;
    num_coeff = s(i);
    ocam_model.ss = s(i+1:i+num_coeff);
    
    % load distortion coefficients
    i = i + num_coeff + 1;
    num_coeff_inv = s(i);
    ocam_model.pol = s(i+num_coeff_inv:-1:i+1);
    
    % load calibration matrix
    i = i + num_coeff_inv + 1;
    ocam_model.xc = s(i)+1; % C to MATLAB convention
    ocam_model.yc = s(i+1)+1;
    ocam_model.c = s(i+2);
    ocam_model.d = s(i+3);
    ocam_model.e = s(i+4);
    ocam_model.height = s(i+5);
    ocam_model.width = s(i+6);