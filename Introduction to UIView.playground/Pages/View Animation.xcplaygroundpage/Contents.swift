
import PlaygroundSupport
import UIKit

// Provide a white canvas view
let canvasView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
canvasView.backgroundColor = UIColor.white
// Post the canvas to the Playground timeline
PlaygroundPage.current.liveView = canvasView

let redBox = UIView(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
redBox.backgroundColor = UIColor.red
canvasView.addSubview(redBox)

let blueBox = UIView(frame: CGRect(x: 100, y: 250, width: 100, height: 100))
blueBox.backgroundColor = UIColor.blue
canvasView.addSubview(blueBox)

// Add some animation

UIView.animate(withDuration: 3.0) {
    blueBox.center.x += 50
    blueBox.center.y += 100
}

UIView.animate(withDuration: 1.0, delay: 3.0,
               options: [.repeat, .curveLinear],
               animations: {
                let currentTransform = redBox.transform
                let newTransform = currentTransform.rotated(by: CGFloat.pi)
                redBox.transform = newTransform
})

//: ---
//:
//: [<- Previous](@previous) | [Next ->](@next)
//:
