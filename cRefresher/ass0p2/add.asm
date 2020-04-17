global add

section .data
        digit: db 0
        resultText: db 'Result : '
        resultTextLen: equ $-resultText
        neg_sign: db '-'
        neg_signLen: equ $-neg_sign
        newline: db '',10

section .text

add:
        mov r8, rdi             ;temporarily store parameters in r8, r9 
        mov r9, rsi

        mov rax, 1              ;print "Result : "
        mov rdi, 1
        mov rsi, resultText
        mov rdx, resultTextLen
        syscall

        mov rax, r8
        add rax, r9             ;add the numbers
        
        mov r11, 0
        test rax, rax
        jns print_digit
        
        neg rax
        mov r11, 1
        
        print_digit:
                call printDigit

        mov rax, 60             ;exit
        mov rdi, 0
        syscall

printDigit:
        mov r8, 0               ;initiate r8, r9 with 0
        mov r9, 0               ;initiate r10 with 10 for mod
        mov r10, 10


        push_while:             ;while loop to push digits by character
                add r8, 1
                mov rdx, 0
                div r10
                push rdx
                cmp rax, 0
                je print_neg    ;jump if result == 0
                jmp push_while


        print_neg:
                cmp r11, 1
                jne pop_while
                mov rax, 1
                mov rdi, 1
                mov rsi, neg_sign
                mov rdx, neg_signLen
                syscall
        
        
        pop_while:              ;while loop to print digits by character
                cmp r8, 0       
                je end          ;jump if counter r8 == 0
                pop r9
                add r9, 48
                mov [digit], r9b
                mov rax, 1
                mov rdi, 1
                mov rsi, digit
                mov rdx, 1
                syscall
                sub r8, 1
                jmp pop_while
        end:                    ;end of loop and print new line character
                mov rax, 1
                mov rdi, 1
                mov rsi, newline
                mov rdx, 1
                syscall
                ret
