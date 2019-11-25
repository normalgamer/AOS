[org 0x7C00]

main:
  mov si, hw
  call printString
  
    
  jmp $					;infinite loop
  
  
;functions
%include "printString.asm"


memSize resq 0 			

hw db 'Hello World', 0x0A, 0x0D, 'Assembly Operating System loaded in. For more info, visit ', 0x0A, 0x0D, 'https://github.com/normalgamer/AOS', 0

times 510-($-$$) db 0
dw 0xAA55				;boot signature
