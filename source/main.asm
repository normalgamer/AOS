[org 0x7C00]

main:
  mov si, helloWorld  ; point si to hello world string
  call printString
  jmp $               ; infinite loop, jump to current instruction
  
printString:
  pusha               ; push register values into stack
  mov ah, 0x0E        ; tty
  .loop:              ; label inside function
    lodsb             ; load a byte of hello_world
    cmp al, 0         ; if al==0 end of string
    je .done          ; jump to done
    int 0x10          ; else write char
    jmp .loop         ; and repeat process untiil al=0
  .done
    popa              ; recover register values
    ret               ; return from function
    

helloWorld db 'Hello World', 0

times 510-($-$$) db 0 ; fill bootsector with zeroes
dw 0xAA55             ; boot signature
