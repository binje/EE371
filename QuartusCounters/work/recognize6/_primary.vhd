library verilog;
use verilog.vl_types.all;
entity recognize6 is
    port(
        LEDvalue        : out    vl_logic;
        SW3             : in     vl_logic;
        SW2             : in     vl_logic;
        SW1             : in     vl_logic;
        SW0             : in     vl_logic
    );
end recognize6;
