#include <stdio.h>
#include <stdlib.h>


int egcd(int a, int b, int *const ps, int *const pt)
{
	int s0 = 1, t0 = 0;
	int s1 = 0, t1 = 1;
	int r = 0, q = 0;

	while ((r = a%b)) {
		int s=0, t=0;

		q = (a - r)/b;
		s = s0 - (q * s1);
		t = t0 - (q * t1);

		s0 = s1;
		t0 = t1;
		s1 = s;
		t1 = t;
		a = b;
		b = r;
	};

	*ps = s1;
	*pt = t1;

	return b;
}

int main(const int argc, const char *argv[])
{
	printf("extended euclidean algorithm\n");

	if (argc != 3) {
		printf("Usage: %s num1 num2\n", argv[0]);
		return 1;
	}

	const int a = atoi(argv[1]);
	const int b = atoi(argv[2]);
	int s = 0, t = 0;

	const int gcd = egcd(a, b, &s, &t);

	printf("gcd = %d = %d*%d + %d*%d\n", gcd, s, a, t, b);

	if (gcd == s*a + t*b)
		printf("check\n");

	return 0;
}
