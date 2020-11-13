segment .text
	global ft_strcmp
; strcmp(const char *s1 = rdi, const char *s2 = rsi)
ft_strcmp:
	mov	rax, 0	; rax empieza en 0
	jmp	compara	; saltar a compara

compara:
	mov	al, BYTE [rdi]	; coge byte(un char del string) de rdi y lo mueve a al
	mov	bl, BYTE [rsi]	; coge byte(un char del string) de rsi y lo mueve a bl
	cmp	al, 0		; es al 0? (estamos al final de rdi?)
	je	exit		; si es que si, salta a exit
	cmp	bl, 0		; es bl 0? (estamos al final de rsi?)
	je	exit		; si es que si, salta a exit
	cmp	al, bl		; compara el char de al con el char de bl
	jne	exit		; si al comparar es distinto de 0, son diferentes
	inc	rdi		; movemos +1 el puntero de rdi
	inc 	rsi		; movemos +1 el puntero de rsi
	jmp	compara		; recursivo, si hemos llegado aqui es porque los char son iguales, asi que volvemos al principio para comparar el siguiente, ya que hemos sumado +1 a rdi y rsi

exit:
	movzx	rax, al		; movx copia un registro de inferior tamaño en uno mas grande(rax en este caso) y rellena los bits del otro con 0s
	movzx	rbx, bl		; lo mismo pero con bl y en rbx
	sub	rax, rbx	; guarda la diferencia entre rax y rbx en rax
	ret			; devuelve rax
