# hls-project
A basic setup for generating HLS projects.

This repo acts as a template for creating new HLS project.

To generate the project, follow these steps:
1. Open Vitis HLS Command Line
2. Change directory to `hls-project` location
3. Start a Vitis HLS tcl Command Line with `vitis_hls -f`
4. (Optional) Obtain your FPGA's part number. Call `list_part` to obtain supported FPGA families. Find your FPGA family and then call `list_part <family>` in order to obtain supported FPGA parts.
5. In `checkout.tcl` change `Vitis HLS Project User Settings` variables to reflect custom project (FPGA part and clk period (in ns))
6. In `checkout.tcl` change `Vitis HLS IP Package Settings` variables to customize the package process (IP version, name, description and vendor)
7. Run `source checkout.tcl`

If you don't need to access the tcl command line, the checkout script can be sourced with `vitis_hls -f checkout.tcl` alone.
