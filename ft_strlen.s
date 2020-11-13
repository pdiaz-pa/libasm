
segment .text
	global ft_strlen
; strlen(const char *str = arg0 = rdi)
ft_strlen:
	mov	rax, 0	; MUeve 0 a rax 
	jmp	conta	; salta a conta
conta:
	cmp 	byte [rdi + rax], 0 	; si el byte de rdi(arg0) + rax es 0
	je	exit			; entonces salta a exit
	inc	rax			; rax++
	jmp 	conta			; salta a conta de nuevo, se repetira con ese +1 en rax

exit:
	ret			; return (rax)
