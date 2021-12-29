function draw_graph(x, y, x_label, y_label, params, is_new)
	if is_new == 1
		figure('position', [0, 0, 800, 600]);
		hold on;
		grid on;
		xlabel(x_label);
		ylabel(y_label);
		set(gca, 'fontsize', 14);
	endif
	
	plot(x, y, params);	
	
	%if save_path ~= ""
	%	saveas(gcf, save_path, "epsc");
	%endif
endfunction