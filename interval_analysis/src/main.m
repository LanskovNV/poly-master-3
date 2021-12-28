pkg load interval

load("../assets/data.mat")

[x, y, x_filt, y_filt, x_step, y_step] = preprocessing(data);

%draw_graphic(x, y, "time", "value", "", 1, "");
%draw_graphic(x_filt, y_filt, "time", "value", "", 1, "");
%draw_graphic(x_step, y_step, "time", "value", "", 1, "");
%draw_graphic(x_step, y_step, "time", "value", "dr", 0, "");

display(x_step)
display(y_step)