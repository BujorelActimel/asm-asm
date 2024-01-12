bits 32                

segment code use32 public code
    global is_digit

    is_digit: ; bool is_digit(char c) -> eax = 1 if c is a digit, 0 otherwise
        mov eax, [esp + 4] ; eax = c

        cmp eax, '0'
        jl false

        cmp eax, '9'
        jg false

        mov eax, 1

        ret 4

        false:
            xor eax, eax
            ret 4
