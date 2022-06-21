 .model small
 .stack 50
 .data
 tb1 db 'nhap so:$'
 tb2 db 'hienthi nhi phan:$'
 xdong db 10,13,'$'
 sobin db ?
 .code 
 main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,tb1
    int 21h
    call bin_in
    mov sobin,bl
    mov ah,9
    lea dx,xdong
    int 21h
    mov ah,9
    lea dx,tb2
    int 21h
    mov bl,sobin
    call bin_out
    mov ah,1
    int 21h
    mov ah,4ch
    int 21h
    
  bin_in  PROC
        MOV BX, 0 ; Xoa BL
        MOV CX, 16 ; nhap du 8 bit thi dung

   nhap:MOV AH, 01h ; ham nhap ky tu
        INT 21h
        CMP AL, 0Dh ;neu la phim  Enter thi thoi nhap
        JZ exit ; k phai Enter thi doi sang bit
        SHL BX, 1 ; Dic tri BL 1 bit
        SUB AL, 30h ; Ky so - 30h = so
        MOV AH, 0; clear AH
        ADD BX, AX ; Chuyen bit tu AL sang BL luu tru
        LOOP nhap
   exit:RET
bin_in ENDP
bin_out PROC
        MOV CX, 16 ; xuat 8 bit trong BL ra M.Hinh
   xuat:MOV DL, 0
        SHL BX, 1 ; CF chua MSB, xuat ra man hinh
        RCL DL, 1 ; dua CF vao LSB cua DL
        ADD DL, 30h ; So + 30h = Ky so
        MOV AH, 02h ; In ra man hinh
        INT 21h
        LOOP xuat
        RET
bin_out ENDP
  
