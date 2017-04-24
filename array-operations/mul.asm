global mul

segment .data

segment .bss

segment .text
mul:
	movq mm0, qword [rdi]
	movq mm1, qword [rdi+8]
	movq mm2, qword [rdi+16]
	movq mm3, qword [rdi+24]
	
	pmulq mm0, qword [rsi]
	pmulq mm1, qword [rsi+8]
	pmulq mm2, qword [rsi+16]
	pmulq mm3, qword [rsi+24]
	
	movq qword [rdi], mm0
	movq qword [rdi+8], mm1
	movq qword [rdi+16], mm2
	movq qword [rdi+24], mm3	
	
	ret

