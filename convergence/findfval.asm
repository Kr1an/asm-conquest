%define arg_def		qword [ebp+8]
%define fval_def	dword [ebp+16]

global findfval

segment .data
segment .bss
	arg: 	resq 1
	fval:	resq 1
segment .text
findfval:
	push ebp
	mov ebp, esp
	
	fld arg_def
	fstp qword [arg]

        fldln2
        fld qword [arg]
        fyl2x
        fld1
        fld1
        faddp st1, st0
        fdivp st1, st0  

	mov eax, fval_def 
	fstp qword [eax]       	

	mov eax, 0 
	mov esp, ebp
	pop ebp
	ret
