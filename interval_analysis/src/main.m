pkg load interval
addpath(genpath('../octave-interval-examples/m'))
addpath(genpath('./m'))

load("../assets/data.mat")
[x, y, x_filt, y_filt, x_step, y_step] = preprocessing(data);

%draw_graph(x, y, "time", "value", "", 1, "all_data.eps");
%draw_graph(x_filt, y_filt, "time", "value", "", 1, "filtered_data.eps");
%draw_graph(x_step, y_step, "time", "value", "d", 1, "selected_data.eps");

dot_problem(x_step, y_step);

%irp_temp = interval_problem(x_step, y_step);
%[b_maxdiag, b_gravity] = parameters(x_step, y_step, irp_temp);
%joint_depth(irp_temp, b_maxdiag, b_gravity);
%prediction(x_step, y_step, irp_temp, b_maxdiag, b_gravity);
%edje_points(x_step, y_step, irp_temp);