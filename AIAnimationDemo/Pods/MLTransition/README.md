MLTransition
============

Support for iOS7+.  

- Pop ViewController with pan gesture from middle or edge of screen.   
- It's useable with setting the `leftBarButtonItem` property of `UIViewController`    
   
Tips:    
The libirary uses a unpublish api(not private). But it's ok in my experience. My app has been approved.
     
**My library does not seek any reward,
but if you use this library, star it if you like. :)**

![MLTransition](https://raw.githubusercontent.com/molon/MLTransition/master/MLTransition.gif)


# Usage  

```
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOption{
[MLTransition validatePanBackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypePan];//or MLTransitionGestureRecognizerTypeScreenEdgePan
//...
return YES;
}

```    

