//
//  ViewController.swift
//  FNImageToText
//
//  Created by Fnoz on 16/6/17.
//  Copyright © 2016年 Fnoz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = FNCharMapImageView.init(frame: CGRectMake(20, 100, view.frame.size.width - 40, view.frame.size.width - 40))
        view.addSubview(imageView)
        imageView.sharp = 0.3
        imageView.image = UIImage.init(named: "Gastly")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

