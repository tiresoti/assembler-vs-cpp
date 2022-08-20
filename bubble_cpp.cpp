#include <stdio.h>

int numbers[10] = {45678, 952, 1411, 44449, 0, 1, 33, 115, 228, 8};


int main() {
	int temp = 0;
	for(int i = 0; i < sizeof(numbers)/sizeof(int) - 1; ++i)
	{
		for(int j = 0; j < sizeof(numbers)/sizeof(int) - 1; ++j)
		{
			if(numbers[j] > numbers[j + 1])
			{
				temp = numbers[j];
				numbers[j] = numbers[j + 1];
				numbers[j+1] = temp;
			}
		}
	}
	for(int i = 0; i < sizeof(numbers)/sizeof(int); ++i)
	{
		printf("%d\n", numbers[i]);
	}
	return 0;
}
