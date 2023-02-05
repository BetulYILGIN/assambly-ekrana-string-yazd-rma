mov ah, 00h
int 16h

cmp al, 'T'
je yaz1


yaz2:
 mov ah, 09h
    mov dx, offset yaz
    int 21h
    jmp done


yaz1:
   mov ah, 09h
    mov dx, offset gibtu
    int 21h

done:  
yaz db 'Bilgisayar muhendisligi$', 0
gibtu db 'Gibtu$', 0