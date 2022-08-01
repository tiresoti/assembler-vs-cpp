#include <stdio.h>

int chisla[10] = {45678, 952, 1411, 44449, 0, 1, 33, 115, 228, 8};


int main() {
	int temp = 0;
	for(int i = 0; i < sizeof(chisla)/sizeof(int); ++i)
	{
		for(int j = 0; j < sizeof(chisla)/sizeof(int)-1; ++j)
		{
			if(chisla[j] > chisla[j+1])
			{
				temp = chisla[j];
				chisla[j] = chisla[j+1];
				chisla[j+1] = temp;
			}
		}
	}
	for(int i = 0; i < sizeof(chisla)/sizeof(int); ++i)
	{
		printf("%d\n", chisla[i]);
	}
	return 0;
}
