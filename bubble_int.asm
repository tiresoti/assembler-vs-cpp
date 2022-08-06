; bubble sort implementation for an array of 10 numbers
format ELF executable 3
entry start


start:
	
	mov ecx, [N]            ; set counter to size of array - 1
	
biggerloop:
	push ecx
	mov ecx, [N]
	
	mov esi, numbers        ; esi points to the 1st number in numbers (our source)
	mov edi, numbers + 4    ; edi points to the next number in numbers (destination)
	
	
	l1: mov eax, [esi]      ; put number in ax from esi
		mov edx, [edi]      ; put next number in dx
		cmp eax, edx        ; compare them
	
		jb l2               ; if dx <= ax, go further
		                    ; if greater, swap these numbers
		mov [esi], edx
		mov [edi], eax
	l2: add esi, 4          ; add 4 bytes to pointer because 4 is "pointer size"
		add edi, 4
		loop l1
	pop ecx                 ; pop counter from stack
	loop biggerloop         ; and every loop run it decreases by 1
	

	; after sorting we print the result on screen
	inc [N]                 ; we need to run through array N+1 times now
	mov ecx, [N]            ; set counter to new N
	mov esi, numbers        ; move pointer to the beginning of array


lprint:                     ; loop through the whole array to print it
	mov eax, [esi]

	push ecx
	call outint             ; to show result
	pop ecx

	add esi, 4              ; increase pointer
	loop lprint
	
	; exit program
	mov eax, 1 
	xor ebx, ebx
	int 0x80
	

outint:                  ; a function that converts number to decimal system and shows result
	mov edi, sorted+sorted_size-2
	                     ; move edi pointer to the last writable char in output string
	                     ; (the last one is EOL symbol, before it there's a newline symbol)

l:  xor edx, edx         ; nullify dx
	div [decradix]       ; divide eax by decimal radix. the mod automatically goes to dl
	add dl, '0'          ; add '0' to result to get its number code
	mov [edi], dl        ; write resulting encoded number to output string by edi pointer
	dec edi              ; move pointer lower
	or eax,eax           ; check if original number ended
	jnz l                ; if not, divide again
	
	; the io part
	mov eax, 4
	mov ebx, 1
	mov ecx, sorted
	mov edx, sorted_size
	int 0x80
	ret



segment readable writeable
numbers  dd 45678,952,1411,44449,0,1,33,115,228,8  ; the array to sort
N        dd 9                                      ; size of array - 1
decradix dd 10                                     ; decimal system radix
sorted   db '          ', 0xA                      ; string to write resulting numbers
sorted_size = $-sorted
