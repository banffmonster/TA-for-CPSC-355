	
size = 10										//define the number of elements in the array
array_size = size * 4							//define equates for size of array
i_size = 4										//size of i
sum_size = 4									//size of sum
array_s = 16									//Define equates for stack offset of array
i_s = array_s + array_size						//stack offset of i
sum_s = i_s + i_size							//stack offset of sum
var_size = array_size + i_size + sum_size		//Calculate memory needed for local variables
alloc = -(16 + var_size) & -16					//Calculate amount of memory to allocate and deallocate
dealloc = -allocate							
fp		.req	x29								//define register aliases
lr		.req	x30

fmt: 	.string "array[%d] = %d (sum = %d)\n"
	
		.balign 4
		.global main
main:	stp 	fp, lr, [sp, alloc]!			//allocate space for local variables
		mov 	fp, sp							//update FP to current SP
		
		mov 	w19, 0
		str 	w19, [fp, i_s]					//initialize i to 0
		mov		w19, 0
		str		w19, [fp, sum_s]				//initialize sum to 0
		b		test1							//branch to test at bottom of loop1
	
loop1:	bl		rand							//call rand() function
		and		w20, w0, 0xFF					//mod 256 the result
		add		x21, fp, array_s				//
		ldr		w19, [fp, i_s]					//get current i
		str		w20, [x21, w19, SXTW 2]			//store result w20 into array[i]	
		ldr		w19, [fp, i_s]					//get current i
		add		w19, w19, 1						//increment i by 1
		str		w19, [fp, i_s]					//store the current i
test1:	cmp		w19, size						//loop while
		b.lt	loop1

		mov 	w19, 0			
		str		w19, [fp, i_s]					//set i to 0 again for the loop2
		b		test2							//branch to test at bottom of loop2                                                                        

loop2:	ldr		w19, [fp, i_s]					//get the current i
		add 	x21, fp, array_s 				//calculate array base address
		ldr		w20, [x21, w19, SXTW 2]			//get the value of array[i]
		ldr		w21, [fp, sum_s]				//get the current sum
		add 	w21, w21, w20					//sum = sum + array[i]
		str		w21, [fp, sum_s]				//store the current sum                                                                      
		adrp	x0, fmt							//arg 0 high
		add		x0, x0, :lo12:fmt				//arg 0 low
		ldr		w1, [fp, i_s]					//arg 1: i
		add 	x21, fp, array_s 				//calculate array base address
		ldr		w2, [x21, w19, SXIW 2]			//arg 2: array[i]
		mov		w3, [fp, sum_s]					//arg 3: sum
		bl		printf 							//call printf
		add		w19, w19, 1						//i++
		str		w19, [fp, i_s]					//store current i

test2:	cmp		w19, size
		b.lt	loop2

		mov		w0, 0
		ldp		fp, lr, [sp], dealloc   		//deallocate stack memory
		ret  	



									//return