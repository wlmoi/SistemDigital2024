# LibraryLearning_1.vhd

---

### TL;DR
Dalam level sistem digital saat ini, library **IEEE.STD_LOGIC_1164** digunakan untuk memproses sinyal digital, sehingga mempermudah deskripsi rangkaian logika yang realistis.  
Anda hanya perlu memahami bahwa library ini adalah alat standar untuk mengolah sinyal digital seolah-olah menjadi suatu rangkaian logika.  
> :D Enjoy the learning process!!!

### Deskripsi
Program ini mendemonstrasikan penggunaan library **IEEE** dan package **STD_LOGIC_1164** pada VHDL.  
Library **IEEE** berisi pustaka standar yang digunakan untuk mendeskripsikan logika digital dalam VHDL.  
Package **STD_LOGIC_1164** adalah bagian dari library **IEEE** yang menyediakan tipe data dan operasi standar untuk menangani sinyal digital seperti bit dan vektor.

```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;  -- Menggunakan semua definisi dari package STD_LOGIC_1164

-- Entity deklarasi untuk contoh penggunaan sinyal digital
entity LibraryLearning_1 is
    Port ( A, B : in STD_LOGIC;   -- Input sinyal digital A dan B
           C : out STD_LOGIC      -- Output sinyal digital C
         );
end LibraryLearning_1;

-- Architecture untuk mendefinisikan perilaku logika
architecture Behavioral of LibraryLearning_1 is
begin
    -- Deskripsi logika dasar: C adalah hasil AND antara A dan B
    C <= A and B;  -- C akan '1' jika A dan B keduanya '1', selain itu C akan '0'
end Behavioral;

```

# Library IEEE dan Package STD_LOGIC_1164

### 1. `library IEEE`
Bagian ini mendeklarasikan bahwa kita akan menggunakan library **IEEE**.  
IEEE adalah standar internasional untuk desain perangkat keras elektronik, termasuk VHDL. Library ini menyediakan pustaka standar untuk mendeskripsikan logika digital.

### 2. `use IEEE.STD_LOGIC_1164.ALL`
Bagian ini memungkinkan kita untuk menggunakan tipe data dan operasi yang didefinisikan dalam package **STD_LOGIC_1164**.  
Package ini menyediakan tipe data seperti `STD_LOGIC` dan `STD_LOGIC_VECTOR`, yang sangat umum digunakan dalam desain digital.

- **`STD_LOGIC`** adalah tipe data yang mewakili sinyal logika dan bisa berada dalam kondisi seperti `'0'`, `'1'`, `'Z'` (high-impedance), `'X'` (unknown), dan lainnya.

---

### Penjelasan tentang `STD_LOGIC`

**`STD_LOGIC`** adalah tipe data yang digunakan untuk mendefinisikan sinyal logika dalam VHDL. Tipe data ini lebih fleksibel dibandingkan tipe data biner biasa karena memiliki banyak nilai tambahan selain `'0'` dan `'1'`. Berikut adalah nilai-nilai yang dapat diambil oleh `STD_LOGIC`:

- **`'0'`**: Menandakan logika rendah (low) atau kondisi tidak aktif.  
- **`'1'`**: Menandakan logika tinggi (high) atau kondisi aktif.  
- **`'Z'`**: Menandakan **high-impedance** atau keadaan terbuka (tidak terhubung), biasa digunakan dalam bus data.  
- **`'X'`**: Menandakan kondisi **undefined** atau tidak terdefinisi, biasanya digunakan saat sinyal tidak dapat dipastikan.  
- **`'W'`**: Menandakan kondisi **weak drive**, digunakan untuk sinyal dengan drive yang lemah.  
- **`'L'`**: Menandakan kondisi **low** dengan drive yang lemah.  
- **`'H'`**: Menandakan kondisi **high** dengan drive yang lemah.  
- **`'U'`**: Menandakan kondisi **uninitialized**, yang berarti sinyal belum diberikan nilai.  
- **`'-'`**: Menandakan **don't care**, yang berarti nilai sinyal tersebut tidak penting dalam konteks tertentu.

---

### Contoh Penggunaan Nilai `STD_LOGIC`
Jika diberikan operasi logika dasar seperti AND:

- Jika **A = '1'** dan **B = '1'**, maka **C = '1'**.  
- Jika **A = '0'** dan **B = '1'**, maka **C = '0'**.  
- Jika **A = '1'** dan **B = '0'**, maka **C = '0'**.  
- Jika **A = '0'** dan **B = '0'**, maka **C = '0'**.

---

### Keuntungan Penggunaan `STD_LOGIC`
Keuntungan utama dari penggunaan `STD_LOGIC` adalah fleksibilitasnya dalam menangani berbagai kondisi logika yang lebih realistis. Hal ini digunakan untuk mendesain perangkat keras digital yang kompleks dengan lebih akurat.

