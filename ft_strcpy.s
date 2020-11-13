segment .text
	global ft_strcpy
	extern ft_strlen	; llama a strlen

; strcpy(rdi = dst, rsi = src)
ft_strcpy:
	push 	rdi		; guardamos rdi(arg0) en la pila
	mov 	rdi, rsi	; lo movemos a rsi
	call 	ft_strlen 	; llamamos a strlen, el resultado es guardado en rax
	mov 	rcx, rax	; movemos rax a rcx porque rcx es usado luego por rep
	pop 	rdi		; recuperamos rdi de la pila
	cld			; clear flag DF (security) DF = 0 = increment for rep, DF = 1 = decrement for rep
	mov 	rax, rdi	; el return es la primera direccion de rdi
	rep 	movsb		; movsb coge el string de rsi y lo pone en rdi, rep aumenta automaticamente hasta que rsi no es 0
	mov	BYTE [rdi], 0	; rdi fue incrementado por movsb, asi que estamos al final de la string copiada
	jmp 	exit		; salta a exit

exit:
	ret			; return rax
