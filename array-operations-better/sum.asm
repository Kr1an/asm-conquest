global sum

segment .bss
	input resq 2
segment .text

sum:
	movups xmm0, [rdi]
	movups xmm1, [rsi]
	paddw xmm0, xmm1 
	movupd [rdi], xmm0 
	;movd xmm0, [rdi]
	;movq mm1, qword [rdi+8]
	
	;paddq mm0, qword [rsi]
	;paddq mm1, qword [rsi+8]
	
	;movq qword [rdi], mm0
	;movq qword [rdi+8], mm1
	
	ret

