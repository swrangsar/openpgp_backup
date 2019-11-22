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

int mod_mul(int a, int b, int m)
{
	return ((a%m)*(b%m))%m;
}

int mod_inv(int a, int m)
{
	int inv=0;
	int t = 0;

	if (1 == egcd(a, m, &inv, &t)) {
		return ((inv % m) + m) % m;
	}

	return 0;
}

int mod_exp(int a, int b, int m)
{
	int p = 1;

	while (b) {
		if (b & 1) {
			p = mod_mul(p, a, m);
		}

		a = mod_mul(a, a, m);
		b /= 2;
	}

	return p;
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

	int prime = 29;
	
	printf("\ntest prime is %d\n", prime);
	for (int i=1; i < prime; ++i) {
		int inv = mod_inv(i, prime);
		printf("%d * %d == %d mod %d\n", i, inv, (i*inv)%prime, prime);
	}

	for (int i=0; i < 64; ++i) {
		printf("2^%d=%d mod 2\n",i, mod_exp(2, i, 2));
		printf("2^%d=%d mod 3\n",i, mod_exp(2, i, 3));
		printf("2^%d=%d mod 7\n",i, mod_exp(2, i, 7));
	}


	return 0;
}
