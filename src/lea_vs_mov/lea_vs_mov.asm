; rsi <- `codes` label address, a number
mov rsi, codes

; rsi <- memory content, starting at `codes` address
mov rsi, [codes]

; rsi <- `codes` address
; In this case, its equivalent to `mov rsi, codes`
; In general, the address can contain many components
lea rsi, [codes]

; rsi <- memory content, starting in (codes+rax)
mov rsi, [codes + rax]

; rsi <- codes + rax
; Equivalent to:
;   mov rsi, codes
;   add rsi, rax
; Its not possible to do this with just one `mov`
lea rsi, [codes + rax]
