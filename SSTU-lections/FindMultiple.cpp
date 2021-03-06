#include <iostream>
using namespace std;

int res = 0;
int offset = 0;

void find(int n) {
	if(n == 1) return;
	for(int i = 9; i > 1; i--)
		if(n % i == 0) {
			int buf = i;
			for(int j = 0; j < offset; j++) buf*=10;
			res+= buf;
			offset++;
			find(n/i);
			return;
		}
	cerr << "No results";
	exit(1);
} 


int main() {
	cout << "Enter N: ";
	int n;
	cin >> n;
	find(n);
	cout << "Result: " << res;
}
