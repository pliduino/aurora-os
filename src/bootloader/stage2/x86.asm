bits 16

section _TEXT class=CODE
                            ;  +4               +12                 + 16                    +24
; void _cdecl x86_div64_32(uint64_t dividend, uint32_t divisor, uint64_t *quotientOut, uint32_t *remainderOut);
global _x86_div64_32
_x86_div64_32:
    ; make new call frame
    push bp                 ; Save old call frame
    mov bp, sp              ; Initialize new call frame

    push bx,

    ; Dividing upper 32 bits
    mov eax, [bp + 8]       ; eax = Upper 32 bits dividend
    mov ecx, [bp + 12]      ; ecx = Divisor
    xor edx, edx            ; edx = 0
    div ecx                 ; eax = quotient, edx = remainder

    ; Storing upper 32 bits of quotient
    mov bx, [bp + 16]
    mov [bx + 4], eax

    ; Diving lower 32 bits
    mov eax, [bp + 4]       ; eax = Lower 32 bits dividend
    div ecx

    ; Storing results
    mov [bx], eax
    mov bx, [bp + 18]
    mov [bx], edx;

    pop bx

    mov sp, bp
    pop bp
    ret

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