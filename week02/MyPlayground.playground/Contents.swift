import UIKit

let SIZE = 1024
let SYMBOL_SIZE = 16
let renderer = UIGraphicsImageRenderer(size: CGSize(width: SIZE, height: SIZE))

var image = renderer.image { (context) in
    let rt = renderer.format.bounds
    UIColor.white.setFill()
    context.fill(rt)
    
    let r1 = CGFloat.random(in: -1...1)
    let r2 = CGFloat.random(in: -1...1)
    let r3 = CGFloat.random(in: -1...1)
    let r4 = CGFloat.random(in: -1...1)
    
    let point = UIImage(systemName: "circle.dotted")
    
    for n in 1...50 {
        let ang2 = Double(n) / Double(50) * Double(2) * Double.pi
        print(ang2)
        for i in 1...100 {
            let ang1 = Double(i) / Double(100) * Double(2) * Double.pi
            var xPos = sin(ang1*r1)
            xPos = xPos * 150 * cos(ang2*r2)
            xPos = xPos + Double(SIZE) / 2
            
            var yPos = cos(ang1*r3)
            yPos = yPos * 150 * sin(ang2*r4)
            yPos = yPos + Double(SIZE) / 2
            
            point?.draw(at: CGPoint(x: xPos, y: yPos))
        }
    }
    
}

image
