.model small
.stack 50
.data
str db 30 dup('$')
tb1 db 10,13,'nhap vao chuoi:$'
tb2 db 10,13,'chuoi in thuong:$'
tb3 db 10,13,'chuoi in hoa:$'
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
        call inthuong
        mov ah,9
        lea dx,tb3
        int 21h
        call inhoa
        
        
        mov ah,4ch
        int 21h
   main endp
     
     
 inthuong proc
     lea si,str+2
     lap1:
          mov dl,[si]
          cmp dl,'A'
          jl nhay  
          cmp dl,'Z'
          jg nhay
          add dl,32
          
      nhay:
          mov ah,2
          int 21h
          inc si
          cmp [si],'$'
          jne lap1
          
     ret 
 inthuong endp
 
 inhoa proc
    lea si,str+2
    lap2:
         mov dl,[si]
         cmp dl,'a'
         jl nhay2
         cmp dl,'z'
         jg nhay2
         sub dl,32
     nhay2: 
          mov ah,2
          int 21h
          inc si
          cmp [si],'$'
          jne lap2
          
    ret 
 inhoa endp
 

          
          