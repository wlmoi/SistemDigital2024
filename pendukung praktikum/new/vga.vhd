LIBRARY  IEEE; 
USE  IEEE.STD_LOGIC_1164.ALL; 
USE  IEEE.STD_LOGIC_ARITH.ALL; 
USE  IEEE.STD_LOGIC_UNSIGNED.ALL;
 
ENTITY vga  IS 
	PORT(  
		i_clk              :  IN   STD_LOGIC; 
		i_red              :  IN   STD_LOGIC; 
		i_green            :  IN   STD_LOGIC; 
		i_blue             :  IN   STD_LOGIC; 
		o_red              :  OUT  STD_LOGIC; 
		o_green            :  OUT  STD_LOGIC; 
		o_blue             :  OUT  STD_LOGIC;  
		o_horiz_sync       :  OUT  STD_LOGIC; 
		o_vert_sync        :  OUT  STD_LOGIC; 
		o_pixel_row        :  OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 ); 
		o_pixel_column     :  OUT  STD_LOGIC_VECTOR( 9 DOWNTO 0 )); 
END vga; 

ARCHITECTURE behavioral OF vga  IS 

CONSTANT TH     : INTEGER := 800;
CONSTANT THB1   : INTEGER := 660;
CONSTANT THB2   : INTEGER := 756;
CONSTANT THD    : INTEGER := 640;

CONSTANT TV     : INTEGER := 525;
CONSTANT TVB1   : INTEGER := 494;
CONSTANT TVB2   : INTEGER := 495;
CONSTANT TVD    : INTEGER := 480;

SIGNAL clock_25MHz  :  STD_LOGIC; 
SIGNAL horiz_sync   :  STD_LOGIC; 
SIGNAL vert_sync    :  STD_LOGIC; 
SIGNAL video_on     :  STD_LOGIC; 
SIGNAL video_on_v   :  STD_LOGIC; 
SIGNAL video_on_h   :  STD_LOGIC; 
SIGNAL h_count      :  STD_LOGIC_VECTOR( 9 DOWNTO 0 ); 
SIGNAL v_count      :  STD_LOGIC_VECTOR( 9 DOWNTO 0 ); 

BEGIN 

video_on    <= video_on_h  AND video_on_v; 

o_red       <= i_red AND video_on; 
o_green     <= i_green AND video_on; 
o_blue      <= i_blue AND video_on; 

o_horiz_sync  <= horiz_sync; 
o_vert_sync   <= vert_sync; 

PROCESS (i_clk)
	BEGIN
		IF i_clk'EVENT AND i_clk='1' THEN
			IF (clock_25MHz = '0') THEN
				clock_25MHz <= '1';
			ELSE
				clock_25MHz <= '0';
			END IF;
		END IF;
	END PROCESS;

PROCESS 
	BEGIN 
	WAIT UNTIL(  clock_25MHz'EVENT  ) AND ( clock_25MHz  = '1'  ); 
	IF ( h_count  = TH-1 ) THEN 
		h_count  <= (others=>'0'); 
	ELSE 
		h_count  <= h_count  + 1; 
	END IF; 
	
	IF ( h_count  <= THB2-1 ) AND  (h_count  >= THB1-1 ) THEN 
		horiz_sync  <= '0'; 
	ELSE 
		horiz_sync  <= '1'; 
	END IF; 
    
	IF ( v_count  >= TV-1 ) AND ( h_count  >= 699 ) THEN 
		v_count  <= (others=>'0'); 
	ELSE IF ( h_count  = 699 ) THEN 
		v_count  <= v_count  + 1; 
		END IF; 
	END IF;

	IF ( v_count  <= TVB2-1 ) AND ( v_count  >= TVB1-1 ) THEN 
		vert_sync  <=  '0'; 
	ELSE 
		vert_sync  <= '1'; 
	END IF; 

	IF  ( h_count  <= THD-1 ) THEN 
		video_on_h  <= '1'; 
		o_pixel_column  <= h_count; 
	ELSE 
		video_on_h  <= '0'; 
	END IF; 
	
	IF ( v_count  <= TVD-1 ) THEN 
	    video_on_v  <= '1'; 
	    o_pixel_row  <= v_count; 
	ELSE 
	    video_on_v  <= '0'; 
	END  IF; 

END  PROCESS; 
END behavioral; 
	