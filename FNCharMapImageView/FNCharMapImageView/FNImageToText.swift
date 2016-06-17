//
//  FNImageToText.swift
//  FNCharMapImageView
//
//  Created by Fnoz on 16/6/17.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

extension UIImage {
    func fn_toString(sharp:Float, fillWidth:Bool) -> String{
        var resultString = ""
        let pixelData=CGDataProviderCopyData(CGImageGetDataProvider(self.CGImage))
        let data:UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        var wNum = 100
        var hNum = 100
        if fillWidth {
            wNum = NSInteger(size.width * CGFloat(sharp) / 1.655)
            hNum = NSInteger(size.height * CGFloat(sharp))
        }
        else {
            wNum = NSInteger(size.width * CGFloat(sharp))
            hNum = NSInteger(size.height * 1.655 * CGFloat(sharp))
        }
        for i in 0...wNum-1 {
            for j in 0...hNum-1 {
                var count = 0
                var grayDegree = 0.0
                var kCount = self.size.width/CGFloat(hNum)
                if !fillWidth {
                    kCount = 1.655 * self.size.width/CGFloat(hNum)
                }
                for k in 0...Int(kCount)-1 {
                    for l in 0...Int(self.size.height/CGFloat(wNum))-1 {
                        let pos = CGPointMake(floor(self.size.width/CGFloat(hNum) * CGFloat(j) + CGFloat(k)), self.size.height/CGFloat(wNum) * CGFloat(i) + CGFloat(l))
                        if pos.x >= size.width || pos.y >= size.height {
                            continue
                        }
                        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
                        let r = Double(data[pixelInfo])
                        let g = Double(data[pixelInfo+1])
                        let b = Double(data[pixelInfo+2])
                        let a = Double(data[pixelInfo+3]) / Double(255.0)
                        grayDegree += (r + g + b) * a / 3
                        count += 1
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