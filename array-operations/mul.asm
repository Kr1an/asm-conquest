global mul

segment .data

segment .bss

segment .text
mul:
	movq mm0, qword [rdi]
	movq mm1, qword [rdi+8]
	
	pmullw mm0, qword [rsi]
	pmullw mm1, qword [rsi+8]
	
	movq qword [rdi], mm0
	movq qword [rdi+8], mm1
	
	ret

