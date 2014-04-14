Lab 4 - Remote Terminal (PicoBlaze/MicroBlaze)
=====

#### Grades:
* Prelab - Check, on time
* PicoBlaze functionality - On time
* MicroBlaze functionality - On time

### Introduction

The goal of the laboratory exercise was to interface different peripherals of an FPGA (both the switches and the LEDs) to processors that we created, using both our written MicroBlaze and PicoBlaze processors.  

### Implementation

The implementation of this lab consisted of having to write code in OpenPicIDE for the PicoBlaze processor, and then output the code to a VHDL file for our ROM. After the ROM was created in VHDL, the UART modules were then written and instantiated in our top level file. After this, the code was then written to handle the `swt` and `led` commands in Tera Term (our chosen terminal program).

For the second part of the lab, this same functioanlity was to be implemented using MicroBlaze. The processor first had to be built using Xilinx Platform Studio. This design was then exported to SDK, where C code was written to accomplish the required functionality. The port map for my MicroBlaze processor can be seen below:

![alt text](http://i.imgur.com/veArrWW.png "MicroBlaze Port Map")

The modules that I wrote for this lab are listed below complete with examples and explanations:

 * `atlys_lab_font_controller` - This file is the top level VHDL file that includes the instantiations of the `vga_sync`, `character_gen`, and `input_to_pulse` modules. The instantiations for each of these components can be seen below:

```vhdl
	Inst_input_to_pulse: entity work.input_to_pulse(Behavioral) PORT MAP(
		clk => pixel_clk,
		reset => reset,
		button => start,
		button_pulse => WE
	);
```

### Test/Debug

While working on this lab, I experienced issues with many of my VHDL modules. The problems I experienced can be seen below.
 * The first of my issues was with the hierarchichal design of the lab. I had initial issues determining which module were to be instantiated where, specifially with the `font_rom` and `char_screen_buffer` modules. Initially I had placed both of them in the top shell - `atlys_lab_font_controller` and I was experiencing many issues with my code. Ultimately though, I figured out to instantiate them both in the `character_gen` module (like the course website says), which solved this particular issue.
 * Another issue I experienced was with trying to generate the characters to be drawn to the screen in a separate `pixel_gen` module. In theory, this should have worked, but I was experiencing difficulties interfacing the `pixel_gen` module with the font ROM library, since I was no longer just drawing things on the screen. I eventually just scrapped my `pixel_gen` module altogether and created the apropriate code in the `character_gen` module using already existing inputs.
 * The final issue I experienced in this lab occured after I got the characters to display on the screen. The issue was that the very first and very last columns of pixels were being cut off. I had already implemented appropriate delays for blank in the top shell, but I couldn't figure out why this was happenening. After consulting with Captain Branchflower, he noted that my issue was most likely with the delay for `h_sync` and `v_sync`. After writing delays for these signals, the pixels were no longer being cut off, and I achieved basic functionality.


### Conclusion

Throughout the course of this lab, the major thing that I noticed was that although it was not as difficult as Lab 2, it was slightly more confusing in the beginning stages. The confusion stemmed from having a semi complete list of required modules, with no real direction on the order in which to instantiate them. This problem was overcome by thinking through the process carefully and appropriately deciding the placement of each of the modules. There is nothing that I would change in this lab, other than maybe assigning less points to A functionality, as it seems extremely difficult, yet carries 10% of the project grade.

 
