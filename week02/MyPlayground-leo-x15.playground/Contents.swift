import UIKit

let SIZE = 1024
let SYMBOL_SIZE = 16
let TEXT_POOL = "明月几时有把酒问青天不知天上宫阙今夕是何年我欲乘风归去又恐琼楼玉宇高处不胜寒起舞弄清影何似在人间转朱阁低绮户照无眠不应有恨何事长向别时圆人有悲欢离合月有阴晴圆缺此事古难全但愿人长久千里共婵娟"

let renderer = UIGraphicsImageRenderer(size: CGSize(width: SIZE, height: SIZE))

var image = renderer.image { (context) in
    let rt = renderer.format.bounds
    UIColor.white.setFill()
    context.fill(rt)
    
    let r1 = CGFloat.random(in: -1...1)
    let r2 = CGFloat.random(in: -1...1)
    let r3 = CGFloat.random(in: -1...1)
    let r4 = CGFloat.random(in: -1...1)
    
    for n in 1...50 {
        let ang2 = Double(n) / Double(50) * Double(2) * Double.pi
        print(ang2)
        for i in 1...100 {
            let ang1 = Double(i) / Double(100) * Double(2) * Double.pi
            var xPos = sin(ang1*r1)
            xPos = xPos * 400 * cos(ang2*r2)
            xPos = xPos + Double(SIZE) / 2
            
            var yPos = cos(ang1*r3)
            yPos = yPos * 400 * sin(ang2*r4)
            yPos = yPos + Double(SIZE) / 2
            
            let string = NSAttributedString(string: String(TEXT_POOL.randomElement()!))
            string.draw(at: CGPoint(x:xPos,y:yPos))
        }
    }
    
}

image

let data = image.pngData()

let folder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
// Output path for the file in the Documents folder
let filePath = folder!.appendingPathComponent("symbol1.png");

let err: ()? = try? data?.write(to: filePath)
print("err \(String(describing: err))\nfilePath \(filePath.absoluteString.dropFirst(7))")
// Terminal command string to copy output file to Downloads folder
print("cp \(filePath.absoluteString.dropFirst(7)) ~/Downloads/symbol1.png" )
