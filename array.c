
#include <stdio.h>
#define SIZE 10
//calculate the sum of 10 random numbers that is less than 256
int main()
{
	int array[SIZE];
	int i = 0;
	int sum = 0;
	
	for(i = 0; i < SIZE; i++){
		array[i] = rand() & 0xFF;
	}

	for(i = 0; i < SIZE; i++){
		sum  = sum + array[i];
		printf("array[%d] = %d(sum = %d)\n", i, array[i], sum);
	}
	return 0;
}







