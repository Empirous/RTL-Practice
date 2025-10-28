library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is 
-- empty
end testbench;

architecture tb of testbench is

constant DATA_WIDTH_C : integer := 32;

-- DUT component
component s_router is 
generic (
    DATA_WIDTH : integer := 32
  );
port(
  din    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
  din_en : in  std_logic;
  addr   : in  std_logic_vector(1 downto 0);
  dout0  : out std_logic_vector(DATA_WIDTH-1 downto 0);
  dout1  : out std_logic_vector(DATA_WIDTH-1 downto 0);
  dout2  : out std_logic_vector(DATA_WIDTH-1 downto 0);
  dout3  : out std_logic_vector(DATA_WIDTH-1 downto 0) 
);
end component;

signal i_din    : std_logic_vector(DATA_WIDTH_C-1 downto 0);
signal i_din_en : std_logic; 
signal i_addr   : std_logic_vector(1 downto 0);

signal o_dout0, o_dout1, o_dout2, o_dout3: std_logic_vector(DATA_WIDTH_C-1 downto 0);

begin

  DUT: s_router port map(i_din, i_din_en, i_addr, o_dout0, o_dout1, o_dout2, o_dout3);
  
  process
  begin
  	i_din    <= (others => '1');
    i_din_en <= '1';
  	i_addr   <= "00";
    wait for 5 ns;
    assert(o_dout0="11111111111111111111111111111111") report "Fail addr=00" severity error;
    assert(o_dout1="00000000000000000000000000000000") report "Fail addr=00" severity error;
    assert(o_dout2="00000000000000000000000000000000") report "Fail addr=00" severity error;
    assert(o_dout3="00000000000000000000000000000000") report "Fail addr=00" severity error;
    
    i_din    <= (others => '1');
    i_din_en <= '1';
  	i_addr   <= "01";
    wait for 5 ns;
    assert(o_dout0="00000000000000000000000000000000") report "Fail addr=01" severity error;
    assert(o_dout1="11111111111111111111111111111111") report "Fail addr=01" severity error;
    assert(o_dout2="00000000000000000000000000000000") report "Fail addr=01" severity error;
    assert(o_dout3="00000000000000000000000000000000") report "Fail addr=01" severity error;
    
    i_din    <= (others => '1');
    i_din_en <= '1';
  	i_addr   <= "10";
    wait for 5 ns;
    assert(o_dout0="00000000000000000000000000000000") report "Fail addr=10" severity error;
    assert(o_dout1="00000000000000000000000000000000") report "Fail addr=10" severity error;
    assert(o_dout2="11111111111111111111111111111111") report "Fail addr=10" severity error;
    assert(o_dout3="00000000000000000000000000000000") report "Fail addr=10" severity error;
    
    i_din    <= (others => '1');
    i_din_en <= '1';
  	i_addr   <= "11";
    wait for 5 ns;
    assert(o_dout0="00000000000000000000000000000000") report "Fail addr=11" severity error;
    assert(o_dout1="00000000000000000000000000000000") report "Fail addr=11" severity error;
    assert(o_dout2="00000000000000000000000000000000") report "Fail addr=11" severity error;
    assert(o_dout3="11111111111111111111111111111111") report "Fail addr=11" severity error;
    
    i_din    <= (others => '1');
    i_din_en <= '0';
  	i_addr   <= "00";
    wait for 5 ns;
    assert(o_dout0="00000000000000000000000000000000") report "Fail din_en=0" severity error;
    assert(o_dout1="00000000000000000000000000000000") report "Fail din_en=0" severity error;
    assert(o_dout2="00000000000000000000000000000000") report "Fail din_en=0" severity error;
    assert(o_dout3="00000000000000000000000000000000") report "Fail din_en=0" severity error;
    
    i_din    <= (others => '1');
    i_din_en <= '0';
  	i_addr   <= "01";
    wait for 5 ns;
    assert(o_dout0="00000000000000000000000000000000") report "Fail din_en=0" severity error;
    assert(o_dout1="00000000000000000000000000000000") report "Fail din_en=0" severity error;
    assert(o_dout2="00000000000000000000000000000000") report "Fail din_en=0" severity error;
    assert(o_dout3="00000000000000000000000000000000") report "Fail din_en=0" severity error;
    
    i_din    <= (others => '1');
    i_din_en <= '0';
  	i_addr   <= "10";
    wait for 5 ns;
    assert(o_dout0="00000000000000000000000000000000") report "Fail din_en=0" severity error;
    assert(o_dout1="00000000000000000000000000000000") report "Fail din_en=0" severity error;
    assert(o_dout2="00000000000000000000000000000000") report "Fail din_en=0" severity error;
    assert(o_dout3="00000000000000000000000000000000") report "Fail din_en=0" severity error;
    
    i_din    <= (others => '1');
    i_din_en <= '0';
  	i_addr   <= "11";
    wait for 5 ns;
    assert(o_dout0="00000000000000000000000000000000") report "Fail din_en=0" severity error;
    assert(o_dout1="00000000000000000000000000000000") report "Fail din_en=0" severity error;
    assert(o_dout2="00000000000000000000000000000000") report "Fail din_en=0" severity error;
    assert(o_dout3="00000000000000000000000000000000") report "Fail din_en=0" severity error;
  
  -- Clear inputs
  	i_din    <= (others => '0');
    i_din_en <= '0';
  	i_addr   <= "00";
  
  	assert false report "Test done." severity note;
    wait;
  end process;

end tb;
