library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_Std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity cache is
generic (N : Integer := 32);
port (
    clock   			: in  std_logic;
    we      			: in  std_logic;
	mem_procsseor		: in  std_logic;	-- memory = 0 / processor = 1
    index 				: in  std_logic_vector(4 downto 0);
	offset				: in  std_logic_vector((32/N) downto 0);
    datain_processor  	: in  std_logic_vector(N-1 downto 0);
    dataout_prcosseor 	: out std_logic_vector(N-1 downto 0);
	datain_mem			: in  std_logic_vector(127 downto 0);
	dataout_mem			: out std_logic_vector(127 downto 0)
  );
end entity cache;

architecture RTL of cache is

   type cache_type is array (0 to 31) of std_logic_vector(127 Downto 0);
   signal cache_mem : cache_type := ((others=> (others=>'0')));
   
begin

  process(clock) is

  begin
	if(falling_edge(clock))then
      if we = '1' then
        if( mem_procsseor = '1')then
			cache_mem(to_integer(unsigned(index))) (to_integer(unsigned(offset))*N + N - 1 Downto  to_integer(unsigned(offset)) * N) <= datain_processor;
		else
			cache_mem(to_integer(unsigned(index))) <= datain_mem;
		end if;
	  end if;
	  end if;
  end process;

	dataout_prcosseor <= cache_mem(to_integer(unsigned(index))) (to_integer(unsigned(offset))*N + N - 1 Downto  to_integer(unsigned(offset))* N);
	dataout_mem <=  cache_mem(to_integer(unsigned(index)));
end architecture RTL;