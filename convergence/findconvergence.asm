%macro tprint 2
	mov eax, 4
	mov ebx, 1
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

%define a		qword [ebp+8]
%define b		qword [ebp+16]
%define h 		qword [ebp+24]
%define e  		qword [ebp+32]

	global findconvergence
section .data
	
section .text
findconvergence:

	push ebp
	mov ebp, esp

	
	jmp quit
quit:
	mov esp, ebp
	pop ebp
	ret

