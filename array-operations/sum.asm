global sum

segment .text
sum:
	movq mm0, qword [rdi]
	movq mm1, qword [rdi+8]
	
	paddq mm0, qword [rsi]
	paddq mm1, qword [rsi+8]
	
	movq qword [rdi], mm0
	movq qword [rdi+8], mm1
	
	ret

