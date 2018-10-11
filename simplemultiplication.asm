//this is the assembly file that implement simplemultiplication.c
// Define the strings
define(multiplier, w19)
define(multiplicand, w20)
define(product, w21)
define(i, w22)

initialValues:		.string "Multiplier = 0x%02x (%d) Multiplicand = 0x%02x (%d) \n\n"
printProduct:		.string "Product = 0x%02x (%d)\n\n"

	.balign 4					// Instructions word aligned
	.global main					// Make "main" visible to the OS
main:							// Main function, code starts
	stp	x29, x30, [sp, -16]!			//
	mov	x29, sp					// Update FP to current SP (post-incr SP)
	
	mov	multiplicand, 10			// Give multiplicand a value 00001010
	mov	multiplier, 11				// Give a multiplier a value 00001011
	mov	product, 0				// Give product a value 0
	mov	i, 0					// Give counter i a value 0

	adrp	x0, initialValues			// Set 1st arg of printf high
	add	x0, x0, :lo12:initialValues		// Set 1st arg of printf low
	mov	w1, multiplier				// 2nd
	mov	w2, multiplier				// 3rd
	mov	w3, multiplicand			// 4th
	mov	w4, multiplicand			// 5th
        bl      printf					// Print statement of innitial values
			
	b	test					// Jump to test
	
forloop:						// For loop
	tst	multiplier, 0x1				// test if bit-0 in multiplier == 1
	b.eq	nextIf					
	add	product, product, multiplicand		// add multiplicand to product once

nextIf:							// If statement
	lsr	multiplier, multiplier, 1		// shift right multiplier
	lsl	multiplicand, multiplicand, 1		// shift left multiplicant
	add	i, i, 1					// i++
test:							// Test for loop
	cmp	i, 4					// compare i < 4
	b.lt	forloop

resultPrint:						// result print
	adrp	x0, printProduct			//1st arg 
	add	x0, x0, :lo12:printProduct		//1st arg
	mov	w1, product				//2nd
	mov	w2, product				//3rd
	bl	printf					//call print
	
done:	mov	w0, 0					// Restore registers and returns to calling code
	ldp	x29, x30, [sp], 16			// Restore fp and lr from stack, post-incr sp
	ret						// Return to caller:
