function irp_temp = interval_problem(x, y)
	m = length(x);
	eps = ones(m, 1);
	
	C = zeros(1, m + 2);
	for i = 1:m
		C(i) = 1;
	endfor
	display(C);
	
	A = zeros(2 * m, m + 2);
	for i = 1:m
		A(2 * i - 1, i) = eps(i);
		A(2 * i, i) = eps(i);

		A(2 * i - 1, m + 1) = 1;
		A(2 * i, m + 1) = -1;

		A(2 * i - 1, m + 2) = x(i);
		A(2 * i, m + 2) = -x(i);
	endfor
	display(A);

	B = zeros(1, 2 * m);
	for i = 1:m
		B(2 * i - 1) = y(i);
		B(2 * i) = -y(i);
	endfor
	display(B);

	lb = zeros(1, m + 2);
	for i = 1:m
		lb(i) = 1;
	endfor
	lb(m+2) = -inf;
	display(lb);

	ctype = "";
	for i = 1:2 * m
		ctype(i) = 'L';
	endfor
	display(ctype);

	vartype = "";
	for i = 1:m + 2
		vartype(i) = 'C';
	endfor
	display(vartype);
	sense = 1;
	
	w = glpk(C,A,B,lb,[],ctype,vartype,sense);
	
	scale = max(w(1:m));
	for i = 1:m
		eps(i) = eps(i) * scale;
	end

	X = [ x.^0 x ];                              
	lb = [-inf 0];                                
	irp_temp = ir_problem(X, y, eps, lb);     
	
	display(w);	
	## График интервальных измерений
	figure('position', [0, 0, 800, 600]);
	ir_scatter(irp_temp);   
	set(gca, 'fontsize', 12);
	grid on;
	%saveas(gcf, "../report/images/interval_data.eps","epsc");
	
	figure('position', [0, 0, 800, 600]);
	ir_plotbeta(irp_temp);
	grid on;
	set(gca, 'fontsize', 12);
	xlabel('\beta_1')
	ylabel('\beta_2');
	title('Information set');
	%saveas(gcf, "../report/images/interval_info_set.eps","epsc");
endfunction
