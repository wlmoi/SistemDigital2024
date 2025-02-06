LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Traffic_Light_Controller IS
    PORT (
        clk        : IN  STD_LOGIC; -- Clock input
        reset      : IN  STD_LOGIC; -- Reset button
        traffic    : IN  STD_LOGIC; -- Traffic sensor (1 = heavy, 0 = normal)
        red_main   : OUT STD_LOGIC;
        yellow_main : OUT STD_LOGIC;
        green_main : OUT STD_LOGIC;
        red_side   : OUT STD_LOGIC;
        yellow_side : OUT STD_LOGIC;
        green_side : OUT STD_LOGIC
    );
END Traffic_Light_Controller;

ARCHITECTURE Behavior OF Traffic_Light_Controller IS
    TYPE State_Type IS (RED_MAIN, GREEN_MAIN, YELLOW_MAIN, RED_SIDE, GREEN_SIDE, YELLOW_SIDE);
    SIGNAL current_state, next_state : State_Type;
    SIGNAL timer : INTEGER RANGE 0 TO 30 := 0;
BEGIN
    PROCESS (clk, reset)
    BEGIN
        IF reset = '1' THEN
            current_state <= RED_MAIN;
            timer <= 0;
        ELSIF rising_edge(clk) THEN
            current_state <= next_state;
            IF timer > 0 THEN
                timer <= timer - 1;
            END IF;
        END IF;
    END PROCESS;

    PROCESS (current_state, traffic, timer)
    BEGIN
        -- Default outputs
        red_main <= '0'; yellow_main <= '0'; green_main <= '0';
        red_side <= '0'; yellow_side <= '0'; green_side <= '0';
        next_state <= current_state;

        CASE current_state IS
            WHEN RED_MAIN =>
                red_main <= '1'; green_side <= '1';
                IF timer = 0 THEN
                    next_state <= YELLOW_SIDE;
                    timer <= 3;
                END IF;
            
            WHEN YELLOW_SIDE =>
                yellow_side <= '1';
                IF timer = 0 THEN
                    next_state <= GREEN_MAIN;
                    timer <= 10;
                END IF;
                
            WHEN GREEN_MAIN =>
                green_main <= '1';
                IF traffic = '1' THEN
                    timer <= 15; -- Extended time for heavy traffic
                ELSE
                    timer <= 10;
                END IF;
                IF timer = 0 THEN
                    next_state <= YELLOW_MAIN;
                    timer <= 3;
                END IF;
                
            WHEN YELLOW_MAIN =>
                yellow_main <= '1';
                IF timer = 0 THEN
                    next_state <= RED_SIDE;
                    timer <= 10;
                END IF;
                
            WHEN RED_SIDE =>
                red_side <= '1'; green_main <= '1';
                IF timer = 0 THEN
                    next_state <= YELLOW_MAIN;
                    timer <= 3;
                END IF;
                
            WHEN OTHERS =>
                next_state <= RED_MAIN;
        END CASE;
    END PROCESS;
END Behavior;
