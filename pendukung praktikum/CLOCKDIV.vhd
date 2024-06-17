LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity CLOCKDIV is port(
	CLK: IN std_logic;
	DIVOUT: buffer BIT);
end CLOCKDIV;

architecture behavioural of CLOCKDIV is
	begin
		PROCESS(CLK)
			variable count: integer:=0;
			constant div: integer:=24;		
		begin
				if CLK'event and CLK='1' then
	
					if(count<div) then
						count:=count+1;						
						if(DIVOUT='0') then
							DIVOUT<='0';
						elsif(DIVOUT='1') then
							DIVOUT<='1';
						end if;
					else
						if(DIVOUT='0') then
							DIVOUT<='1';
						elsif(DIVOUT='1') then
							DIVOUT<='0';
						end if;
					count:=0;
					end if;

				end if;
		end process;
end behavioural;
		
	
	
	