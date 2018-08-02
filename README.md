# system_verilog
System verilog examples and issues 

## vcs standalone steps for running 
1)	vlogan -sverilog tl.sv -l vlogan.log
2)	vhdlan dut_pkg.vhd dut.vhd -l vhdlan.log
3)	vcs -lca -sverilog tl 
4)	./simv

