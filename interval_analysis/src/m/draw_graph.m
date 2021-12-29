function draw_graph(x, y, x_label, y_label, params, is_new, fname)
	if is_new == 1
		figure('position', [0, 0, 800, 600]);
		hold on;
		grid on;
		xlabel(x_label);
		ylabel(y_label);
		set(gca, 'fontsize', 12);
	endif
	
	plot(x, y, params);	
	saveas(gcf, sprintf("../report/images/%s", fname), "epsc");
endfunction