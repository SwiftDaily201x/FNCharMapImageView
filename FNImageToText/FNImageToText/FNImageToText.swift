//
//  FNImageToText.swift
//  FNImageToText
//
//  Created by Fnoz on 16/6/17.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

extension UIImage {
    func fn_toString() -> String{
        var resultString = ""
        let pixelData=CGDataProviderCopyData(CGImageGetDataProvider(self.CGImage))
        let data:UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        for i in 0...100 {
            for j in 0...100 {
                var count = 0
                var grayDegree = 0.0
                for k in 0...Int(self.size.width/100) {
                    for l in 0...Int(self.size.height/100) {
                        count += 1
                        let pos = CGPointMake(self.size.width/100 * CGFloat(j) + CGFloat(k), self.size.height/100 * CGFloat(i) + CGFloat(l))
                        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
                        let r = Double(data[pixelInfo])
                        let g = Double(data[pixelInfo+1])
                        let b = Double(data[pixelInfo+2])
                        let a = Double(data[pixelInfo+3]) / Double(255.0)
                        grayDegree += (r + g + b) * a / 3
                    }
                }
                let averageRGB = grayDegree/Double(count)
                resultString.appendContentsOf(fn_rgbToChar(averageRGB))
            }
            resultString.appendContentsOf("\n")
        }
        return resultString
    }
    
    func fn_rgbToChar(rgb:Double) -> String{
        if (rgb <= 30) {
            return "#"
        } else if (rgb > 30 && rgb <= 60) {
            return "&"
        } else if (rgb > 60 && rgb <= 120) {
            return "$"
        }  else if (rgb > 120 && rgb <= 150) {
            return "*"
        } else if (rgb > 150 && rgb <= 180) {
            return "o"
        } else if (rgb > 180 && rgb <= 210) {
            return "!"
        } else if (rgb > 210 && rgb <= 240) {
            return ";"
        }  else {
            return " "
        }
    }
}