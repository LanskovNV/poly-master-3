function prediction(x, y, irp_temp, b_maxdiag, b_gravity)
	X = [ x.^0 x ];
	## Значения y, предсказанные с помощью модели y = beta1 + beta2 * x в точках эксперимента
	yp0 = ir_predict(irp_temp, X);       # интервальный прогноз значений y в точках x

	yp0mid = mean(yp0,2);                 # средние значения прогнозных интервалов
	yp0rad = 0.5 * (yp0(:,2) - yp0(:,1)); # радиус прогнозных интервалов

	yp0rad_rel = 100 * yp0rad ./ yp0mid;  # относительная величина неопределенности прогнозов в процентах
	
	## Значения y, предсказанные с помощью модели y = beta1 + beta2 * x
	xp = [2.75e6; 2.78e6; 2.81e6; 2.86e6; 2.95e6];
	Xp = [xp.^0 xp];

	yp = ir_predict(irp_temp, Xp);         # интервальный прогноз значений y в точках xp
	ypmid = mean(yp,2);                     # средние значения прогнозных интервалов
	yprad = 0.5 * (yp(:,2) - yp(:,1));      # радиус прогнозных интервалов
	
	for i=1:5
		fprintf("[%d, %d]\n", yp(i, 1), yp(i, 2));
	endfor
	display(yprad);
	
	yprad_relative = 100 * yprad ./ ypmid;  # относительная величина неопределенности прогнозов в процентах
	
	## Графическое представление коридора совместных зависимостей для модели y = beta1 + beta2 * x
	figure('position',[0, 0, 800, 600]);
	xlimits = [2.45e6 3e6];
	ir_plotmodelset(irp_temp, xlimits);     # коридор совместных зависимостей

	hold on;
	ir_scatter(irp_temp,'bo');              # интервальные измерения
	ir_plotline(b_maxdiag, xlimits, 'r-');   # зависимость с параметрами, оцененными как центр наибольшей диагонали ИМ
	ir_plotline(b_gravity, xlim, 'b--');     # зависимость с параметрами, оцененными как центр тяжести ИМ  
	# ir_plotline(b_lsm, xlim, 'b--');         # зависимость с параметрами, оцененными МНК
	ir_scatter(ir_problem(Xp, ypmid, yprad),'ro');
	grid on;
	set(gca, 'fontsize', 12);
	%saveas(gcf, "../report/images/prediction.eps","epsc");
endfunction
