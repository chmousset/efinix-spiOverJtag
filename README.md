# JTAG to SPI bridge for openFPGALoader
[Efinity](https://www.efinixinc.com/products-efinity.html) project file to create binares for openFPGALoader.

# Supporting new devices/packages
For Trion, a tool helps creating a new sopported device:
```bash
./copy_trion.sh T13F256 T20F256
```
Depending on device and package, bank and pin names might change.

This requires to open Interface Designer, then checking the pin assignment (click on "Design" > "Show/Hide GPIO ressource assigner").

If Interface Designer complains about Bank being invalid, usually editing one of the banks voltage and saving solves the issue (but it doesn't usually block building).

# Updating openFPGALoader
Before adding the bitstream to openFPGALoader, it must be compressed.
```bash
gzip -c spiOverJtag_efinix_t20f256/outflow/spiOverJtag_efinix_t20f256.bit > openFPGALoader/spiOverJtag/spiOverJtag_efinix_t20f256.bit.gz
```

Alternatively, openFPGALoader stores gzipped bit files for the JTAG to SPI bridge in the /user directory, usually `/usr/share/openFPGALoader`.

When the bitstream is installed, we can now program the newly supported package:

```bash
openFPGALoader -c efinix_jtag_ft2232 -f --fpga-part t20f256 my_great_design.bin
```
