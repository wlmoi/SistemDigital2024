library IEEE;
-- Question!!! Why do we always use library IEEE  [ :) ]
-- The IEEE library contains one of the most basic package, for example: std_logic_1164.
-- It contains the types std_logic (similar to bit) and std_logic_vector (similar to bit_vector) data types.
-- Digital signals are different in the sense that it can have values other than '0' or '1'.

use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all; -- We use text again to output text!


-- Define an entity for the testbench. For simulation.
entity SimpleWords1_tb is
end entity SimpleWords1_tb;

-- Algorithm 
architecture sim of SimpleWords1_tb is
begin
    process 
        variable l1: line; -- A variable to hold the text line
        variable l2: line; -- Another variable to hold the text line
    begin
        write(l1, string'("Hi everybody!"));
        write(l2, string'("My name is William!"));
        writeline(output, l1); -- Output the first line variable to the console
        writeline(output, l2); -- Output the second line variable to the console
        wait; -- Wait forever; this is just a simulation
    end process;
end architecture sim;
