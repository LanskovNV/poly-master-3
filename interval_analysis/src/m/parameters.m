function [b_maxdiag, b_gravity] = parameters(x, y, irp_temp)
	X = [ x.^0 x ];
	## Вершины информационного множества задачи построения интервальной регрессии
	vertices = ir_beta2poly(irp_temp);

	## Диаметр и наиболее удаленные вершины информационного множества 
	[rhoB, b1, b2] = ir_betadiam(irp_temp);
	
	## Внешние интервальние оценки параметров модели y = beta1 + beta2 * x 
	b_int = ir_outer(irp_temp);
	
	## Точечные оценки параметров 
	b_maxdiag = (b1 + b2) / 2;    # как середина наибольшей диагонали информационного множества
	b_gravity = mean(vertices);   # как центр тяжести информационного множества 
	b_lsm = (X \ y)';             # методом наименьших квадратов
	
	display(b_int);
	fprintf("b1: %d\n", (b_int(1, 1) + b_int(1, 2)) / 2);
	fprintf("b2: %d\n", (b_int(2, 1) + b_int(2, 2)) / 2);
	## Графическое представление внешней интервальной оценки информационного множества
	figure('position',[0, 0, 800, 600]);
	ir_plotbeta(irp_temp);
	hold on;
	grid on;
	ir_plotrect(b_int,'r-');
	set(gca, 'fontsize', 12);
	xlabel('\beta_1');
	ylabel('\beta_2');
	title('Information set');
	## Точечные оценки
	plot(b_maxdiag(1), b_maxdiag(2), 'ro');
	plot(b_gravity(1), b_gravity(2), 'k+');
	plot(b_lsm(1), b_lsm(2), 'gx');
	legend("", "", "enclosure", "maxdiag",  "gravity", "lsm");
	%saveas(gcf, "../report/images/info_set_full.eps","epsc");	
endfunction
