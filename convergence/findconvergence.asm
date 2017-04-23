%define a		qword [ebp+8]
%define b		qword [ebp+16]
%define h 		qword [ebp+24]
%define e  		qword [ebp+32]
%define t		dword [ebp+40]

	global findconvergence
section .data
	testv: dq 12.2
section .bss
	argument: resq 1
	functionvalue: resq 1
	sequencevalue: resq 1
	
section .text
findconvergence:
	push ebp
	mov ebp, esp

	
	fld qword [testv]
	fstp qword [argument]
	call findfunctionvalue

	mov ebx, t
	fld qword [functionvalue]
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

findsequencevalue:
;Arguments:
;	argument: value of x: should be qword
;Returns:
;	sequencevalue: value of S(x), qword value
	push ebp
	mov ebp, esp


	mov esp, ebp
	pop ebp
	ret

