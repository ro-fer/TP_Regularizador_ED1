-- Ejercicio 4
library IEEE;
use IEEE.std_logic_1164.all;

entity cont is
	port(
		clk_i: in std_logic; -- Clock
		rst_i: in std_logic; -- Reset
		ena_i: in std_logic; -- Enable
		Q_o: out std_logic_vector (3 downto 0) -- Q = (QA, QB, QC, QD)
);
end;

architecture cont_a of cont is
	component ffd is
		port(
			clk_i: in std_logic; -- Clock
			rst_i: in std_logic; -- Reset
			ena_i: in std_logic; -- Enable
			D_i: in std_logic; -- D
			Q_o: out std_logic -- Q
);

-- Auxiliares
	signal E_aux: std_logic_vector (3 downto 0);
	signal S_aux: std_logic_vector (3 downto 0);

begin
	E_aux(3) <= S_aux(3) xor S_aux(2);
	E_aux(2) <= ((not S_(0)) and (not S_(2)));
	E_aux(1) <=  ‘0’;
	E_aux(0) <=  ‘0’;
	Q_0 <= S_aux;
	ffd_A: ffd
		port map(
			clk_i => clk_i,
			rst_i => rst_i,
			ena_i => ena_i,
			D_i => E_aux(3),
			Q_o =>S_aux(3)
		);

	ffd_B: ffd
		port map(
			clk_i => clk_i,
			rst_i => rst_i,
			ena_i => ena_i,
			D_i => E_aux(2),
			Q_o => S_aux(2)
		);
	ffd_C: ffd
		port map(
			clk_i => clk_i,
			rst_i => rst_i,
			ena_i => ena_i,
			D_i => E_aux(1),
			Q_o => S_aux(1)
		);
	ffd_D: ffd
		port map(
			clk_i => clk_i,
			rst_i => rst_i,
			ena_i => ena_i,
			D_i => E_aux(0),
			Q_o => S_aux(0)
		);
	end;

