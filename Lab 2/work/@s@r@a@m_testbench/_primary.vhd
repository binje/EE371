library verilog;
use verilog.vl_types.all;
entity SRAM_testbench is
    generic(
        t               : integer := 10
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of t : constant is 1;
end SRAM_testbench;
