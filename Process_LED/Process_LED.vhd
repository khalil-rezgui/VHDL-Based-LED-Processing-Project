-----------------------------------------------------------------------------------------
-- Create by: 			Khalil REZGUI
-- Create Date:    	14/03/2020 
-- Project Name: 	 	Gestion de l'afficheur 7 Segments  
-----------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all; 
use ieee.std_logic_unsigned.all;
use ieee.numeric_std;

ENTITY Process_LED IS

GENERIC
   (
      N : positive :=8
   );
	
PORT (

  clk ,IN1, IN2, IN3, IN4 : IN std_logic;
  TransEN1 	: OUT std_logic;
  TransEN2 	: OUT std_logic;
  TransEN3 	: OUT std_logic;
  Seg_value : OUT std_logic_vector(N-1 downto 0);
  LED 		: OUT std_logic_vector(3 downto 0):=x"0"
  );
END Process_LED;


ARCHITECTURE aCmpt OF Process_LED IS

SIGNAL sel : std_logic_vector(3 downto 0);
SIGNAL Seg_temp : std_logic_vector(N-1 downto 0):=x"FF";
type T_DATA is array (0 to 9) of std_logic_vector(N-1 downto 0);


-- Anode commune : Tableau des valeurs en BCD 7 Segments 
constant SEG_7 : T_DATA :=
  
            (x"C0",
				 x"F9",
             x"A4",
             x"B0",
             x"99",
				 x"92",
				 x"82",
				 x"F8",
				 x"80",
				 x"90");
				 
				 
BEGIN
	PROCESS (clk,IN1, IN2, IN3, IN4) 
		BEGIN
			IF (clk'EVENT AND clk='1') THEN 
				CASE sel IS
					WHEN x"0" => Seg_temp<=SEG_7(0); 	LED <=x"0";
					WHEN x"1" => Seg_temp<=SEG_7(1);		LED <=x"1";
					WHEN x"2" => Seg_temp<=SEG_7(2);		LED <=x"2";
					WHEN x"3" => Seg_temp<=SEG_7(3);		LED <=x"3";
					WHEN x"4" => Seg_temp<=SEG_7(4);		LED <=x"4";
					WHEN x"5" => Seg_temp<=SEG_7(5);		LED <=x"5";
					WHEN x"6" => Seg_temp<=SEG_7(6);		LED <=x"6";
					WHEN x"7" => Seg_temp<=SEG_7(7);		LED <=x"7";
					WHEN x"8" => Seg_temp<=SEG_7(8);		LED <=x"8";
					WHEN x"9" => Seg_temp<=SEG_7(9);		LED <=x"9";
					WHEN OTHERS => Seg_temp<=SEG_7(0);	LED <=x"0";
				END CASE ;
		   END IF;
	END PROCESS;
	
	Seg_value<=Seg_temp;

--	Le signal sel est la concat�nation des 4 entr�es 
	sel <=IN4&IN3&IN2&IN1;
	
--	Activation des 3 Afficheurs BCD 7 Segments 
	TransEN1 <= '0';
	TransEN2 <= '0';
	TransEN3 <= '0';
	
	
END aCmpt;