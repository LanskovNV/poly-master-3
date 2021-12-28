function draw_graphic(x, y, x_label, y_label, params, is_new, save_path)
	if is_new == 1
		figure;
		hold on;
		grid on;
		xlabel(x_label);
		ylabel(y_label);
		set(gca, 'fontsize', 14);
	endif
	
	plot(x, y, params);	
	
	if save_path ~= ""
		saveas(gcf, save_path, "epsc");
	endif
endfunction