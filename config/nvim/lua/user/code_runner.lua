local status_ok,code_runner=pcall(require,"code_runner")
if not status_ok then
  return
end

code_runner.setup {

	term = {
		mode = "",
		tab = false,
		position = "belowright",
		size = 8,
	},
	filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		python = "cd $dir && python $fileName",
		rust = "cd $dir && cargo run",
		--rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
		javascript = "node",
		c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
		-- cpp = "cd $dir && g++ -std=c++20 $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
		--[[ cpp = "cd $dir && g++ -fopenmp  -lboost_coroutine -lboost_context -std=c++20 $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt", ]]
		cpp = "make && make run",
		tex = "cd $dir && xelatex $fileName",
    r = "cd $dir && radian ",
	},
	project = {
		["~/cpp/example"] = {
			name = "ExapleCpp",
			description = "Project with make file",
			command = "make buid & cd buid/ & ./compiled_file",
		},
	},
}

