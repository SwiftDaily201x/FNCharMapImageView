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
        let image = UIImage.init(named: "Gastly")
        let resultString = image?.fn_toString()
        print(resultString!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

