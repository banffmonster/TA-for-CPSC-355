// example for tutorial 4.1, stack and load&store instructions
fp		.req x29
lr		.req x30

print_string:  	.string "1 + 2 + ...+ 98 + 99 = %d\n"
		.balign 4
		.global main
main:
		//save FP and LR to the stack, alloc 4 bytes for sum
		stp fp, lr, [sp, -(16+4)&-16]!
		mov fp, sp
		
		mov w19, 0
		mov w20, 1
		
		str w19, [fp, 16]
		str w20, [fp, 20]

		b loop_test

loop:		ldr w20, [fp, 20]
		ldr w19, [fp, 16]
		add w19, w19, w20
		add w20, w20, 1
		str w20, [fp, 20]
		str w19, [fp, 16]
		
loop_test:	
		cmp w20, 100
		b.lt loop


loop_exit:	ldr x0, =print_string
		ldr w1, [fp, 16]
		bl printf
		mov w0, 0
		ldp fp, lr, [sp], -(-(16+8)&-16)
		ret				
		
		 
