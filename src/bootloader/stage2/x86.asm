bits 16

section _TEXT class=CODE

; args: character, page
global _x86_Video_WriteCharTeletype
_x86_Video_WriteCharTeletype:

    ; make new call frame
    push bp             ; Save old call frame
    mov bp, sp          ; Initialize new call frame

    push bx

    mov ah, 0Eh
    mov al, [bp + 4]
    mov bh, [bp + 6]

    int 10h

    pop bx              ; Restoring bx

    mov sp, bp
    pop bp              ; Restoring bp
    ret