# NKSlideMenuTransition
##preview
![picture](https://github.com/NKJay/NKSlideMenuTransition/blob/master/picture.png?raw=true)
##How to use it
1.clone or download this project to your local directory   
2.if you want to see the effect open this project with xcode   
3.if you want to add this to your own project,copy NKSlideMenuTransition to your project's directory and add file to your project   
4.init a NKTransitionDelegate and set it the viewcontroller's delegate   
```swift
        let delegate = NKTransitionDelegate(targetEdge: UIRectEdge.Left)
        let viewController = ViewController2()
        viewController.transitioningDelegate = delegate
        presentViewController(viewController, animated: true, completion: nil)
```
5.you can config this animation with this,such us offset or scale or transitionDuration
```swift
delegate?.setTransitionArgument(400, scale: 0.5, transitionDuration: 0.5)
```
6.enjoy it!
