# Cheap LED Backlight #

HobbyKing have released a range of cheap LED based lights for the radio.

http://www.hobbyking.com/hobbyking/store/__17129__Turnigy_9X_LCD_Backlight_Kit_White_DIY_.html

These lights are functional, and will deliver a decent light system.

However you should take note of the following key point.

  * The er9x firmware will not be able to turn this light on or off without some <a href='http://www.rcgroups.com/forums/showpost.php?p=18732545&postcount=7855'>modification to the led board and an install of a switching system</a> - this will require some soldering.  If you are happy with the light being on pretty much all the time... then no problem.  Dont worry about the mod!

--

There has been some debate regarding the power usage of these boards.  Thanks to Showmaster on the 9xforums we have this information now for your reference:

HK White Backlight current draw vs. voltage applied 5-13V
The backlight has 2 leds wired in series.
5V = 5Ma
6V =7Ma
7V = 9Ma
7.4V = 9.8Ma
8V = 11Ma
9V = 13Ma
9.6V = 14.25Ma
10V = 15Ma
11V = 17Ma
12V = 19Ma
12.6V = 20Ma
13v = 21Ma
Brightness of the backlight does depend on TX battery voltage used. The brightness at 7.4V was more like the stock EL on the SP board. At 9.6V to 12.6V the brightness was much brighter. !2 volts was a little brighter than 9.6-10V but the current went up to 20Ma. I use a LiFe 9.6 volt HK battery so I’m going to use 14.25Ma as my final current constant .My metering of course may have some difference in accuracy but should be close enough for most.
For those using a 2 cell 7.4 type battery setup you may want to lower the 470 ohm resistor to allow the current to be 14Ma as the brightness increase is noticeable.