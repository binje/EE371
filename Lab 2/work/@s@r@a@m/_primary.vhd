library verilog;
use verilog.vl_types.all;
entity SRAM is
    generic(
        WIDTH           : integer := 128;
        WORD_BIT_SIZE   : integer := 8
    );
    port(
        ReadData        : out    vl_logic_vector;
        ReadRegister    : in     vl_logic_vector(6 downto 0);
        WriteRegister   : in     vl_logic_vector(6 downto 0);
        WriteData       : in     vl_logic_vector(6 downto 0);
        WriteEnable     : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of WIDTH : constant is 1;
    attribute mti_svvh_generic_type of WORD_BIT_SIZE : constant is 1;
end SRAM;
