%macro tprint 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%define a		qword [ebp+8]
%define b		qword [ebp+16]
%define c		qword [ebp+24]
%define rootfirst	dword [ebp+32]
%define rootsecond	dword [ebp+36]

%define rad		qword [ebp-8]
%define recip_2a	qword [ebp-16]

	global findroots
section .data
		
	tvar1: dw 19
	minusfour: dw -4
	minusone: dw -1
	two: dw 2
	test_msg: db "TEST: initial msg", 10
	test_msg_len: equ $-test_msg
	desc: dq -1	
	
section .text
findroots:

	push ebp
	mov ebp, esp

	mov ebx, rootfirst
	fld a
	fld c
	fmulp st1, st0
	fild word [minusfour]
	fmulp st1, st0
	fld b
	fld b
	fmulp st1, st0
	faddp st1, st0
	fst qword [desc]	

	ftst
	fstsw ax
	sahf
	jb no_real_solutions
	jz one_root
	ja two_roots
	mov eax, -1
	jmp quit

no_real_solutions:
	mov eax, 0	
	jmp quit
one_root:
	fild word [minusone]
	fld b
	fmulp st1, st0	
	mov ebx, rootfirst
	fild word [two]
	fdivp st1, st0	
	fld a
	fdivp st1, st0
	mov ebx, rootfirst
	fstp qword [ebx]
	mov eax, 2
	jmp quit
two_roots:
	fld qword [desc]
	fsqrt
	fild word [minusone]
	fld b
	fmulp st1, st0
	faddp st1, st0
	fild word [two]
	fdivp st1, st0
	fld a
	fdivp st1, st0
	mov ebx, rootfirst
	fstp qword [ebx]

	fld qword [desc]
	fsqrt
	fild word [minusone]
	fmulp st1, st0
	fild word [minusone]
	fld b
	fmulp st1, st0
	faddp st1, st0
	fild word [two]
	fdivp st1, st0
	fld a
	fdivp st1, st0
	mov ebx, rootsecond
	fstp qword [ebx]

	mov eax, 1
	jmp quit
quit:
	mov esp, ebp
	pop ebp
	ret

