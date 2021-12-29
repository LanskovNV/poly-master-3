function dot_problem(x, y)
	epsilon = 1;
	X = [ x.^0 x ];	
	lb = [-inf 0]; 
	
	irp_temp = ir_problem(X, y, epsilon, lb);
	
	figure('position',[0, 0, 800, 600]);
	ir_scatter(irp_temp);

	b_lsm = (X \ y)';  
	MNK_line = [b_lsm(1) + b_lsm(2) * min(x), b_lsm(1) + b_lsm(2) * max(x)];

	figure('position', [0, 0, 800, 600]);
	plot(x, y, "o");
	hold on;
	plot([min(x),  max(x)], MNK_line);
	
	## Графическое представление информационного множества
	figure('position',[0, 0, 800, 600]);
	%ir_plotbeta(irp_temp);
	grid on;
	set(gca, 'fontsize', 12);
	xlabel('\beta_1');
	ylabel('\beta_2');
	title('Information set');
endfunction
