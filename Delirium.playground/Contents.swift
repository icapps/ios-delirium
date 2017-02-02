import UIKit
import PlaygroundSupport

var str = "Hello, playground"


let background = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 200, height: 100)))
background.backgroundColor = UIColor.white
let origin = CGPoint(x: 20, y: 10)

let view = ShadowCornerView(frame: CGRect(origin: origin, size: CGSize(width: 150, height: 80)))
view.corners = [.topLeft, .bottomLeft]
background.addSubview(view)
view.backgroundColor = UIColor.white

PlaygroundPage.current.liveView = background
