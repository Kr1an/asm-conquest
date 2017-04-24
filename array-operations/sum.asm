global sum

segment .data

segment .bss

segment .text
sum:
	movq mm0, qword [rdi]
	movq mm1, qword [rdi+8]
	movq mm2, qword [rdi+16]
	movq mm3, qword [rdi+24]
	
	paddq mm0, qword [rsi]
	paddq mm1, qword [rsi+8]
	paddq mm2, qword [rsi+16]
	paddq mm3, qword [rsi+24]
	
	movq qword [rdi], mm0
	movq qword [rdi+8], mm1
	movq qword [rdi+16], mm2
	movq qword [rdi+24], mm3	
	
	ret

