//
//  FNCharMapImageView.swift
//  FNImageToText
//
//  Created by Fnoz on 16/6/18.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class FNCharMapImageView: UIView {
    var image:UIImage! {
        get {
            return _image
        }
        set {
            _image = newValue
            let resultString = newValue?.fn_toString(sharp, fillWidth: newValue.size.width / newValue.size.height < frame.size.width / frame.size.height)
            label.text = resultString
            
            if newValue.size.width / newValue.size.height < frame.size.width / frame.size.height {
                label.frame = CGRectMake(0, 0, frame.size.width, newValue.size.height / newValue.size.width * frame.size.width)
                label.center = CGPointMake(frame.size.width / 2, frame.size.height / 2)
                label.font = UIFont.init(name: "Courier", size: label.frame.size.width/(CGFloat(sharp) * newValue.size.width)*1.645)
            }
            else {
                label.frame = CGRectMake(0, 0, frame.size.height / newValue.size.width * newValue.size.height, frame.size.height)
                label.center = CGPointMake(frame.size.width / 2, frame.size.height / 2)
                label.font = UIFont.init(name: "Courier", size: label.frame.size.height/(CGFloat(sharp) * newValue.size.height))
            }
        }
    }
    private var _image:UIImage!
    
    var sharp:Float! {
        get {
            return _sharp
        }
        set {
            _sharp = newValue
            if _image != nil {
                image = _image
            }
        }
    }
    private var _sharp:Float! = 0.3
    
    var label:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView(frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(frame: CGRect) {
        clipsToBounds = true
        label = UILabel.init(frame: self.bounds)
        label.numberOfLines = 0
        addSubview(label)
    }
    
}