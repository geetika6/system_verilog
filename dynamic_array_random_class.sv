  class c2c;
      rand bit[1:0] a;
      rand bit[1:0] b;
 
      function void my_print();
	$display("a = %b", a);
	$display("b = %b", b);
      endfunction
 
      constraint c_2 {
	a == 2'b10;
	b == 2'b10;
      }
    endclass

  class c1;
    rand int num_class;
    rand c2c c2[]; 
    rand bit[1:0] i;
    rand bit[1:0] j;
    constraint num_c {
        num_class inside {[1:5]};
    }
    constraint size_c {
        c2.size() inside {[1:5]};
    }
    function void my_print();
      $display("i = %b", i);
      $display("j = %b", j);
      $display("num_class = %d", num_class);
    endfunction
    function void post_randomize();
        c2=new[num_class];
        foreach (c2[i]) 
        begin
            c2[i]=new;
            c2[i].randomize();
            c2[i].my_print();
        end
    endfunction 
    constraint c_1 {
      i == 2'b11;
      j == 2'b11;
    }
 
    endclass
 
  c1 o1 = new;
  //c1::c2 o2 = new;
module p1; 
  initial begin
    if (o1.randomize()) begin
      $display("randomization calling inside class randomization after newing it in post_randomize ");
      o1.my_print();
      o1.c2[0].my_print();
    end
 
    // Randomizing the nested class
    if (o1.c2[0].randomize()) begin
      o1.my_print();
      o1.c2[0].my_print();
    end
  end
endmodule:p1
