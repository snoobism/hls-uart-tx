#include <ap_int.h>
#include <hls_stream.h>

// FSM states
typedef enum {
	READY,
	READ,
	SEND,
	SHIFT
} STATE;

#define BAUDRATE 9600
#define FREQUENCY 12000000

void top(ap_uint<8> data, ap_uint<1> load, ap_uint<1> write,
		ap_uint<1>& full, ap_uint<1>& empty, ap_uint<1>& tx) {
	#pragma HLS interface ap_ctrl_none port=return

	#pragma HLS interface ap_none port=data
	#pragma HLS interface ap_none port=load
	#pragma HLS interface ap_none port=write

	#pragma HLS interface ap_none port=full
	#pragma HLS interface ap_none port=empty
	#pragma HLS interface ap_none port=tx

	const ap_uint<32> bit_duration = FREQUENCY/BAUDRATE - 2;// number of clock cycles that must be held by a tx bit
	static bool load_d = 0;									// flip flop used to detect a load rising edge
	static bool write_d = 0;								// flip flop used to detect a write rising edge
	static STATE state = READY;								// current state of the FSM
	static ap_uint<32> bit_counter = 0;						// number of clock cycles currently held by a tx bit
	static ap_uint<10> shift_reg = 0b1111111111;			// shift register
	static ap_uint<4> bits_shifted = 0;						// number of bits shifted by the shift register
	bool load_edge, write_edge;								// wires representing rising edge detection
	ap_uint<10> uart_data;									// FIFO input for UART
	hls::stream<ap_uint<10>, 8> data_fifo;					// FIFO storing bytes to be sent

	// rising edge detectors; static reads first
	load_edge = load & !load_d;
	write_edge = write & !write_d;
	load_d = load;
	write_d = write;

	// FIFO status flags
	full = data_fifo.full();
	empty = data_fifo.empty();

	uart_data.range(0, 0) = 0;		// start bit
	uart_data.range(8, 1) = data;	// data bits
	uart_data.range(9, 9) = 1;		// stop bit

	// update TX based on FSM
	tx = (state == SEND || state == SHIFT) ? shift_reg.range(0, 0) : 1;

	// FSM
	switch(state) {
		case READY:
			bits_shifted = 0;
			if (!empty && write_edge) {
				state = READ;
			}
			break;
		case READ:
			shift_reg = data_fifo.read();
			state = SEND;
			break;
		case SEND:
			if (bit_counter < bit_duration) {
				bit_counter += 1;
			} else if(bits_shifted == 10){
				bit_counter = 0;
				state = READY;
			} else {
				bit_counter = 0;
				state = SHIFT;
			}
			break;
		case SHIFT:
			for(ap_uint<4> j = 0; j < 9; j++) {
				#pragma HLS UNROLL
				shift_reg.range(j, j) = shift_reg.range(j+1, j+1);
			}
			bits_shifted++;
			state = SEND;
			break;
		default:
			state = READY;
			break;
	}

	// load FIFO with data if load signal and FIFO is not full
	// write must occur after read, otherwise the latency is 2 instead of 1
	if (!full && load_edge) {
		data_fifo.write(uart_data);
	}
}
