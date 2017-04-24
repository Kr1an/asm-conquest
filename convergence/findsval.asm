%define arg_def		qword [ebp+8]
%define fval_def	qword [ebp+16]
%define eps_def 	qword [ebp+24]
%define sval_def	dword [ebp+32]

global findsval

segment .data
	cnt:	dq 0
	sval:	dq 0.0
	testv: 	dq 0.1
	
segment .bss
	i:	resq 1
	arg:	resq 1
	eps:	resq 1
	fval:	resq 1
	tmpv: 	resq 1
	trash:	resq 1
segment .text
findsval:
	push ebp
	mov ebp, esp

	fld arg_def
	fld eps_def
	fld fval_def
	fldz
	fldz
	fldz
	fistp qword [i]
	fistp qword [cnt]
	fstp qword [sval]
	fstp qword [fval]
	fstp qword [eps]
	fstp qword [arg]
	
converg:

	fld qword [testv]
	fild qword [cnt]
	fmulp st1, st0
	fstp qword [sval]
	
;	fld qword [arg]
;	fld1
;	fsubp st1, st0
;
;	fld qword [arg]
;	fld1
;	faddp st1, st0
;
;	fdivp st1, st0

;	fild qword [cnt]
;	fild qword [cnt]
;	faddp st1, st0
;	fld1
;	faddp st1, st0
;
;	fistp qword [i]
;	mov ecx, [i]
;	
;	fstp qword [tmpv]
;	fld1
;powloop:
;	fld qword [tmpv]
;	fmulp st1, st0
;	loop powloop
;
;	fld1
;	
;	fild qword [cnt]
;	fld1
;	fld1
;	faddp st1, st0
;	fmulp st1, st0
;
;	fld1
;	faddp st1, st0
;
;	fdivp st1, st0
;
;	fmulp st1, st0
;
;	fld qword [sval]
;	faddp st1, st0
;
;	fstp qword [sval]
assert:
	fld qword [fval]
	fld qword [sval]
	fsubp st1, st0
	fabs
	fld qword [eps]
	fsubp st1, st0
	;jmp exit
	

	ftst
	fstsw ax
	sahf
	fstp qword [trash]

	jb found
inc:
	fild qword [cnt]
	fld1
	faddp st1, st0
	fistp qword [cnt]

	jmp converg
found:
	mov eax, sval_def
exit:
	fld qword [sval]
	fstp qword [eax]
	mov eax, [cnt]
	
	mov esp, ebp
	pop ebp
	ret
	
