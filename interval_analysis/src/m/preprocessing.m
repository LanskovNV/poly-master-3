function [x, y, x_filt, y_filt, x_step, y_step] = preprocessing(data)
	x = data(:, 1);
	y = data(:, 2);
	
	left_bound = 2.5 * 10^6;
	right_bound = 4.3 * 10^6;
	x_filtered_indexes = (x > left_bound) & (x < right_bound);
	x_filt = x(x_filtered_indexes);
	y_filt = y(x_filtered_indexes);

	EPS = 20;	
	x1(1) = x_filt(1);
	y1(1) = y_filt(1);
	j = 2;
	for i = 1:length(y_filt)
		if abs(y1(j - 1) - y_filt(i)) > EPS
			y1(j) = y_filt(i);
			x1(j) = x_filt(i);
			j = j + 1;
		endif
	endfor
	
	n = 10;	
	for i = 1:n
		x_step(i) = x1(2 * i - 1);
		y_step(i) = y1(2 * i - 1);
	endfor
	x_step = transpose(x_step);
	y_step = transpose(y_step);
	%x_step = transpose(x1(1:step_size:end));
	%y_step = transpose(y1(1:step_size:end));
endfunction
