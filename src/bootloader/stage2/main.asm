org 0x0
bits 16

%define ENDL 0x0D, 0x0A

start:
    ; print message
    mov si, msg_hello
    call puts

.halt:
    cli
    hlt

puts:
    push si
    push ax
    mov ah, 0x0E        ; sets bios interrupt -- Write Character in TTY Mode

.loop:
    lodsb       ; loads next character in al
    or al, al   ; verify if next character is null
    jz .done

    int 0x10

    jmp .loop

.done:
    pop ax
    pop si
    ret

msg_hello: db 'Hello world from stage2!', ENDL, 0