.model small
.code
org 100h
start:
    jmp mulai
nama        db 13,10,'Nama Driver    : $'
plat        db 13,10,'Plat Kendaraan : $'
lanjut      db 13,10,'Untuk memilih jenis kendaaan silahkan tekan y --> $'
tampung_nama     db 30,?,30 dup(?)
tampung_plat     db 13,?,13 dup(?)

a db 01
b db 02
c db 03
d db 04
e db 05
f db 06
j dw 15

daftar  db 13,10,'                                                                         '
        db 13,10,'========================================================================='
        db 13,10,'||                   <  BIAYA PARKIR SEMESTA JAYA   >                  ||'
        db 13,10,'========================================================================='
        db 13,10,'|| NO |                 JENIS ATAU TIPE                 |    HARGA     ||'  
        db 13,10,'+--------------------------------------------------------+--------------+'
        db 13,10,'|| 01  | MOTOR BEBEK                                    |  RP.4.000    ||'
        db 13,10,'+--------------------------------------------------------+--------------+'
        db 13,10,'|| 02  | MOTOR LAKI                                     |  RP.5.000    ||'
        db 13,10,'+--------------------------------------------------------+--------------+'
        db 13,10,'|| 03  | MOBIL SEDAN ATAU SUV                           |  RP.8.000    ||'
        db 13,10,'+--------------------------------------------------------+--------------+'
        db 13,10,'|| 04  | BUS ATAU TRUK                                  |  RP.15.000   ||'
        db 13,10,'=========================================================================','$'


error       db 13,10,'JENIS KENDARAAN YANG ANDA MASUKAN TIDAK SESUAI $'
pilih       db 13,10,'Masukkan Jenis Kendaraan Anda = $'
success     db 13,10,'Anda Berhasil Mencetak Tiket parkir $'

mulai:
        mov ah,09h
        lea dx,nama
        int 21h
        mov ah,0ah
        lea dx,tampung_nama
        int 21h
        push dx

        mov ah,09h
        lea dx,plat
        int 21h
        mov ah,0ah
        lea dx,tampung_plat
        int 21h
        push dx

        mov ah,09h
        mov dx,offset daftar
        int 21h
        mov ah,09h
        mov dx,offset lanjut
        int 21h
        mov ah,01h
        int 21h
        cmp al,'y'
        je proses
        jne error_msg

error_msg:
    mov ah,09h
    mov dx,offset error
    int 21h
    int 20h

proses:
    mov ah,09h
    mov dx,offset pilih
    int 21h

    mov ah,1
    int 21h
    mov bh,al
    mov ah,1
    int 21h
    mov bl,al
    cmp bh,'0'
    cmp bl,'1'
    je hasil1

    cmp bh,'0'
    cmp bl,'2'
    je hasil2


    cmp bh,'0'
    cmp bl,'3'
    je hasil3

    cmp bh,'0'
    cmp bl,'4'
    je hasil4

    jne error_msg





;--------------------------------------------------------------------------

hasil1:
    mov ah,09h
    lea dx,teks1
    int 21h
    int 20h

hasil2:
    mov ah,09h
    lea dx,teks2
    int 21h
    int 20h

hasil3:
    mov ah,09h
    lea dx,teks3
    int 21h
    int 20h

hasil4:
    mov ah,09h
    lea dx,teks4
    int 21h
    int 20h


;--------------------------------------------------------------------------------------------------------

teks1   db 13,10,'                                                   '
        db 13,10,'JENIS KENDARAAN YANG ANDA PILIH ADALAH MOTOR BEBEK '
        db 13,10,'Total biaya yang harus anda bayar : Rp 4.000'
        db 13,10,'Terima Kasih telah bertransaksi $'

teks2   db 13,10,'                                                  '
        db 13,10,'JENIS KENDARAAN YANG ANDA PILIH ADALAH MOTOR LAKI '
        db 13,10,'Total biaya yang harus anda bayar : Rp 5.000'
        db 13,10,'Terima Kasih telah bertransaksi $' 

teks3   db 13,10,'                                                            '
        db 13,10,'JENIS KENDARAAN YANG ANDA PILIH ADALAH MOBIL SEDAN ATAU SUV '
        db 13,10,'Total biaya yang harus anda bayar : Rp 8.000 '
        db 13,10,'Terima Kasih telah bertransaksi $' 
        
teks4   db 13,10,'                                                     '
        db 13,10,'JENIS KENDARAAN YANG ANDA PILIH ADALAH BUS ATAU TRUK '
        db 13,10,'Total biaya yang harus anda bayar : Rp 15.000 '
        db 13,10,'Terima Kasih telah bertransaksi $' 

end start
