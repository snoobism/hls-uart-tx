#include <ap_int.h>
extern void top(ap_uint<8> data, ap_uint<1> load, ap_uint<1> write,
		ap_uint<1>& full, ap_uint<1>& empty, ap_uint<1>& tx);
int main() {
	int ret = 0;
	ap_uint<1> full, empty, tx, load, write;
	ap_uint<8> data;
	data = 0xCA;
	load = 1;
	write = 0;
	top(data, load, write, full, empty, tx);
	write = 1;
	top(data, load, write, full, empty, tx);

	for(int i = 0; i < 20; i++) {
		top(data, load, write, full, empty, tx);
	}
	return ret;
}
