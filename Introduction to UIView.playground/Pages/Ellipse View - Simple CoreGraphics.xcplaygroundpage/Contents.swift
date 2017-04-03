/*:
 
 For Core Graphics based views, like the built-in `UIView` class,
 the `draw(_:)` method would be called when the UIKit wants to draw this view.
 
 The `CGContext`, which is like the canvas for drawing, would be provided via
 `UIGraphicsGetCurrentContext` function call. Usually we would wrap `saveGState`
 and `restoreGState` method calls for isolating states of the context among different
 scopes.
 
 When the view requires to be updated, like when some properties related to drawing
 are changed, you call `setNeedsDisplay()` to hint the UIKit for re-drawing this view.
 
 */

import UIKit

class EllipseView: UIView {
    var fillColor: UIColor = UIColor.green {
        didSet {
            // Try to comment the following code line to see the behavior after
            // setting the `fillColor` to red.
            self.setNeedsDisplay()
        }
    }

    var centralDotRect: CGRect {
        let dotSize: CGFloat = 5.0
        var origin = self.center
        origin.x -= dotSize/2
        origin.y -= dotSize/2
        return CGRect(origin: origin, size: CGSize(width: dotSize, height: dotSize))
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        let context = UIGraphicsGetCurrentContext()!
        context.saveGState()
        defer { context.restoreGState() }

        context.setFillColor(self.fillColor.cgColor)
        context.fillEllipse(in: self.bounds)

        context.setStrokeColor(UIColor.black.cgColor)
        context.strokeEllipse(in: self.centralDotRect)
    }
}

let view = EllipseView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
view.fillColor = UIColor.red

//: ---
//:
//: [<- Previous](@previous) | [Next ->](@next)
//:
