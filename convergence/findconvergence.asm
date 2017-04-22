%define a		qword [ebp+8]
%define b		qword [ebp+16]
%define h 		qword [ebp+24]
%define e  		qword [ebp+32]
%define t		dword [ebp+40]

	global findconvergence
section .data
	testv: dq 12.2
section .text
findconvergence:
	push ebp
	mov ebp, esp

	mov ebx, t
	fld qword [testv]
	fstp qword [ebx]
	jmp quit
;	jmp findfunctionvalue
	
findfunctionvalue:
;Arguments:
;	eax: 'x' argument of the function
;Returns:
;	eax: function of x argument

	fld1
	;fldln2
	;fild qword [eax]
	;fyl2x
	
	mov ebx, t
	fstp qword [ebx]

	mov eax, 1
		
quit:
	mov esp, ebp
	pop ebp
	ret

