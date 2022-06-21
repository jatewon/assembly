.model small
.stack 50
.data
tb1 db 'Hay nhap vao MSV:$'
tb2 db 10,13,'Ma sinh vien la:$'
str db 50 dup('$') 


.code
     main proc
        
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        lea dx,tb1
        int 21h
        
        mov ah,0ah
        lea dx,str
        int 21h
        
        mov ah,9
        lea dx,tb2
        int 21h
        
        lea dx,str+2
        int 21h
        
        mov ah,4ch
        int 21h
        
   main endp
     end main 