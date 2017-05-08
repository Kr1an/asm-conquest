global arr_ops

segment .data
	

segment .bss
	tmp_0: resq 2
	tmp_1: resq 2

segment .text
arr_ops:
	movq mm0, qword[rdi]
	pxor mm1, mm1
	movq mm6, mm0
	punpcklbw mm6, mm1
	pxor mm1, mm1	
	movq mm7, mm0
	punpckhbw mm7, mm1
	movq qword [tmp_0], mm6
	movq qword [tmp_0+8], mm7
	movupd xmm0, [tmp_0]

	movq mm0, qword[rsi]
	pxor mm1, mm1
	movq mm6, mm0
	punpcklbw mm6, mm1
	pxor mm1, mm1
	movq mm7, mm0
	punpckhbw mm7, mm1
	movq qword [tmp_0], mm6
	movq qword [tmp_0+8], mm7
	movupd xmm1, [tmp_0]

	movq mm0, qword[rdx]
	pxor mm1, mm1
	movq mm6, mm0
	punpcklbw mm6, mm1
	pxor mm1, mm1
	movq mm7, mm0
	punpckhbw mm7, mm1
	movq qword [tmp_0], mm6
	movq qword [tmp_0+8], mm7
	movupd xmm2, [tmp_0]

	movupd xmm3, [rcx]

	paddw xmm0, xmm1
	paddw xmm2, xmm3
	pmullw xmm0, xmm2

	movupd [rcx], xmm0	

	ret

