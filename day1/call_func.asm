assume cs:code

data segment
	db 'Welcome to masm!',0
data ends

code segment
	
	start:
		mov dh, 8
		mov dl, 3
		mov cl, 2
		mov ax, data
		mov ds, ax
		mov si, 0
		call show_str

		mov ax, 4c00h
		int 21h

	show_str:
		
        mov ax, 0B800h
        mov es, ax
        mov al, 160
        mul dh
        mov bx, ax
        mov al, 2
        mul dl
        add bx, ax
        mov di, bx
        mov dl, cl
    p:
        mov ch, dl
        mov cl, [si]
        mov es:[di], cx
        inc si
        add di, 2
        mov ch, 0
		jcxz ok
		jmp short p

	ok:	ret

code ends

end start
