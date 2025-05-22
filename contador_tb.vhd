library IEEE;
use IEEE.std_logic_1164.all;
entity contador_tb is
end;
architecture cont_tb of contador_tb is
	component cont is
		port (
			clk_i: in std_logic; -- Clock
			rst_i: in std_logic; -- Reset
			ena_i: in std_logic; -- Enable
			Q_o: out std_logic_vector (3 downto 0) -- Q = (QA, QB, QC, QD)
		);
	end component;

	signal clk_tb: std_logic := '1';
	signal rst_tb: std_logic := '1';
	signal ena_tb: std_logic := '1';
	signal Q_tb: std_logic_vector (3 downto 0);
begin
	clk_tb <= not clk_tb after 20 ns;
	rst_tb <= '0' after 50 ns;
	DUT: cont
		port map(
			clk_i => clk_tb,
			rst_i => rst_tb,
			ena_i => ena_tb,
			Q_o => Q_tb
		);
end;