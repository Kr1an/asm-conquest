	global findroots
	section .data
	
	test_msg: db "TEST: initial msg"
	test_msg_len: equ $-test_msg	
	
	section .text
findroots:
	push ebp
	mov ebp, esp

	mov eax, 4
	mov ebx, 1
	mov ecx, test_msg
	mov edx, test_msg_len
	int 80h
	
	mov esp, ebp
	pop ebp
	ret
