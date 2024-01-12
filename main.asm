; Se dau doua siruri continand caractere. 
; Sa se calculeze si sa se afiseze rezultatul 
; concatenarii tuturor caracterelor tip cifra 
; zecimala din cel de-al doilea sir dupa cele 
; din primul sir si invers, rezultatul concatenarii 
; primului sir dupa al doilea.

; Exemplu:
; sir1: "a12b"
; sir2: "0c2"
; rezultat: 0212, 1202

bits 32
global start

extern exit, printf
import exit msvcrt.dll
import printf msvcrt.dll

extern is_digit

segment data use32 class=data
    sir1 db "a12b3", 0
    len1 equ $ - sir1 - 1

    sir2 db "0c28", 0
    len2 equ $ - sir2 - 1

    format db "%d", 0
    entr db 10, 0

segment code use32 class=code
start:

    mov ecx, len2
    mov esi, 0

    repeat:
        push ecx
        mov al, [sir2 + esi]
        cbw
        cwde
        push eax
        call is_digit
        jz not_digit

        mov al, [sir2 + esi]
        cbw
        cwde
        sub eax, '0'
        push eax
        push format
        call [printf]
        add esp, 4 * 2

        not_digit:
            pop ecx
            inc esi
    loop repeat
    
    mov ecx, len1
    mov esi, 0

    repeat2:
        push ecx
        mov al, [sir1 + esi]
        cbw
        cwde
        push eax
        call is_digit
        jz not_digit2

        mov al, [sir1 + esi]
        cbw
        cwde
        sub eax, '0'
        push eax
        push format
        call [printf]
        add esp, 4 * 2

        not_digit2:
            pop ecx
            inc esi
    loop repeat2

    push entr
    call [printf]
    add esp, 4 * 1

    mov ecx, len1
    mov esi, 0

    repeat3:
        push ecx
        mov al, [sir1 + esi]
        cbw
        cwde
        push eax
        call is_digit
        jz not_digit3

        mov al, [sir1 + esi]
        cbw
        cwde
        sub eax, '0'
        push eax
        push format
        call [printf]
        add esp, 4 * 2

        not_digit3:
            pop ecx
            inc esi
    loop repeat3

    mov ecx, len2
    mov esi, 0

    repeat4:
        push ecx
        mov al, [sir2 + esi]
        cbw
        cwde
        push eax
        call is_digit
        jz not_digit4

        mov al, [sir2 + esi]
        cbw
        cwde
        sub eax, '0'
        push eax
        push format
        call [printf]
        add esp, 4 * 2

        not_digit4:
            pop ecx
            inc esi
    loop repeat4

	push dword 0 
	call [exit]
