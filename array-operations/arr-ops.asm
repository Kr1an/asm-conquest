global arr_ops

segment .data
	

segment .bss

segment .text
arr_ops:
	movq mm0, qword [rdi]
	paddsb mm0, qword [rsi]
	
	pxor mm1, mm1
	movq mm4, qword[rdx]
	punpcklbw mm4, mm1

	pxor mm1, mm1
	movq mm5, qword[rdx]
	punpckhbw mm5, mm1
	
	movq mm2, qword [rcx]
	movq mm3, qword [rcx+8]

	
	paddq mm2, mm4
	paddq mm3, mm5
	
	
	
	pxor mm1, mm1
	movq mm6, mm0
	punpcklbw mm6, mm1
	

	pxor mm1, mm1	
	movq mm7, mm0
	punpckhbw mm7, mm1


	pmullw mm2, mm6
	pmullw mm3, mm7
	
	movq qword [rcx], mm2
	movq qword [rcx+8], mm3
	
	ret

