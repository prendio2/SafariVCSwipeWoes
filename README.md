# SafariVCSwipeWoes

Sample project for [rdar://23871289](http://openradar.appspot.com/23871289). **This is still not fixed in iOS 9.2.1.**

## Summary:
Safari View Controller is not released if the status bar is animating a style change when swiping back and user ends the interaction before the status bar animation is completed 

## Steps to Reproduce:
1. Present a Safari VC from a VC that has a UIStatusBarStyleLightContent status bar when Safari is not in private mode and has a default status bar
2. Swipe back quickly and let go of the Safari VC before the status bar has finished transitioning back to light style
3. Try and present another Safari VC

## Expected Results:
1. The initial Safari VC has been released
2. I can present another Safari VC

## Actual Results:
1. The initial Safari VC is still in memory and still referenced as the presentedViewController
2. This presentedViewController cannot be dismissed
3. I cannot present another Safari VC

## Regression:
Tested in iOS 9.2 simulator and on an iPhone 6S
