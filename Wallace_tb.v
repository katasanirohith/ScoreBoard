  module wallace16;
    reg[15:0] a;
    reg[15:0]  b;
    wire[31:0]  y;
    wallace  inst(
        .a(a),
    .b(b),
    .y(y)
    );
    initial begin
    a =  0 0 0 0 0 0 0 0 0 1 1 1 1 1 0 1
;  
	b = 4;
    end

    initial
    begin
    $monitor("%d", y);
    end
    endmodule