global mul

segment .data

segment .bss

segment .text
mul:
	movupd xmm0, [rdi]
	movupd xmm1, [rsi]
	pmullw xmm0, xmm1
	movupd [rdi], xmm0
	;movq mm0, qword [rdi]
	;movq mm1, qword [rdi+8]
	
	;pmullw mm0, qword [rsi]
	;pmullw mm1, qword [rsi+8]
	
	;movq qword [rdi], mm0
	;movq qword [rdi+8], mm1
	
	ret

