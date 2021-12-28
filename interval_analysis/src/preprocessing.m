function [x, y, x_filt, y_filt, x_step, y_step] = preprocessing(data)
	x = data(:, 1);
	y = data(:, 2);

	left_bound = 2.54 * 10^6;
	right_bound = 2.58 * 10^6;
	x_filtered_indexes = (x > left_bound) & (x < right_bound);
	x_filt = x(x_filtered_indexes);
	y_filt = y(x_filtered_indexes);

	x_step_size = 80;
	x_step = x_filt(1:x_step_size:end);
	y_step = y_filt(1:x_step_size:end);
endfunction
