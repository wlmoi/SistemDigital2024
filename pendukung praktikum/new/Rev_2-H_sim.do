# Resume macro file
onbreak {resume}

# Menghapus library yang telah dibuat jika ada
if [file exists work] {
    vdel -all
}

# Membuat library
vlib work

# Compile 
vcom modul2vhdl.vhd
