library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use std.textio.all; -- Import the textio library

-- Define an entity for the testbench. It has no ports as it's just for simulation.
entity HelloWorld_tb is
end entity HelloWorld_tb;

-- Define an architecture for the testbench.
architecture sim of HelloWorld_tb is
begin
    process
        variable l: line; -- A variable to hold the text line
    begin
        write(l, string'("Hello World")); -- Write "Hello World" to the line variable
        writeline(output, l); -- Output the line variable to the console
        wait; -- Wait forever; this is just a simulation
    end process;
end architecture sim;

-- P E N J E L A S A N
-- VHDL itu seperti membuat rencana untuk membangun rumah.
-- Rencana tersebut menjelaskan bagaimana setiap bagian rumah harus dibuat dan bekerja sama.
-- Di VHDL, kita punya dua bagian utama:

-- Entity: Ini seperti daftar apa saja yang ada di rumah kita. 
-- Contohnya, pintu, jendela, dan lampu.
--  Dalam kode VHDL, ‘entity’ tidak menjelaskan detailnya, hanya daftarnya saja. (Ibaratkan kamus)

-- Architecture: Ini adalah bagian yang menjelaskan bagaimana setiap bagian di ‘entity’ bekerja.
-- Jadi, jika ‘entity’ kita punya lampu, di ‘architecture’ kita jelaskan bagaimana lampu itu menyala
-- ketika kita menekan saklar. (Ibaratkan algoritma)

--
---
----
-----
----
---
--
-- Sekarang, untuk “Hello World” di VHDL:

-- Kita tidak benar-benar membuat lampu menyala atau pintu terbuka. 
-- Sebagai gantinya, kita membuat sebuah pesan muncul di layar komputer 
-- saat kita menjalankan simulasi VHDL.
-- Di dalam kode simulasi yang saya berikan sebelumnya, 
-- ada sebuah proses yang seperti resep masakan yang memberitahu (Line 11)
-- komputer langkah demi langkah apa yang harus dilakukan.
-- Proses tersebut mengatakan untuk menulis “Hello World” dan (Line 15)
-- kemudian menunjukkannya di layar komputer.