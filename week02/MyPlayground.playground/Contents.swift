import UIKit

let SIZE = 1024
let SYMBOL_SIZE = 16
let TEXT_POOL = "明月几时有把酒问青天不知天上宫阙今夕是何年我欲乘风归去又恐琼楼玉宇高处不胜寒起舞弄清影何似在人间转朱阁低绮户照无眠不应有恨何事长向别时圆人有悲欢离合月有阴晴圆缺此事古难全但愿人长久千里共婵娟"

/**
    苏轼
 
    明月几时有？
    把酒问青天。
    不知天上宫阙，
    今夕是何年。
    我欲乘风归去，
    又恐琼楼玉宇，
    高处不胜寒。
    起舞弄清影，
    何似在人间。

    转朱阁，
    低绮户，
    照无眠。
    不应有恨，
    何事长向别时圆？
    人有悲欢离合，
    月有阴晴圆缺，
    此事古难全。
    但愿人长久，
    千里共婵娟。
 
    Su Shi
 
    Bright moon, when wast thou made?
    Holding my cup, I ask of the blue sky.
    I know not in heaven’s palaces
    What year it is this night.
    I long to ride the wind and return;
    Yet fear that marble towers and jade houses,
    So high, are over-cold.
    I rise and dance and sport with limpid shades;
    Better far to be among mankind.

    Around the vermillion chamber,
    Down in the silken windows,
    She shines on the sleepless,
    Surely with no ill-will.
    Why then is the time of parting always at full moon?
    Man has grief and joy, parting and reunion;
    The moon has foul weather and fair, waxing and waning.
    In this since ever there has been no perfection.
    All I can wish is that we may have long life,
    That a thousand miles apart we may share her beauty.

    （Robert Kotewell & Norman Smith）
*/

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
