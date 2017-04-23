%define a		qword [ebp+8]
%define b		qword [ebp+16]
%define h 		qword [ebp+24]
%define e  		qword [ebp+32]
%define t		dword [ebp+40]

	global findconvergence
section .data
	testmsg: db "loop iteration", 10
	testmsg_len: equ $-testmsg
	testp: dq 2.0
	testv: dq 3.0
section .bss
	position: resq 1
	argument: resq 1
	functionvalue: resq 1
	sequencemembervalue: resq 1
	tmpvalue: resq 1
	count: resq 1
	trash: resq 1
	
section .text
findconvergence:
	push ebp
	mov ebp, esp

	
	fld qword [testv]
	fstp qword [argument]
	fld qword [testp]
	fstp qword [position]
	call findsequencemembervalue

	mov ebx, t
	fld qword [sequencemembervalue]
	fstp qword [ebx]
	
	mov eax, 1	
	
	mov esp, ebp
	pop ebp
	ret
	
	

findfunctionvalue:
;Arguments:
;	argument: value of x: should be qword
;Returns:
;	functionvalue: value of Y(x), qword value
	push ebp
	mov ebp, esp

	fldln2
	fld qword [argument]
	fyl2x
	fld1
	fld1
	faddp st1, st0
	fdivp st1, st0	

	fstp qword [functionvalue]
	
	mov esp, ebp
	pop ebp
	ret

findsequencemembervalue:
;Arguments:
;	argument: value of x, should be qword
;	position: position of needed memder, should be qword
;Returns:
;	sequencemembervalue: value of S(x), qword value
	push ebp
	mov ebp, esp
	push ecx	

	fld qword [argument]
	fld1
	fsubp st1, st0
	
	fld qword [argument]
	fld1
	faddp st1, st0
	fdivp st1, st0
	
	fld qword [position]
	fld qword [position]
	faddp st1, st0
	fld1
	faddp st1, st0
	fistp qword [count]
	mov ecx, [count]
	
	fstp qword [tmpvalue]	
	fld1
findroot:	
	fld qword [tmpvalue]
	fmulp st1, st0
	loop findroot 	
	fld1
	fld qword [position]
	fld1
	fld1
	faddp st1, st0
	fmulp st1, st0
	fld1
	faddp st1, st0
	fdivp st1, st0
	fmulp st1, st0	
	fstp qword [sequencemembervalue]
	pop ecx
	mov esp, ebp
	pop ebp
	ret

