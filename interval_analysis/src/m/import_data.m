function data = import_data()
	% This function load data from .txt and save to .mat
	filename = "../assets/microstep256step128 - 21.11.2021.txt"
	delimiter = " "
	header_lines = 1
	data = importdata(filename, delimiter, headerLines)
	data = data.data
	save("../assets/data.mat")
endfunction