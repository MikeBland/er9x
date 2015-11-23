# SETUP (2/6) #
Setup basic variables for model.
  * Name - Press menu to edit.  Up/Down to change letter, Left/Right to move cursor.  Menu/Exit to exit edit.

  * Timer - Edit model Timer.  Pressing menu will blink the cursor.  The value can then be changed.
    1. OFF - Timer off.
    1. ABS - Absolute timer.  Counts down when radio is on.
    1. THS - Throttle Stick actuated. Counts down when throttle is not idle.
    1. TH% - Throttle %.  The higher the throttle the faster it counts down.
    1. Switch - A switch can be selected to control the timer.
      * The switch can be normal or 'momentary'.  The notation XXXm denotes a momentary switch which has to be pressed to toggle the timer on or off.

  * T-Trim - Throttle trim.  Allows the trim for the throttle channel to affect only the lower part of the range.  High throttle is unaffected by the trim.

  * T-Expo - Throttle Expo.  Sets the range for expo for the throttle channel to start from idle and not from the center.

  * Trim Inc - Trim increments.
    1. Exp - Exponential.
    1. ExFine - 1 step
    1. Fine - 2 steps
    1. Medium - 4 steps
    1. Coarse - 8 steps

  * Trim Sw - Trim Switch.  Selects a switch that when triggered will copy current control setup to subtrim.  Essentialy zeroing the trims.

  * Protocol - With PPM there are 2 options:
    1. Xch - sets the number of output channels.
    1. ch spacing - Sets the wait between channel pulses.  Increase if servo jitters.

  * TRIM->subTRIM - Press Long MENU to copy trim values to the subtrims.

  * DELETE MODEL - Press Long MENU to delete current model.



~Switches can be normal or reversed.  By pressing left you can see the following notation: !THR.  That means THR switch in reverse.