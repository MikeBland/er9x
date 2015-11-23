# Introduction #

For the JETI-Duplex-Telemetry features you need to modify the hardware in the 9x Transmitter.

Please note: You need good soldering skills. Very small SMD-Resistors need to be soldered out!


# Details #

First of all, the radio must be already set up with an ISP-connection for flashing. We will use two connections of the ISP-Port for the telemetry later.

1. solder out the left two resistors from the PCB:

![![](http://utfreaks.de/blog/wp-content/uploads/2010/09/IMG_0575-150x150.jpg)](http://utfreaks.de/blog/wp-content/uploads/2010/09/IMG_0575-1024x768.jpg)
![![](http://gallery.privy.de/d/15646-1/9xmod2.jpg)](http://gallery.privy.de/d/15645-1/9xmod2.jpg)

On the picture, i soldered them out and resoldered them in a 90° standing position at the bottom pad. The open ends of the resistors are connected to two wires going to PC6 and PC7 on the AVR:

![![](http://utfreaks.de/blog/wp-content/uploads/2010/09/IMG_0574-150x150.jpg)](http://utfreaks.de/blog/wp-content/uploads/2010/09/IMG_0574-1024x768.jpg)

Thr.Cut (PE0, left resistor) goes to AVR PC6 (Pin 41, right) and Ail.DR (PE1, right resistor) goes to AVR PC7 (Pin 42, left).


2. reflash the 9x with the JETI-Version now. Check the Ail.DR and Thr.Cut switches for correct function in the DIAG-Screen.

3. Hook up the Jeti-Module like this:   (click to enlarge image!)

![![](http://gallery.privy.de/d/15478-2/9x-jeti-connection.png)](http://gallery.privy.de/d/15477-1/9x-jeti-connection.png)

Please note: You have to disconnect this to reflash the 9x avr!
I have connected the whole JETI-Part to the ISP-Plug in the battery-housing.

4. Use JETI-Telemetry!
Push the DOWN-Button long on the main screen to enter the JETI-Menu. Now you can use the UP, DOWN, LEFT and RIGHT buttons like on your JETI-Box. Press Exit to leave the JETI-Menu.


Any questions? -> shadow (at) privy.de