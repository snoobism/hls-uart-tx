# hls-uart-tx
A simple UART transmitter implemented in HLS.

Due to HLS not supporting generics, the UART TX uses a fixed baudrate of 115200. The project must also be connected to a 12MHz clock in order to hold the TX bits accordingly. Data can be load into a FIFO before being sent.

Signals:
- data 	:- byte to be load into the FIFO
- load	:- signal used to load data into the FIFO
- write :- signal used to serialize first FIFO byte and transmit it 
- full  :- FIFO full status
- empty :- FIFO empty status
- tx    :- UART TX signal

To generate the project, follow these steps:
1. Open Vitis HLS Command Line
2. Change directory to project location
3. Start a Vitis HLS tcl Command Line with `vitis_hls -f`
4. (Optional) Obtain your FPGA's part number. Call `list_part` to obtain supported FPGA families. Find your FPGA family and then call `list_part <family>` in order to obtain supported FPGA parts.
5. In `checkout.tcl` change `Vitis HLS Project User Settings` variables to reflect custom project (FPGA part and clk period (in ns))
6. In `checkout.tcl` change `Vitis HLS IP Package Settings` variables to customize the package process (IP version, name, description and vendor)
7. Run `source checkout.tcl`

If you don't need to access the tcl command line, the checkout script can be sourced with `vitis_hls -f checkout.tcl` alone.
