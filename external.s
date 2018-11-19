//data section			
			.data
a_m:     	.byte     10          // 1 byte: a singer char with ascii code 10                        
b_m:     	.hword    20          // half word: 2 bytes
c_m:     	.word     30          // word: 4 bytes               
d_m:     	.dword    40          // double word: 8 bytes                
arraya_m: 	.skip     5*4         // 5*4 = 20 bytes of uninitialized memory 
arrayb_m:	.word     10, 20, 30, 40, 50	// array of 5 words           
arrayc_m:	.dword    10, 20, 30, 40, 50   // array of 5 dwords 
sa_m:    	.string   "this string is null-terminated"      
sb_m:    	.asciz    "this string is null terminated too"  
sc_m:    	.ascii    "this string is not null-terminated"  
char_m:  	.byte     'a'                                   
chars_m: 	.byte     'h', 'e', 'l', 'l', 'o'          
//bss section
			.bss
array_m: 	.skip	10*4	// int array
e_m:	 	.skip	1		// char
f_m:	 	.skip	2		// short int  
//text section	 
			.text
const_m:	.word 3		//constant 3

			.balign 4
			.global main
main: 		stp		x29, x30, [sp, -16]!
			mov		x29, sp
			// access c
			adrp	x19, c_m
			add		x19, x19, :lo12:c_m
			ldr		w20, [x19]
			
			// access a
			adrp	x19, a_m
			add		x19, x19, :lo12:a_m
			ldrb	w21, [x19]
			
			// access arrayb using const_m as index
			adrp	x19, const_m
			add		x19, x19, :lo12:const_m
			ldr		w22, [x19]
			adrp	x19, arrayb_m
			add		x19, x19, :lo12:arrayb_m
			ldr		w23, [x19, w20, SXTW 2]
			// access char_m 
			adrp	x19, char_m
			add		x19, x19, :lo12:char_m
			ldr		w24, [x19]
			
			// access chars_m and print it one by one
			//for(int i=0; i<5, i++){		<-- write your code here
			//	putchar(chars_m[i]);
			//	}
			adrp	x19, chars_m
			add		x19, x19, :lo12:chars_m
			mov		w25, 0
			b test
loop:		ldrb	w0, [x19, w25, SXTW]
			bl		putchar
			
			add		w25, w25, 1
test:		cmp		w25, 5
			b.lt	loop
			
			 
			
			//access sa and print it
			adrp	x19, sa_m
			add		x19, x19, :lo12:sa_m
			mov		x0,  x19
			bl printf
			
			ldp		x29, x30, [sp], 16
			ret
			
		