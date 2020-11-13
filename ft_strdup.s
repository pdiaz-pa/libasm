	segment .text
	global ft_strdup
	extern ft_strlen
	extern ft_strcpy
	extern malloc

ft_strdup:
	call	ft_strlen	; llamamos a strlen para saber la longitud de malloc
	add	rax, 1		; añadimos uno para el \0
	push	rdi		; guardamos en el stack el valor del argumento
	mov	rdi, rax	; lo movemos rax a rdi 
	call	malloc		; llamada a malloc, el return esta en rax
	pop	r9		; recoge el argumento que hemos guardado antes en la pila 
	mov	rdi, rax	; mueve el string al que hemos hecho malloc en rax a rdi (argumento) para hacerle cpy
	mov	rsi, r9		;
	call	ft_strcpy	; llama a strcpy(rdi, rsi), el return se guarda en rax
	ret			; devuelve rax, que es el nuevo string
