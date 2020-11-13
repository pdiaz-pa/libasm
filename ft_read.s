	extern	__errno_location
	segment .text
	global ft_read

ft_read:
	mov	rax, 0			; 0 es el código para read
	syscall				; llamada a read
	cmp	rax, 0			; compara rax con 0
	jl	exit_error		; es menor que 0? entonces salta a error
	ret				; devuelve rax

exit_error:
	neg	rax			; cambia rax a valor absoluto
	mov	rdi, rax		; mueve rax a rdi
	call	__errno_location	; llama a errno location y la direccion de memoria se guarda en rdi
	mov	[rax], rdi		; movemos el valor de errno location al lugar de memoria que apunta rax
	mov	rax, -1			; movemos -1 a rax para devolver lo mismo que la funcion original
	ret				; devuelve rax
