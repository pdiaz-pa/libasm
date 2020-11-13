	extern __errno_location
	segment .text
	global ft_write
	

ft_write:		; rdi = fd, rsi = str, rdx = byte count
	mov	rax, 1	; 1 es el codigo de write
	syscall		; llamada a write
	cmp	rax, 0	; compara 0 con rax
	jl	_error	; es menor que 0?  entonces salta a error
	ret		; return rax

_error:
	neg	rax			; transforma rax a valor absoluto
	mov	rdi, rax		; mueve rax a rdi
	call	__errno_location	; llamada a errno location. su valor se guarda en rdi
	mov	[rax], rdi		; rdi guarda el valor de errno location en el lugar de memoria que apunta rax
	mov	rax, -1			; devuelve -1, igual que la funcion original
	ret				;
