-- https://chipdev.io/question/1
-- https://www.edaplayground.com/x/b7pD

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity s_router is
  generic (
    DATA_WIDTH : integer := 32
  );
  port (
    din    : in  std_logic_vector(DATA_WIDTH-1 downto 0);
    din_en : in  std_logic;
    addr   : in  std_logic_vector(1 downto 0);
    dout0  : out std_logic_vector(DATA_WIDTH-1 downto 0);
    dout1  : out std_logic_vector(DATA_WIDTH-1 downto 0);
    dout2  : out std_logic_vector(DATA_WIDTH-1 downto 0);
    dout3  : out std_logic_vector(DATA_WIDTH-1 downto 0)
  );
end entity s_router;

architecture rtl of s_router is
begin

  dout0 <= din when (din_en = '1' and addr = "00") else (others => '0');
  dout1 <= din when (din_en = '1' and addr = "01") else (others => '0');
  dout2 <= din when (din_en = '1' and addr = "10") else (others => '0');
  dout3 <= din when (din_en = '1' and addr = "11") else (others => '0');

end architecture rtl;
