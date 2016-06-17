//
//  ViewController.swift
//  FNCharMapImageView
//
//  Created by Fnoz on 16/6/17.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sharp = 1.0
        
        let label = UILabel.init(frame: CGRectMake(20, 70, view.frame.size.width - 40, 40))
        label.text = NSString.init(format: "sharp = %f", sharp) as String
        label.textColor = UIColor.init(red: 42/255.0, green: 49/255.0, blue: 67/255.0, alpha: 1)
        label.textAlignment = .Center
        view.addSubview(label)
        
        let imageView = FNCharMapImageView.init(frame: CGRectMake(20, 100, view.frame.size.width - 40, view.frame.size.width - 40))
        view.addSubview(imageView)
        imageView.sharp = Float(sharp)
        imageView.image = UIImage.init(named: "qq")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

