//
//  CoolImage.swift
//  Cool Stuff 1
//
//  Created by Ruofan Wang on 2024/9/24.
//
import UIKit
import SwiftUI

let TEXT_POOL = "明月几时有把酒问青天不知天上宫阙今夕是何年我欲乘风归去又恐琼楼玉宇高处不胜寒起舞弄清影何似在人间转朱阁低绮户照无眠不应有恨何事长向别时圆人有悲欢离合月有阴晴圆缺此事古难全但愿人长久千里共婵娟"

func renderImage(size: CGSize, r1: Double, r2: Double, r3:Double, r4:Double) -> UIImage {
    let renderer = UIGraphicsImageRenderer(size: size)
    let image = renderer.image { (context) in
        let rt = renderer.format.bounds
        UIColor.white.setFill()
        context.fill(rt)
        
        for n in 1...50 {
            let ang2 = Double(n) / Double(50) * Double(2) * Double.pi
            print(ang2)
            for i in 1...100 {
                let ang1 = Double(i) / Double(100) * Double(2) * Double.pi
                var xPos = sin(ang1*r1) * 400
                xPos *= cos(ang2*r2)
                xPos += Double(size.height) / 2
                
                var yPos = cos(ang1*r3) * 400
                yPos *= sin(ang2*r4)
                yPos += Double(size.width) / 2
                
                let string = NSAttributedString(string: String(TEXT_POOL.randomElement()!))
                string.draw(at: CGPoint(x:xPos,y:yPos))
            }
        }
    }
    
    return image
}

struct CoolImage: View {
    @Binding var r1: Double
    @Binding var r2: Double
    @Binding var r3: Double
    @Binding var r4: Double
    
    var body: some View {
        Image(uiImage: renderImage(size: CGSize(width: 1024, height: 1024), r1: r1, r2: r2, r3: r3, r4: r4))
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
